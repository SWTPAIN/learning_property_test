defmodule LearningPropertyTestTest do
  use ExUnit.Case, async: false
  use ExCheck

  property "x + 1 is always greater than x" do
    for_all x in int(), do: x + 1 >= x
  end

end
