require 'card'
require 'deck'

RSpec.describe Card do
    let(:card) {Card.new("clubs", "two")} #create object to run test
    describe "#to_s" do #test the to_s method
        it "correctly represents a single playing card" do 
            expect(card.to_s).to eq("This is the two of clubs") 
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
            expect(deck.length()).to eq(51)
        end
    end

end