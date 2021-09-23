defmodule FreelancerRates do
  @doc """
  iex> FreelancerRates.daily_rate(50)
  400.0

  iex> FreelancerRates.daily_rate(60)
  480.0

  iex> FreelancerRates.daily_rate(55.1)
  440.8
  """
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  @doc """
  iex> FreelancerRates.apply_discount(140.0, 10)
  126.0

  iex> FreelancerRates.apply_discount(100, 10)
  90.0
  """
  def apply_discount(before_discount, discount) do
    before_discount - (before_discount * (discount / 100))
  end

  @doc """
  iex> FreelancerRates.monthly_rate(62, 0.0)
  10912

  iex> FreelancerRates.monthly_rate(70, 0.0)
  12320

  iex> FreelancerRates.monthly_rate(62.8, 0.0)
  11053

  iex> FreelancerRates.monthly_rate(65.2, 0.0)
  11476

  iex> FreelancerRates.monthly_rate(67, 12.0)
  10377
  """
  def monthly_rate(hourly_rate, discount) do
    (daily_rate(hourly_rate) * 22)
    |> apply_discount(discount)
    |> Float.ceil
    |> trunc
  end

  @doc """
  iex> FreelancerRates.days_in_budget(1600, 50, 0.0)
  4.0

  iex> FreelancerRates.days_in_budget(520, 65, 0.0)
  1.0

  iex> FreelancerRates.days_in_budget(4410, 55, 0.0)
  10.0

  iex> FreelancerRates.days_in_budget(4480, 55, 0.0)
  10.1

  iex> FreelancerRates.days_in_budget(480, 60, 20)
  1.2
  """
  def days_in_budget(budget, hourly_rate, discount) do
    (budget / ((100 - discount) / 100) / daily_rate(hourly_rate))
    |> Float.floor(1)
  end
end
