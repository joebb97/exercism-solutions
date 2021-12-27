defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount * (1.0 - (discount / 100.0))
  end

  def monthly_rate(hourly_rate, discount) do
    ret = daily_rate(hourly_rate) * 22
    apply_discount(ret, discount) |> ceil
  end

  def days_in_budget(budget, hourly_rate, discount) do
    mr = monthly_rate(hourly_rate, discount)
    days = (budget / mr) * 22
    # One decimal place
    prec = 1
    Float.floor(days, prec)
  end
end
