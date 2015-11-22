defmodule CropYield do


  def next_yield(current_yield, pick \\ Enum.random(1..3)) do
    _next_yield(current_yield, pick)
  end

  defp _next_yield(current_yield, pick) when current_yield >= 2 and current_yield <= 6 do
    adjust_yield(current_yield, pick)
  end

  defp _next_yield(current_yield, pick) when current_yield < 2 do
    adjust_yield(2, pick)
  end

  defp _next_yield(current_yield, pick) when current_yield > 6 do
    adjust_yield(6, pick)
  end

  defp adjust_yield(n, 2) do
    n
  end

  defp adjust_yield(2, 1) do
    2
  end

  defp adjust_yield(6, 3) do
    6
  end

  defp adjust_yield(n, 3) do
    n + 1
  end

  defp adjust_yield(n, 1) do
    n - 1
  end



end
