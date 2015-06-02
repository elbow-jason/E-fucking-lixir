defmodule Long do
  def count(num) do
    x = trunc(1000 * :random.uniform)
    1..x
    |> Enum.map(fn x -> x + 1 end)
    |> Enum.join " "

    IO.puts "#{num} done"
  end

  def sync do
    1..4000
    |> Enum.to_list
    |> Enum.each(&count/1)
  end

  def async do
    pids = 1..4000
    |> Enum.to_list
    |> Enum.map(fn x ->
      spawn(fn ->
        Long.count(x)
      end)
    end)
    wait_for(pids)
    #IO.puts "Async actually took #{t2} milliseconds"
    pids
  end

  def wait_for(pids) do
    result = Enum.any?(pids, &Process.alive?/1)
    case result do
      true  -> wait_for(pids)
      false -> :done
    end
  end

  def run do
    {t1, _} = :timer.tc(&sync/0)
    {t2, _} = :timer.tc(&async/0)
    IO.puts "Sync took #{t1} milliseconds"
    IO.puts "Async took #{t2} milliseconds"
  end

end

Long.run
