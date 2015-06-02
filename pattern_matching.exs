defmodule PatternMatching do

  def case_logic do
    case 1 do
      0 -> "skipped; no match"
      2 -> "skipped; no match"
      1 -> "yep; 1"
      _ -> "This will never ever be considered by the VM."
    end
  end

end
