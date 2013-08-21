#This module will attempt to simulate a blackjack game through class inheritance
module Blackjack
  class Card
    @suit = nil
    @value = nil
    SUITS = ['Spades', 'Clubs', 'Hearts', 'Diamonds']
    VALUES = %w"A 1 2 3 4 5 6 7 8 9 10 J Q K"
    def initialize(suit, value)
    @suit = {SUITS.include?(suit) ? suit : raise Invalid "That is not a valid card suit"}
    @value = {VALUES.include?(value) ? value : raise Invalid "That is not a valid card value"}
    end
  end
  #collection of cards
  
  class Deck
    #Desk variable
    @d = []
      
    def initialize()
      SUITS.each do |s|
        VALUE.each do |v|
          d += card.new(s,v)
        end
      end
    end
  end
 
  #multiple decks of cards
  class Stack
  end #Class end
  
  class Invalid < StandardError
  end
  
  d = Deck.new()
  puts d
  
end #Module End
