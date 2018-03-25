defmodule ChuckNorris do
  @moduledoc """
  Application that consumes and maintain jokes of
  api.chucknorris.io
  """
  use Application

  def start(_type, _args) do
    ChuckNorris.Supervisor.start_link()
  end
end
