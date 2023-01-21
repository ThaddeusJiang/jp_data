defmodule JpData.YahooJlpJimV2Test do
  use ExUnit.Case

  test "conversion(にほんご)" do
    assert %{
             "hiragana" => "にほんご",
             "katakana" => "ニホンゴ",
             "kanji" => "日本語",
             "half_katakana" => "ﾆﾎﾝｺﾞ",
             "half_alphanumeric" => "nihonngo",
             "alphanumeric" => "ｎｉｈｏｎｎｇｏ"
           } = JpData.YahooJlpJimV2.conversion("にほんご")
  end
end
