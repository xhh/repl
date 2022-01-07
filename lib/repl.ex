# ~/.iex.exs

import_if_available Ecto.Query
import_if_available Ecto.Changeset

defmodule R do
  @moduledoc """
  `R` for REPL.
  """

  def hex(n, copy_to_clipboard \\ true) do
    result = Integer.to_string(n, 16)
    if copy_to_clipboard do
      IO.puts("#{n} == 0x#{result}")
      if function_exported?(Clipboard, :copy, 1) do
        Clipboard.copy(result)
        IO.puts("copied to clipboard: #{result}")
      end
    else
      IO.puts("#{n} == 0x#{result}")
    end
    result
  end

  @doc """
  # Examples
  random_string(15, special: true)
  """
  def random_string(len \\ 12, opts \\ []) do
    alphabet = Keyword.get(opts, :alphabet, true)
    upper = Keyword.get(opts, :upper, true)
    lower = Keyword.get(opts, :lower, true)

    number = Keyword.get(opts, :number, true)
    special = Keyword.get(opts, :special, false)

    list =
      case {alphabet, upper, lower} do
        {true, true, true} -> Enum.to_list(?A..?Z) ++ Enum.to_list(?a..?z)
        {true, true, false} -> Enum.to_list(?A..?Z)
        {true, false, true} -> Enum.to_list(?a..?z)
        {true, false, false} -> []
        {false, _, _} -> []
      end

    list = if number, do: list ++ Enum.to_list(?0..?9), else: list

    list =
      case special do
        true -> list ++ '_-+./\\!()<>[]@#$%^&*='
        [_ | _] = special_charlist -> list ++ special_charlist
        _ -> list
      end

    result = for _ <- 1..len, into: "", do: << Enum.random(list) >>
    IO.puts(result)
    result
  end
end
