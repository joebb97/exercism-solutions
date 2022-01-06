defmodule BirdCount do
  def today(list) do
    List.first(list)
  end

  def increment_day_count(list) do
    case list do
      [head | tl] when list != nil and list != [] -> [head + 1 | tl]
      _ -> [1]
    end
  end

  def has_day_without_birds?(list) do
    0 in list
  end

  def total([]), do: 0
  def total([head | tail]), do: head + total(tail)

  def busy_days([]), do: 0
  def busy_days([head | tail]) do
    if head >= 5 do
      1 + busy_days(tail)
    else
      busy_days(tail)
    end

  end
end
