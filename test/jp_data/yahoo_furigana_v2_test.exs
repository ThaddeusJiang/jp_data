defmodule JpData.YahooFuriganaV2Test do
  use ExUnit.Case

  test "furigana(日本語) should be にほんご" do
    assert "にほんご" = JpData.YahooFuriganaV2.furigana("日本語")
  end
end
