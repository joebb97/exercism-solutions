defmodule LogLevel do

  def to_label(x, legacy?) do
    case {x, legacy?} do
      {0, false} -> :trace
      {1, _} -> :debug
      {2, _} -> :info
      {3, _} -> :warning
      {4, _} -> :error
      {5, false} -> :fatal
      _ -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    case to_label(level, legacy?) do
      label when label in [:error, :fatal] -> :ops
      :unknown -> 
        if legacy? do
          :dev1
        else
          :dev2
        end
      _ -> false
    end
  end
end
