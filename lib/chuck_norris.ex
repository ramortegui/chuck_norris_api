defmodule ChuckNorris do
  @moduledoc """
  Application that consumes and maintain jokes of
  api.chucknorris.io
  """
  use Application

  def start(_type, _args) do
    IO.puts "Starting the application"
    ChuckNorris.Supervisor.start_link()
  end
end
