defmodule ChuckNorris.Server do
  @moduledoc """
  Server to consulme `ChuckNorris.API`
  """

  @interval :timer.hours(1)

  def start_link() do
    GenServer.start_link(__MODULE__, %{categories: [], jokes: []}, name: __MODULE__)
  end

  def init(_state) do
    new_state = refresh_state()
    Process.send_after(self(), :refresh_state, @interval)
    {:ok, new_state}
  end

  @doc """
  Refresh state
  """
  def update_info do
    GenServer.cast(__MODULE__, :refresh_state)
  end

  @doc """
  Get jokes
  """
  def get_jokes do
    GenServer.call(__MODULE__, :get_jokes)
  end

  def handle_cast(:refresh_state, _state) do
    new_state = refresh_state()
    {:noreply, new_state}
  end

  def handle_call(:get_jokes, _from, state) do
    {:reply, state[:jokes], state}
  end

  def handle_info(:refresh_state, _state) do
    schedule_refresh()
    {:noreply, refresh_state()}
  end

  defp schedule_refresh do
    Process.send_after(self(), :refresh_state, @interval)
  end

  defp refresh_state do
    categories =
      Task.async(fn -> ChuckNorris.API.categories() end)
      |> Task.await()

    jokes =
      categories
      |> Enum.map(&Task.async(fn -> ChuckNorris.API.get_joke(&1) end))
      |> Enum.map(&Task.await/1)

    %{categories: categories, jokes: jokes}
  end
end
