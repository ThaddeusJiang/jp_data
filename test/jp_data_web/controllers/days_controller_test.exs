defmodule JpDataWeb.DaysControllerTest do
  use JpDataWeb.ConnCase

  test "GET /holidays", %{conn: conn} do
    JpData.Days.HolidayFixture.holiday_fixture()

    conn = get(conn, ~p"/api/v1/holidays")

    assert json_response(conn, 200) == %{
             "items" => [
               %{
                 "day" => "2023-01-01",
                 "name" => "元日"
               }
             ]
           }
  end
end
