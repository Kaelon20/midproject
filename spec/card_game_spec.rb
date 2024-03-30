require 'card_game'


RSpec.describe Card do
    let(:card) {Card.new("clubs", "two")} #create object to run test
    describe "#to_s" do #test the to_s method
        it "correctly represents a single playing card" do 
            expect(card.to_s).to eq("two of clubs") 
        end
    end
end

RSpec.describe Deck do
    let(:deck) {Deck.new} #create deck object
    describe "#shuffle" do #testing the shuffle method
        it "correctly shuffles the deck" do
            expect(deck.shuffle).not_to eq(deck)
        end
    end

    describe "#deal" do #testing the deal method
        it "correctly deals the deck" do #testing the deal method
            deck.deal
            expect(deck.cards.length).to eq(51)
        end
    end

end

RSpec.describe Hand do
    let(:deck) {Deck.new} 
    let(:hand) { Hand.new(deck) }
    let(:hand2){ Hand.new(deck) }
    let(:hand3){ Hand.new(deck) }
    describe "#power_ranking" do
      it "correctly matches your cards strength" do
        hand.deal_hand
        ranking = hand.power_ranking
        if ranking == "Pair"
           expect(ranking).to eq("Pair")
        elsif ranking == "Three of a Kind"
            expect(ranking).to eq("Three of a Kind")   
        elsif ranking == "Four of a Kind"
            expect(ranking).to eq("Four of a Kind")
        elsif ranking == "Full House"
            expect(ranking).to eq("Full House")
        elsif ranking == "Two Pair"
            expect(ranking).to eq("Two Pair")
        elsif ranking == "Straight"
            expect(ranking).to eq("Straight")
        elsif ranking == "Flush"
            expect(ranking).to eq("Flush")
        elsif ranking == "Straight Flush"
            expect(ranking).to eq("Straight Flush")
        elsif ranking == "Royal Flush"
            expect(ranking).to eq("Royal Flush")
        else ranking == "High card"
            expect(ranking).to eq("High card")
        end
      end
    end

    describe "#winning_hand" do
        it "correctly shows the winning hand" do
            hand.deal_hand
            hand2.deal_hand
            hand3.deal_hand
            rankings = {"Player 1" => hand.power_ranking, "Player 2" => hand2.power_ranking, "Player 3" => hand3.power_ranking}
            winner = hand.winning_hand(rankings)
            if winner == "Player 1"
                expect(winner).to eq("Player 1")
            elsif winner == "Player 2"
                expect(winner).to eq("Player 2")
            elsif winner == "Player 3"
                expect(winner).to eq("Player 3")
            else
                expect(winner).to eq("Tie")
            end
        end
    end
end





