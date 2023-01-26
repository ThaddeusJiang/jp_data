defmodule JpDataWeb.Router do
  use JpDataWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {JpDataWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    # add the rate limit plug here
    plug JpData.Utils.RateLimit
    plug :accepts, ["json"]
  end

  scope "/", JpDataWeb do
    pipe_through :browser

    get "/", PageController, :home
  end

  # Other scopes may use custom stacks.
  scope "/api/v1", JpDataWeb do
    pipe_through :api

    get "/moji", MojiController, :moji
    get "/zipcode", ZipcodeController, :zipcode
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:jp_data, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: JpDataWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
