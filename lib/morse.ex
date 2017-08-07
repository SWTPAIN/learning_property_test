defmodule Morse do
  @letter_to_morse %{
    "a" => ".-",
    "b" => "-...",
    "c" => "-.-.",
    "d" => "-..",
    "e" => ".",
    "f" => "..-.",
    "g" => "--.",
    "h" => "....",
    "i" => "..",
    "j" => ".---",
    "k" => "-.-",
    "l" => ".-..",
    "m" => "--",
    "n" => "-.",
    "o" => "---",
    "p" => ".--.",
    "q" => "--.-",
    "r" => ".-.",
    "s" => "...",
    "t" => "-",
    "u" => "..-",
    "v" => "...-",
    "w" => ".--",
    "x" => "-..-",
    "y" => "-.--",
    "z" => "--..",
    "1" => ".----",
    "2" => "..---",
    "3" => "...--",
    "4" => "....-",
    "5" => ".....",
    "6" => "-....",
    "7" => "--...",
    "8" => "---..",
    "9" => "----.",
    "0" => "-----"
  }

  @morseToLetter @letter_to_morse |> Enum.reduce(%{}, fn({k, v},acc) -> Map.put(acc, v, k) end)

  def encode(string) when is_binary(string) do
    morses = string |> String.codepoints |> Enum.map(&(@letter_to_morse[&1]))
    if Enum.any? morses, &is_nil/1 do
      {:error, "There are unkown characters"}
    else
      {:ok, Enum.join(morses, " ")}
    end
  end

  def decode(string) do
    letters = string |> String.split |> Enum.map(&(@morseToLetter[&1]))
    if Enum.any? letters, &is_nil/1 do
      {:error, "There are unkown morse"}
    else
      {:ok, Enum.join(letters, "")}
    end
  end

  def letter_to_morse, do: @letter_to_morse
end
