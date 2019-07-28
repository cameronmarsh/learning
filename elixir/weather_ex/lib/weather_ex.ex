defmodule WeatherEx do
  @moduledoc """
  Documentation for WeatherEx.
  """

  def temperature_of(cities) do
    coordinator_pid = spawn(WeatherEx.Coordinator, :loop, [[], Enum.count(cities)])

    Enum.each(cities, fn city ->
      worker_pid = spawn(WeatherEx.Worker, :loop, [])
      send(worker_pid, {coordinator_pid, city})
    end)
  end
end
