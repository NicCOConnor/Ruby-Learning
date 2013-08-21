#This module will attempt to simulate a blackjack game through class inheritance
module Blackjack
  class Card
    @suit = nil
    @value = nil
    SUITS = ['Spades', 'Clubs', 'Hearts', 'Diamonds']
    VALUES = %w[A 1 2 3 4 5 6 7 8 9 10 J Q K]
    def initialize(suit, value)
      @suit = if SUITS.include?(suit) ? suit : raise Invalid("That is not a valid card suit")
      @value = if VALUES.include?(value) ? value : raise Invalid("That is not a valid card value")
    end
  end
  #collection of cards
  class Deck
  end
  #multiple decks of cards
  class stack
  end #Class end
  class Invalid(msg) > StandardError
    puts msg
  end
  
end #Module End
