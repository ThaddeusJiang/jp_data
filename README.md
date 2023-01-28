# Japan Data

[![Fly Deploy](https://github.com/ThaddeusJiang/jp_data/actions/workflows/fly.yml/badge.svg)](https://github.com/ThaddeusJiang/jp_data/actions/workflows/fly.yml)
[![Elixir CI](https://github.com/ThaddeusJiang/jp_data/actions/workflows/elixir.yaml/badge.svg)](https://github.com/ThaddeusJiang/jp_data/actions/workflows/elixir.yaml)
[![codecov](https://codecov.io/github/ThaddeusJiang/jp_data/branch/main/graph/badge.svg?token=e63MmlDAiZ)](https://codecov.io/github/ThaddeusJiang/jp_data)

## Features

- [x] Japan 文字 Data Service https://japan-data.fly.dev/api/v1/moji?q=<日本語単語や長文>
- [x] Japan 郵便 Data Service https://japan-data.fly.dev/api/v1/zipcode?q=<郵便番号>
- [x] Japan 金融機関 Data Service https://japan-data.fly.dev/api/v1/banks
  - [x] 金融機関 https://japan-data.fly.dev/api/v1/banks/:bank_code
  - [x] 支店 https://japan-data.fly.dev/api/v1/banks/:bank_code/branches
- [ ] Japan 日付 Data Service, how many days you have to work, and is it a holiday?
- [ ] Japan 人事 Data Service

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).
