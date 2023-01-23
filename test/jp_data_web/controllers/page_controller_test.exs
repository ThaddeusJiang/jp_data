defmodule JpDataWeb.PageControllerTest do
  use JpDataWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, ~p"/")
    assert html_response(conn, 200) =~ "Peace of mind from prototype to production"
  end

  test "moji?q=日本語", %{conn: conn} do
    conn = get(conn, ~p"/api/v1/moji?q=日本語")

    assert json_response(conn, 200) == %{
             "hiragana" => "にほんご",
             "katakana" => "ニホンゴ",
             "kanji" => "日本語",
             "half_katakana" => "ﾆﾎﾝｺﾞ",
             "half_alphanumeric" => "nihonngo",
             "alphanumeric" => "ｎｉｈｏｎｎｇｏ"
           }
  end
end
