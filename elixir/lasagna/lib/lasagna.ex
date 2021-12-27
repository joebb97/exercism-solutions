defmodule Lasagna do
  def expected_minutes_in_oven(), do: 40

  def remaining_minutes_in_oven(total_thus_far), do: expected_minutes_in_oven() - total_thus_far

  def preparation_time_in_minutes(layers), do: layers * 2

  def total_time_in_minutes(layers, total_thus_far) do
    preparation_time_in_minutes(layers) +  total_thus_far
  end

  def alarm, do: "Ding!"
end
