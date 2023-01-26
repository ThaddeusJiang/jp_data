defmodule JpDataWeb.ZipcodeControllerTest do
  use JpDataWeb.ConnCase

  test "GET /zipcode?q=2440817 should be 200", %{conn: conn} do
    conn = get(conn, ~p"/api/v1/zipcode?q=2440817")

    assert json_response(conn, 200) == %{
             "city" => "横浜市戸塚区",
             "city_kana" => "ﾖｺﾊﾏｼﾄﾂｶｸ",
             "pref" => "神奈川県",
             "pref_kana" => "ｶﾅｶﾞﾜｹﾝ",
             "town" => "吉田町",
             "town_kana" => "ﾖｼﾀﾞﾁｮｳ",
             "zipcode" => "2440817"
           }
  end

  test "GET /zipcode?q=244-0817 should be 200", %{conn: conn} do
    conn = get(conn, ~p"/api/v1/zipcode?q=244-0817")

    assert json_response(conn, 200) == %{
             "city" => "横浜市戸塚区",
             "city_kana" => "ﾖｺﾊﾏｼﾄﾂｶｸ",
             "pref" => "神奈川県",
             "pref_kana" => "ｶﾅｶﾞﾜｹﾝ",
             "town" => "吉田町",
             "town_kana" => "ﾖｼﾀﾞﾁｮｳ",
             "zipcode" => "2440817"
           }
  end

  test "GET /zipcode?q=244 should be 404", %{conn: conn} do
    conn = get(conn, ~p"/api/v1/zipcode?q=244")

    assert json_response(conn, 404) == %{
             "message" => "Not Found",
             "status_code" => 404,
             "status_message" => "Not Found"
           }
  end

  test "GET /zipcode?q= should be 400", %{conn: conn} do
    conn = get(conn, ~p"/api/v1/zipcode?q=")

    assert json_response(conn, 400) == %{
             "message" => "Bad Request",
             "status_code" => 400,
             "status_message" => "Bad Request"
           }
  end

  test "GET /zipcode should be 400", %{conn: conn} do
    conn = get(conn, ~p"/api/v1/zipcode")

    assert json_response(conn, 400) == %{
             "message" => "Bad Request",
             "status_code" => 400,
             "status_message" => "Bad Request"
           }
  end
end
