require 'card'

RSpec.describe Card do
    let(:card) {Card.new("clubs", "two")}
    describe "#to_s" do
        it "correctly represents a single playing card" do
            expect(card.to_s).to eq("This is the two of clubs")
        end
    end
end