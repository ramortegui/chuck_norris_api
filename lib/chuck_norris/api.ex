defmodule ChuckNorris.API do
  @moduledoc "API consumer of https://api.chucknorris.io"
  @url "https://api.chucknorris.io/jokes/"

  @doc """
   Returns a list of categories of Chuck Norris jokes
  """
  def categories do
    HTTPoison.get!(@url <> "categories")
    |> handle_request
    |> Poison.decode!()
  end

  @doc """
    Returns a tuple with the category an a random joke
  """
  def get_joke(category) do
    joke =
      HTTPoison.get!(@url <> "random?category=#{category}")
      |> handle_request
      |> Poison.decode!()
      |> get_value

    {category, joke}
  end

  @doc """
    Get the value of the api response
  """
  def get_value(data), do: data["value"]

  @doc """
    Returns the body of the request if status code
    is 200
  """
  def handle_request(%{status_code: 200} = response) do
    response.body
  end

  @doc """
    Returns Not found message for 404 responses
  """
  def handle_request(%{status_code: 404}) do
    "{ \"value\": \"Not found.\" }"
  end
end
