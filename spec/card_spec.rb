require 'card'

Rspec.describe Card do
    describe ".to_s" do
        it "correctly represents a single playing card" do
            expect(Card.to_s("club", "2").to eq("This is the 2 of clubs"))
        end
    end
end