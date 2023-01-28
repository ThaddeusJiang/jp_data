defmodule JpData.Banks do
  alias JpData.Repo
  alias JpData.Banks.Bank

  import Ecto.Query

  def list do
    Repo.all(
      from(b in Bank,
        order_by: [asc: b.code]
      )
    )
  end

  def read_banks_data do
    {:ok, file_content} = File.read(Path.join(:code.priv_dir(:jp_data), "data/banks/banks.json"))
    {:ok, %{"items" => items}} = Poison.decode(file_content)

    Enum.map(items, fn item ->
      %{
        code: item["code"],
        name: item["name"]
      }
    end)

    Enum.each(items, fn item ->
      Repo.insert!(%JpData.Banks.Bank{
        id: item["code"],
        code: item["code"],
        name: item["name"]
      })
    end)
  end
end
