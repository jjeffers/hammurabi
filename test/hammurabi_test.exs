defmodule HammurabiTest do
  use ExUnit.Case

  import Hammurabi

  test "100 people fed no food will starve to 0" do
    assert simulate_one_year(100, 0) == 0
  end

  test "100 people fed 1 bushel of grain will starve to 0" do
    assert simulate_one_year(100, 1) == 0
  end

  test "100 people fed 20 bushels of grain will starve to 1" do
    assert simulate_one_year(100, 20) == 1
  end

  test "100 people fed 100*20 bushels of grain will stay the same" do
    assert simulate_one_year(100, 100*20) == 100
  end

  test "100 people fed 100*20+1 bushels of grain will stay the same" do
    assert simulate_one_year(100, 100*20+1) == 100
  end

  test "100 people fed 100*20+20 bushels of grain grow by 1" do
    assert simulate_one_year(100, 100*20+20) == 101
  end

  test "harvesting 1000 acres with a yield per acre of 2 gets 2000 bushels of grain" do
    assert harvest(1000, 1000, 2) == 2000
  end

  test "harvesting 1000 acres with a yield per acre of 0 gets 0 bushels of grain" do
    assert harvest(1000, 1000, 0) == 0
  end

  test "harvesting 1000 acres with only 800 harvestable acres with a yield per acre of 2 gets 1600 bushels of grain" do
    assert harvest(1000, 800, 2) == 1600
  end

  test "harvesting 800 acres with more then 800 harvestable acres with a yield per acre of 2 gets 1600 bushels of grain" do
    assert harvest(800, 1000, 2) == 1600
  end
end
