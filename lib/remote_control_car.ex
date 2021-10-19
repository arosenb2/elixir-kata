defmodule RemoteControlCar do
  @moduledoc false

  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new() do
    %RemoteControlCar{
      nickname: "none"
    }
  end

  def new(nickname) do
    %RemoteControlCar{
      nickname: nickname
    }
  end

  def display_distance(%RemoteControlCar{} = remote_car) do
    "#{remote_car.distance_driven_in_meters} meters"
  end

  def display_battery(%RemoteControlCar{battery_percentage: 0}) do
    "Battery empty"
  end

  def display_battery(%RemoteControlCar{} = remote_car) do
    "Battery at #{remote_car.battery_percentage}%"
  end

  def drive(%RemoteControlCar{battery_percentage: battery, distance_driven_in_meters: distance} = remote_car) do
    case battery do
      0 -> remote_car
      _ -> %{
        remote_car |
        battery_percentage: battery - 1,
        distance_driven_in_meters: distance + 20
      }
    end
  end
end
