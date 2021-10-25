defmodule LibraryFees do
  @moduledoc false

  @day_in_seconds 24 * 60 * 60
  def datetime_from_string(string), do: NaiveDateTime.from_iso8601!(string)

  def before_noon?(datetime), do: NaiveDateTime.to_time(datetime).hour < 12

  def return_date(checkout_datetime) do
    days_to_add = cond do
      before_noon?(checkout_datetime) -> 28
      true -> 29
    end
    NaiveDateTime.add(checkout_datetime, @day_in_seconds * days_to_add)
    |> NaiveDateTime.to_date()
  end

  def days_late(planned_return_date, actual_return_datetime) do
    days = Date.diff(NaiveDateTime.to_date(actual_return_datetime), planned_return_date)
    case days do
      diff when diff <= 0 -> 0
      _ -> days
    end
  end

  def monday?(datetime) do
    day = NaiveDateTime.to_date(datetime)
          |> Date.day_of_week()
    day == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout_datetime = datetime_from_string(checkout)
    return_datetime = datetime_from_string(return)
    num_days_late = days_late(return_date(checkout_datetime), return_datetime)
    case monday?(return_datetime) do
      true -> Float.floor(rate * 0.5 * num_days_late)
      _ -> rate * num_days_late
    end
  end
end
