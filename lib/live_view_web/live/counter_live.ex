defmodule LiveViewWeb.CounterLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <div>
      <p>:erlang.system_time = <br/><%= @erlang_system_time %></p>
      <p>DateTime.from_unix = <br/><%= @date_system_time %></p>
    </div>
    """
  end

  @timeout Float.round(1_000_000 / 60) |> trunc
  def mount(_session, socket) do
    connected?(socket) && MicroTimer.send_every(@timeout, :update)
    {:ok, update_socket(socket)}
  end

  def handle_info(:update, socket) do
    {:noreply, update_socket(socket)}
  end

  defp update_socket(socket) do
    socket
    |> assign(:erlang_system_time, get_erlang_system_time())
    |> assign(:date_system_time, get_date_system_time())
  end

  defp get_erlang_system_time() do
    :erlang.system_time
  end

  defp get_date_system_time() do
    :erlang.system_time
    |> DateTime.from_unix!(:native)
  end
end
