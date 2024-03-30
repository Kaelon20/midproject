class Card
    attr_reader :suit, :value # getter to get the type of card

    def initialize(suit, value) #initialize the variables
        @suit = suit
        @value = value
    end

    def to_s
     "#{value} of #{suit}" #method for the string
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
      shuffle
      @cards.pop
    end
end

class Hand
  attr_reader :hand, :deck #getter for hand and deck 

  def initialize(deck) #initialize the deck variable and hand array
    @deck = deck
    @hand = []

  end

  def deal_hand #method to deal card to hand
    5.times do |deck|
      hand << @deck.deal
    end
  end

  def dealt_hand #method to see cards in hand
    puts hand
  end

  def power_ranking #method to show the rank of the hand you have
    rankings = []
    rankings_suits = []
    hand.each do |card|# loop to get the value of each card
      value = card.value
      case value
      when "two"    then 
        rankings << 2
      when "three"  then 
        rankings << 3
      when "four"   then 
        rankings << 4
      when "five"   then 
        rankings << 5
      when "six"    then 
        rankings << 6
      when "seven"  then 
        rankings << 7
      when "eight"  then 
        rankings << 8
      when "nine"   then 
        rankings << 9
      when "ten"    then 
        rankings << 10
      when "Jack"   then 
        rankings << 11
      when "Queen"  then 
        rankings << 12
      when "King"   then 
        rankings << 13
      when "Ace"    then 
        rankings << 14
      end
    end
    hand.each do |card| #loop to get the suits of each card
      suit = card.suit
      case suit
      when "clubs"  then
        rankings_suits << 15
      when "hearts" then
        rankings_suits << 16
      when "spades" then
        rankings_suits << 17
      when "diamonds" then
        rankings_suits << 18
      end
    end
    hand_rank = nil # variable to determine hand rank
    rankings.each_with_index do |value, index| #loop for no duplicates of value
      rankings_suits.each_with_index do |suit, index| # loop for no dupes of suit
        if rankings.count(value) == 2  # all If statements to check to see what rank the players hand is
          hand_rank = "Pair"
          break
        elsif rankings.count(value) == 3
           hand_rank = "Three of a Kind"
           break
        elsif rankings.count(value) == 4
           hand_rank = "Four of a Kind"
           break
        elsif rankings.uniq.size == 2
          if rankings.count(rankings[0]) == 2 || rankings.count(rankings[0]) == 3
            hand_rank = "Full House"
            break
          end 
        elsif rankings.uniq.size == 3
          if (rankings.count(rankings[0]) == 2 && rankings.count(rankings[1]) == 2) || (rankings.count(rankings[0]) == 2 && rankings.count(rankings[2]) == 2) || (rankings.count(rankings[1]) == 2 && rankings.count(rankings[2]) == 2)
            hand_rank = "Two Pair"
            break
          end
        elsif rankings.uniq.size == 5 && (rankings.map(&:to_i).max - rankings.map(&:to_i).min == 4)
          if (rankings_suits.count(15) == 5 || rankings_suits.count(16) == 5 || rankings_suits.count(17) == 5 || rankings_suits.count(18) == 5) && rankings.map(&:to_i).min > 9
            hand_rank = "Royal Flush"
            break
          elsif (rankings_suits.count(15) == 5 || rankings_suits.count(16) == 5 || rankings_suits.count(17) == 5 || rankings_suits.count(18) == 5)
            hand_rank = "Straight Flush"
          else
            hand_rank = "Straight"
            break
          end
        elsif rankings_suits.count(15) == 5 || rankings_suits.count(16) == 5 || rankings_suits.count(17) == 5 || rankings_suits.count(18) == 5
          hand_rank = "Flush"
          break
        else
          hand_rank = "High card"
          break
        end
      end
    end
    return hand_rank
  end
end




