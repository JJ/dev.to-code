defprotocol Stringifier do
  @doc "Can convert to string using tostring"
  def tostring( whatever)
end

defmodule Span do
  @doc "A few words"
  defstruct words: []
end

defimpl Stringifier, for: Span do
  def tostring(span), do: Enum.join(span.words," ")
end

defmodule Quoted do
  @doc "A few words and a quote"
  defstruct words: [], quote: "em"

  def i(string, quote) do
    "<#{quote}> #{string} </#{quote}>"
  end
end

defimpl Stringifier, for: Quoted do
  def tostring(quoted), do: Quoted.i(Enum.join(quoted.words," "),quoted.quote)
end

defmodule Main do
  def main do
    words = %Span{words: ["A","few","words"]}
    IO.puts(Stringifier.tostring(words))
    quoted = %Quoted{words: ["More","words"], quote: "em"}
    IO.puts(Stringifier.tostring(quoted))
  end
end

Main.main
