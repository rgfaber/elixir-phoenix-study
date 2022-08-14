defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  @tag :ignore
  test "Test that we can create a list of cards" do
    cards = Cards.create_deck()
    assert cards != nil
  end


  @tag :ignore
  test "Test that we can shuffle a list of cards" do
    cards = Cards.create_deck()
    cards = Cards.shuffle(cards)
    assert cards != nil
  end

  @tag :ignore
  test "Test that we can check if our deck contains a card" do
    cards = Cards.create_deck()
    res = Cards.contains?(cards, "Ace of Spades")
    assert res == :true
  end


  @tag :ignore
  test "Test that we can deal a hand" do
    deck = Cards.create_deck()
    {hand, rest_of_deck} = deck
    |> Cards.shuffle()
    |> Cards.deal_hand(2)
    assert hand != nil
    assert hand |> Enum.count() == 2
    assert rest_of_deck != nil
    assert rest_of_deck |> Enum.count() == 50
  end

  @tag :ignore
  test "Test that we can save a deck" do
    deck = Cards.create_deck()
    Cards.save_deck(deck, "test_deck.erl")
    assert deck != nil
  end

  @tag :ignore
  test "Test that we can load a deck" do
    {status, deck} = Cards.load_deck("test_deck.erl")
    assert status == :ok
    assert deck != nil
  end

  test "Test That we can create a hand" do
    {hand,_} = Cards.create_hand(2)
    assert hand != nil
    assert hand |> Enum.count() == 2
  end








end
