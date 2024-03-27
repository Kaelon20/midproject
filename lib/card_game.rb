class Card
    attr_reader :suit, :value # getter to get the type of card

    def initialize(suit, value) #initialize the variables
        @suit = suit
        @value = value
    end

    def to_s
     "This is the #{value} of #{suit}" #method for the string
    end

end

class Deck
    attr_reader :cards #getter for the cards
  
    SUITS = ['hearts', 'diamonds', 'clubs', 'spades'] # suits
    VALUES = ['two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'Jack', 'Queen', 'King', 'Ace'] # values
  
    def initialize
      @cards = [] # empty array for cards
      SUITS.each do |suit|
        VALUES.each do |value|
          @cards << Card.new(suit, value) #paired all the suites with its values and stored them into cards
        end
      end
    end
  
    def shuffle
      @cards.shuffle!
    end
  
    def deal
      @cards.pop
    end


end
