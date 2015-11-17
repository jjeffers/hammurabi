defmodule Hammurabi do

  def main(args) do
    :random.seed(:erlang.now)
    args
      |> parse_args
    simulate_years(10)
  end

  defp parse_args(args) do
    # Covering only expected arguments. We can add code to handle cases when unexpected arguments are passed or help text etc.
    # Checkout OptionParser lib for details.
    {_, [str], _} = OptionParser.parse(args)
    str
  end

  def simulate_one_year(starting_population, bushels_of_grain) do
    new_population = round(bushels_of_grain / 20)
  end

  def acres_harvested(bushels_of_grain_to_plant) do
    round(bushels_of_grain_to_plant/2)
  end

  def harvest(acres_available_to_plant, acres_harvested,
    yield_per_acre) when
      acres_harvested >= acres_available_to_plant do
        acres_available_to_plant*yield_per_acre
      end

  def harvest(acres_available_to_plant, acres_harvested,
    yield_per_acre) when acres_available_to_plant <= 0 do
      0
    end

  def harvest(acres_available_to_plant, acres_harvested,
    yield_per_acre)  do
      acres_harvested*yield_per_acre
    end

  def generate_yield_per_acre do
    Enum.random(2..6)
  end

  def simulate_years(number_of_years) when number_of_years > 0 do
    simulate_years(1, number_of_years,
      %{ acres: 1000, population: 100, bushels_of_grain: 4000 })
  end

  def simulate_years(_current, 0, state) do
    IO.puts "In the final year #{_current} of your reign, our kingdom had "
    IO.puts "#{state[:acres]} acres and "
    IO.puts "#{state[:population]} subjects and "
    IO.puts "#{state[:bushels_of_grain]} bushels of grain"
  end

  def simulate_years(_current, 0, %{ :population => 0}) do
    IO.puts "Our last subject starved to death!"
  end

  def simulate_years(current, remaining_number_of_years, state) do
    IO.puts "In year #{current} our kingdom had "
    IO.puts "#{state[:acres]} acres and "
    IO.puts "#{state[:population]} subjects and "
    IO.puts "#{state[:bushels_of_grain]} bushels of grain"

    for_food = IO.gets("How many bushels of grain shall we feed to the people? (0-#{state[:bushels_of_grain]}) ") |> String.strip |> String.to_integer()
    for_planting = IO.gets("How many bushels of grain shall we plant? (0-#{state[:bushels_of_grain] - for_food}) ") |> String.strip |> String.to_integer()

    IO.puts "We granted #{for_food} bushels of grain to our subjects to eat"
    IO.puts "We planted #{for_planting} bushels of grain for next year"
    IO.puts "\n"

    simulate_years(current+1, remaining_number_of_years-1,
      %{ population: simulate_one_year(state[:population], for_food),
        acres: state[:acres],
        bushels_of_grain: harvest(state[:acres], acres_harvested(for_planting), generate_yield_per_acre()) })

  end
end
