defmodule Boomer do

  def loop do
    receive do
      {_,    :boom} ->
        IO.puts "Killing"
        raise :kaboom
      {sender, msg} ->
        IO.puts "received #{inspect msg}"
        send sender, {:ok, msg}
    end
    loop
  end

  def start do
    spawn(Boomer, :loop, [])
  end

end


defmodule Spawn1 do

  def greet do
    receive do
      {sender, value} ->
        send sender, {:ok, "hello #{value}"}
    end
  end
end

defmodule Thing do

  def start do
    Agent.start_link(fn -> HashDict.new end, name: name)
  end

  def value do
    Agent.get(name, fn hash -> hash end)
  end

  def merge(dict) do
    Agent.update(name, fn hash ->
      HashDict.merge(hash, dict, fn k, v1, v2-> v2 end)
    end)
  end

  def add(key, val) do
    Agent.update(name, fn hash ->
      HashDict.put(hash, key, val)
    end)
  end

  def name do
    __MODULE__
  end
end

