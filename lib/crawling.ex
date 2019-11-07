defmodule Crawling do
  @moduledoc """
  Documentation for Crawling.
  """

  def get_url() do
    case HTTPoison.get("https://elixir-lang.org") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        urls =
            body
            |> Floki.find("a")
            |> Floki.attribute("href")
        {:ok, urls}
        
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
        end
  end

  def get_assets_img() do
    case HTTPoison.get("https://elixir-lang.org") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        assets =
            body
            |> Floki.find("img")
        {:ok, assets}

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
        end
  end


  def get_assets_js() do
    case HTTPoison.get("https://elixir-lang.org") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        assets =
            body
            |> Floki.find("script")
        {:ok, assets}

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
        end
  end

  def get_assets_css() do
    case HTTPoison.get("https://elixir-lang.org") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        assets =
            body
            |> Floki.find("div")
        {:ok, assets}

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason

        end
  end
  
  # A ideia aqui, seria pegar o body, iterar sobre cada url e retornar as respectivas chamadas para os assets, por exemplo.
  def get_urls_html_body(urls) do
    urls
    |> Enum.map(fn(url) -> HTTPoison.get!(url) end)
  end
  # Aqui, fazer uma função para imprimir os css, img e scripts
   def get_title(body) do
              body
              |> Floki.attribute("class", "h4")
              |> Floki.text(sep: "+")
              |> String.split("+")
   end

   def get_body_contents() do
     assets =
         get_url()
         |> Enum.map(fn body ->
           %{
             css: get_title(body),
             images: get_title(body),
             javascript: get_title(body)
           }
         end
         )

     {:ok, assets}
   end
   # E aqui pra deixar mais elegante
   def show_assets({_, assets}) do
     assets
     |> Enum.map(fn s ->
       IO.puts s.css
       IO.puts s.images
       IO.puts s.javascript
     end
     )
   end

end
