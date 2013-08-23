#This module will attempt to simulate a blackjack game through class inheritance
module Blackjack
  $SUITS = ['Spades', 'Clubs', 'Hearts', 'Diamonds']
  $VALUES = %w(A 1 2 3 4 5 6 7 8 9 10 J Q K)
  
  class Card
    def initialize(suit, value)
      @suit = suit unless $SUITS.include?(suit)
      @value = value unless $VALUES.include?(value)
    end
  end
  
  #collection of cards
  class Deck
    def initialize()
      @d = []
      $SUITS.each do |s|
        $VALUES.each do |v|
          @d << Card.new(s,v)
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
  p d.instance_variable_get(:@d)
  
end #Module End
