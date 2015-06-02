defmodule Sum do

  def sum(x) do
    do_sum(x, 0)
  end

  def do_sum([], acc) do
    acc
  end
  def do_sum([ head | tail ], acc) do
    do_sum(tail, head + acc)
  end

end
