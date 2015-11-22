defmodule CropYieldTest do
  use ExUnit.Case, async: false

  import CropYield

  test "yield of 2 and 1 is picked, stays at 2" do
    assert next_yield(2, 1) == 2
  end

  test "yield of 2 and 2 is picked, stays at 2" do
    assert next_yield(2, 2) == 2
  end

  test "yield of 2 and 3 is picked, it rises to 3" do
    assert next_yield(2, 3) == 3
  end

  test "yield of 6 and 1 is picked, drops to 5" do
    assert next_yield(6, 1) == 5
  end

  test "yield of 6 and 2 is picked, stays at 6" do
    assert next_yield(6, 2) == 6
  end

  test "yield of 6 and 3 is picked, it rises to 6" do
    assert next_yield(6, 3) == 6
  end

end
