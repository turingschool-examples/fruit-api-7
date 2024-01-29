require "rails_helper"

RSpec.describe FruityViceService do
  describe "class methods" do
    describe "::fruit_named" do
      context "happy path" do
        it "returns a fruit object for a specific query", :vcr do
          query = "Apple"
          result = FruityViceService.new.fruit_named(query)

          expect(result).to be_a(Hash)

          expect(result[:name]).to eq("Apple")
          expect(result[:id]).to eq(6)
          expect(result[:family]).to eq("Rosaceae")
          expect(result[:order]).to eq("Rosales")
          expect(result[:genus]).to eq("Malus")

          expect(result[:nutritions]).to be_a(Hash)
          expect(result[:nutritions][:calories]).to eq(52)
          expect(result[:nutritions][:fat]).to eq(0.4)
          expect(result[:nutritions][:sugar]).to eq(10.3)
          expect(result[:nutritions][:carbohydrates]).to eq(11.4)
          expect(result[:nutritions][:protein]).to eq(0.3)
        end
      end

      context "sad path" do
        it "returns an error", :vcr do
          query = "error"
          result = FruityViceService.new.fruit_named(query)

          expect(result).to be_a(Hash)

          expect(result[:error]).to eq("Not found")
        end
      end
    end
  end
end
