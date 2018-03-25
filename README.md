# ChuckNorris

OTP application to consume [https://api.chucknorris.io](https://api.chucknorris.io)

##

## Installation

The package can be installed by adding `chuck_norris` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:chuck_norris, "~> 0.1.0"}
  ]
end
```
## Use

If added as dependency the server will start ChuckNorris.Server and load a joke
for each category that could be accessed by:

```elixir

iex> ChuckNorris.Server.get_jokes

```

The jokes will be refreshed each 5 min.


## Documentation

[https://hexdocs.pm/chuck_norris](https://hexdocs.pm/chuck_norris).

