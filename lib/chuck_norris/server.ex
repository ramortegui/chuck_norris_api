defmodule ChuckNorris.Server do
  @moduledoc """
  Server to consulme `ChuckNorris.API`
  """
  def start_link() do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def init(_state) do
    {:ok, refresh_state()}
  end

  def refresh_state do
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
