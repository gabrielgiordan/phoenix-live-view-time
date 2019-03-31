defmodule LiveViewWeb.CounterLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    It's <%= @time %>
    """
  end

  @timeout Float.round(1_000_000 / 60) |> trunc


  def mount(_session, socket) do
    if connected?(socket) do
      #:timer.send_interval(1, self(), :update)
      MicroTimer.send_every(@timeout, :update)
    end

    {:ok, assign(socket, :time, milis())}
  end

  def handle_info(:update, socket) do
    {:noreply, assign(socket, :time, milis())}
  end

  defp milis() do
    #:erlang.system_time
    :erlang.system_time
  end
end
