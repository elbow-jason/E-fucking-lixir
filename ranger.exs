defmodule Ranger do

  def where(x) when x in 1..10.5 do
    "#{x} is between one and ten and a half"
  end

  def where(x) do
    unknown(x)
  end

  defp unknown(x) do
    "#{x} is in an unknown range"
  end

  def cond_range(x) do
    # this is bad design
    cond do
      x in 1..10 -> "#{x} is between 1 and 10"
      x in 10..20 -> "#{x} is between 10 and 20"
      true -> unknown(x)
    end
  end

end
#
#[ Ranger.where(1.3),
#  Ranger.where(10.4999999999),
#  Ranger.where(10.5000000000),
#  # 16 places of precision only
#  Ranger.where(10.5000000000000000999999999999999999999999999),
#  Ranger.where(11),
#  Ranger.where(0.9), ] |> Enum.each &IO.puts/1
