defmodule Cards do
  @moduledoc """
  A module for playing with cards.
  """

  @doc """
  Creates a Deck of cards.
  """
  @spec create_deck() :: List[String]
  def create_deck() do
    values = ["Ace","Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Spades", "Hearts", "Diamonds", "Clubs"]
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @spec shuffle(list) :: list
  def shuffle(cards) do
    cards
    |> Enum.shuffle()
    |> IO.inspect()
  end

  @spec contains?(list, string) :: boolean
  def contains?(deck,card) do
    deck
    |> Enum.member?(card)
  end

  @doc """
  Deals a hand of cards of size `hand_size` from the deck.
  and returns a tuple of the hand and the remaining deck.

  ## Example

      iex> deck = Cards.create_deck()
      iex> Cards.deal_hand(deck,2)
      iex> Cards.contains?(deck,"Ace of Spades")
      true

  """
  @spec deal_hand(list, integer) :: {list, list}
  def deal_hand(deck, hand_size) do
    deck
    |> Enum.split(hand_size)
  end


  @spec save_deck(Path.t(),File.iodata()) :: :ok | {:error, File.posix()}
  def save_deck(deck,file_name) do
    binary = :erlang.term_to_binary(deck)
    File.write(file_name, binary)
  end

  @spec load_deck(Path.t()) :: {:ok, list} | {:error, string}
  def load_deck(file_name) do
    case File.read(file_name) do
      {:ok, binary} ->  :erlang.binary_to_term(binary)
      {:error, _} -> {:error, "File not found"}
    end
  end


  def create_hand(num_cards) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal_hand(num_cards)
  end


end
