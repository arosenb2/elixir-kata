defmodule TakeANumber do

  @initial_number 0

  def start() do
    spawn(fn -> loop(@initial_number) end)
  end

  def loop(num) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, num)
        loop(num)
      {:take_a_number, sender_pid} ->
        next_num = num + 1
        send(sender_pid, next_num)
        loop(next_num)
      :stop ->
        :noop
      _ -> loop(num)
    end
  end
end
