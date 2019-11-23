defmodule ShopkeeperChallenge do
  def call_me(change) do
    return_change(change, "")
  end

  def return_change(0, acc) do
    acc
  end

  def return_change(change, acc) do
    {string, remaining} = change_amount(change)
    return_change(remaining, acc <> string)
  end

  def change_amount(change) when change > 1000 do
    {"#{div(change, 1000)} 1000 Notes ", rem(change, 1000)}
  end

  def change_amount(change) when change in 500..1000 do
    {"#{div(change, 500)} 500 Notes ", rem(change, 500)}
  end

  def change_amount(change) when change in 100..500 do
    {"#{div(change, 100)} 100 Notes ", rem(change, 100)}
  end

  def change_amount(change) when change in 50..100 do
    {"#{div(change, 50)} 50 Notes ", rem(change, 50)}
  end

  def change_amount(change) when change in 20..50 do
    {"#{div(change, 20)} 20 Coins ", rem(change, 20)}
  end

  def change_amount(change) when change in 10..20 do
    {"#{div(change, 10)} 10 Coins ", rem(change, 10)}
  end

  def change_amount(change) when change in 5..10 do
    {"#{div(change, 5)} 5 Coins ", rem(change, 5)}
  end

  def change_amount(change) when change in 1..5 do
    {"#{div(change, 1)} 1 Coin ", rem(change, 1)}
  end
end
