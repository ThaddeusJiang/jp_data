defmodule JpDataWeb.MojiControllerTest do
  use JpDataWeb.ConnCase

  test "GET /moji?q=日本語 should be 200", %{conn: conn} do
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

  test "GET /moji?q=English should be 200", %{conn: conn} do
    conn = get(conn, ~p"/api/v1/moji?q=English")

    assert json_response(conn, 200) == %{
             "alphanumeric" => "Ｅｎｇｌｉｓｈ",
             "half_alphanumeric" => "English",
             "half_katakana" => "English",
             "hiragana" => "English",
             "kanji" => "English",
             "katakana" => "English"
           }
  end

  test "GET /moji?q= should be 400", %{conn: conn} do
    conn = get(conn, ~p"/api/v1/moji?q=")

    assert json_response(conn, 400) == %{
             "message" => "Bad Request",
             "status_code" => 400,
             "status_message" => "Bad Request"
           }
  end

  test "GET /moji should be 400", %{conn: conn} do
    conn = get(conn, ~p"/api/v1/moji")

    assert json_response(conn, 400) == %{
             "message" => "Bad Request",
             "status_code" => 400,
             "status_message" => "Bad Request"
           }
  end
end
