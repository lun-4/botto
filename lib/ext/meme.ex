defmodule Botto.Memes do
  alias Alchemy.Client

  defmodule Commands do
    use Alchemy.Cogs

    Cogs.def meme() do
      Cogs.say "testing from another cog"
    end

    Cogs.def xkcd() do
      Client.trigger_typing message.channel_id
      raw = HTTPoison.get! "https://xkcd.com/info.0.json"
      {:ok, comic_data} = Poison.decode raw.body
      Cogs.say comic_data["img"]
    end

    Cogs.def xkcd(num) do
      Client.trigger_typing message.channel_id

      raw = HTTPoison.get! "https://xkcd.com/#{num}/info.0.json"

      case Poison.decode raw.body do
        {:ok, comic_data} -> Cogs.say comic_data["img"]
        {:error, err} -> Cogs.say "Error while decoding: #{inspect err}"
        _ -> Cogs.say "how did this happen??(not supposed to happen piece of code)"
      end

    end

    Cogs.def embed do
      %Embed{title: "The best EMbed suck my dick...",
             description: "fuck slice 2017",
             image: "https://phoxgirls.are-pretty.sexy/d23c39.png"}
      |> Embed.send
    end

  end
end

