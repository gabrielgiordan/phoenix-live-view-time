defmodule LiveView.Repo do
  use Ecto.Repo,
    otp_app: :live_view,
    adapter: Ecto.Adapters.Postgres
end
