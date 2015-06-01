defmodule Parallel do

  def pmap(collection, func) do
    collection
    |> Enum.map(&(do_async(func, &1)))
    |> Enum.map(&Task.await/1)
  end

  def do_async(func, val) do
    Task.async(fn -> func.(val) end)
  end

  def run(range) do
    range |> pmap(fn item -> item * item end)
  end

  def run(range, func) do
    range |> pmap(func)
  end

  def normal_map(range, func) do
    range
    |> Enum.map(func)
  end
end
