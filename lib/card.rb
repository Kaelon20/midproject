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