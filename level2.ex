defmodule ShopKeeper do
  alias ShopkeeperChallenge

  @item_prices %{
    "Milk" => 44,
    "Honey" => 162,
    "Eggs" => 357,
    "Bread" => 41,
    "Spinach" => 42,
    "Towel" => 236,
    "Soda" => 65
  }
  def available_items do
    Enum.map(@item_prices, fn {item, price} ->
      {item, price}
    end)
  end

  defp _prompt(total) do
    IO.puts("Please pay #{total}/=")
    IO.gets("")
  end

  def bill(items) do
    total =
      Enum.map(items, fn item ->
        price(item)
      end)
      |> Enum.sum()

    total
    |> _prompt()
    |> balance(total)
    |> enter_bill()
  end

  def balance(paid, total) do
    paid = String.replace(paid, "\n", "") |> String.to_integer()
    paid - total
  end

  def enter_bill(bill) do
    ShopkeeperChallenge.call_me(bill)
  end

  def price(item) do
    item = String.capitalize(item)
    @item_prices[item]
  end
end
