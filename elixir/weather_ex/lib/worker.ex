defmodule WeatherEx.Worker do

  def loop do
    receive do
      {sender_pid, location} ->
        send(sender_pid, {:ok, temperature_of(location)})

      _ ->
        IO.puts("Don't know how to process this message")
    end
    loop
  end

  def temperature_of(location) do
    result =
      location
      |> url_for()
      |> HTTPoison.get()
      |> parse_response()

    case result do
      {:ok, temp} -> "#{location}: #{temp} degrees"
      :error -> "#{location} not found"
    end
  end

  defp url_for(location) do
    location = URI.encode(location)
    "http://api.openweathermap.org/data/2.5/weather?q=#{location}&appid=#{apiKey()}&units=imperial"
  end

  defp parse_response({:ok, %HTTPoison.Response{body: body, status_code: 200}}) do
    body
    |> JSON.decode!()
    |> compute_temperature()
  end

  defp parse_response(_) do
    :error
  end

  defp compute_temperature(json) do
    try do
      temp = (json["main"]["temp"]) |> Float.round(1)
      {:ok, temp}
    rescue
      _ -> :error
    end
  end

  defp apiKey() do
    "44b79001ae33240447cfb63aa0628d78"
  end

end
