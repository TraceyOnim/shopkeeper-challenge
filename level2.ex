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

  @doc """
  returns a list of available items
  """
  def available_items do
    Enum.map(@item_prices, fn {item, price} ->
      {item, price}
    end)
  end

  defp _prompt(total) do
    IO.puts("Please pay #{total}/=")
    IO.gets("")
  end

  @doc """
  given a list of items, this function prompts the customer to pay the total price
  of their items and returns the balance in form of denominations.
  """
  def enter_items_to_get_bill(items) do
    total =
      Enum.map(items, fn item ->
        price(item)
      end)
      |> Enum.sum()

    total
    |> _prompt()
    |> balance(total)
    |> balance_in_denominations()
  end

  @doc """
  takes in the price paid by the customer and returns the balance
  """
  def balance(paid, total) do
    paid = String.replace(paid, "\n", "") |> String.to_integer()
    paid - total
  end

  @doc """
  takes in the balance and returns the balance in form of denominations
  """
  def balance_in_denominations(bill) do
    ShopkeeperChallenge.call_me(bill)
  end

  @doc """
  returns the price of the item given
  """
  def price(item) do
    item = String.capitalize(item)
    @item_prices[item]
  end
end
