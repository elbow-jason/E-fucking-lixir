
defmodule FizzBuzz do
  @take 15

  def without_rem do
    nums = Stream.iterate(1, &(&1 + 1))
    fizz = Stream.cycle ["", "", "Fizz"]
    buzz = Stream.cycle ["", "", "", "", "Buzz"]
    fizzbuzz = Stream.zip(fizz, buzz) |> Stream.zip(nums) |> Stream.map(fn
      {{"",       ""      },  number} -> number
      {{fizzword, buzzword}, _number} -> fizzword <> buzzword
    end)
    fizzbuzz
    |> Enum.take(@take)
    |> Enum.each(&IO.puts/1)
  end

  def with_rem do
    1..@take |> Enum.map(fn n ->
      result = case {rem(n,3), rem(n,5)} do
        {0, 0} -> "FizzBuzz"
        {0, _} -> "Fizz"
        {_, 0} -> "Buzz"
        _      -> n
      end
      IO.puts result
    end)
  end

  def run do
    without_rem
    with_rem
  end

end


FizzBuzz.run






