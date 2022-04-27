defmodule SampleCodeElixirTest do
  use ExUnit.Case
  doctest SampleCodeElixir

  test "run" do
    assert SampleCodeElixir.run() == {:ok}
  end

  test  "generate_data" do
    res = SampleCodeElixir.generate_data(1440)
    assert length(res) == 1440

    res = SampleCodeElixir.generate_data(900)
    assert length(res) == 900
  end
end
