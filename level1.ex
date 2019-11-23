defmodule ShopkeeperChallenge do
  @doc """
  takes in the change and returns the amount in denominations
  """
  def call_me(change) do
    return_change(change, "")
  end

  @doc """
  takes in the change and acc which is the remainder we get by dividing the change with denomination.
  Returns a string.
   ## Example
   iex > ShopKeeperChallenge.return_change(94)
        "1 50 Notes 2 20 Coins 4 1 Coin "
  """
  def return_change(0, acc) do
    acc
  end

  def return_change(change, acc) do
    {string, remaining} = change_amount(change)
    return_change(remaining, acc <> string)
  end

  defp change_amount(change) when change > 1000 do
    {"#{div(change, 1000)} 1000 Notes ", rem(change, 1000)}
  end

  defp change_amount(change) when change in 500..1000 do
    {"#{div(change, 500)} 500 Notes ", rem(change, 500)}
  end

  defp change_amount(change) when change in 100..500 do
    {"#{div(change, 100)} 100 Notes ", rem(change, 100)}
  end

  defp change_amount(change) when change in 50..100 do
    {"#{div(change, 50)} 50 Notes ", rem(change, 50)}
  end

  defp change_amount(change) when change in 20..50 do
    {"#{div(change, 20)} 20 Coins ", rem(change, 20)}
  end

  defp change_amount(change) when change in 10..20 do
    {"#{div(change, 10)} 10 Coins ", rem(change, 10)}
  end

  defp change_amount(change) when change in 5..10 do
    {"#{div(change, 5)} 5 Coins ", rem(change, 5)}
  end

  defp change_amount(change) when change in 1..5 do
    {"#{div(change, 1)} 1 Coin ", rem(change, 1)}
  end
end
