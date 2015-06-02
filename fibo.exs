defmodule Fibo do

  def fib(x) when x < 0 do
    raise "NO."
  end
  def fib(0), do: 0
  def fib(1), do: 1
  def fib(n) do
    fib(n-1) + fib(n-2)
  end

end