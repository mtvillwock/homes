defmodule HomeApi.Repo do
  use Ecto.Repo,
    otp_app: :home_api,
    adapter: Ecto.Adapters.Postgres
end
