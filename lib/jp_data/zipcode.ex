defmodule JpData.Zipcode do
  alias JpData.Address.Zipcode

  def search(q) do
    zipcode = String.replace(q, "-", "")
    #  Repo.one by zipcode
    JpData.Address.Zipcode
    |> JpData.Repo.get_by(zipcode: zipcode)
  end
end
