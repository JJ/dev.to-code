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


defmodule Main do
  def main do
    words = %Span{words: ["A","few","words"]}
    IO.puts(words.words)
    IO.puts(Stringifier.tostring(words))
  end
end

Main.main
