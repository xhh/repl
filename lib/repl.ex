defmodule R do
  @moduledoc """
  Documentation for `R`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> R.hello()
      :world

  """
  def hello do
    :world
  end

  def hex(n) do
    result = Integer.to_string(n, 16)
    IO.puts("#{n} == 0x#{result} (copied to clipboard: #{result})")
    Clipboard.copy(result)
  end
end
