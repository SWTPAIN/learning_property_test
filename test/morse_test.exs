defmodule MorseTest do
  use ExUnit.Case, async: false
  use ExCheck

  @valid_letters  Morse.letter_to_morse |> Map.keys
  @valid_morses  Morse.letter_to_morse |> Map.values


  property "encode and decode return the same string if string only contain valid letter" do
    for_all letters in list(elements(@valid_letters)) do
      sentence = letters |> Enum.join
      sentence |> Morse.encode() |> elem(1) |> Morse.decode() |> elem(1) == sentence
    end
  end

  property "decode and encode return the same morses if string only contain valid morses" do
    for_all morses in list(elements(@valid_morses)) do
      morses_sentence = morses |> Enum.join(" ")
      morses_sentence |> Morse.decode() |> elem(1) |> Morse.encode() |> elem(1) == morses_sentence
    end
  end

end
