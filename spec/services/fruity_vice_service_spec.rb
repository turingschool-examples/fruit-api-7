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

    describe "::related_by_calories" do
      context "happy path" do
        it "returns related fruits for a maximum calorie provided", :vcr do
          query = "52"
          results = FruityViceService.new.related_by_calories(query)

          expect(results).to be_an(Array)

          results.each do |result|
            expect(result[:name]).to be_a(String)
            expect(result[:id]).to be_an(Integer)
            expect(result[:family]).to be_a(String)
            expect(result[:order]).to be_a(String)
            expect(result[:genus]).to be_a(String)

            expect(result[:nutritions]).to be_a(Hash)
            expect(result[:nutritions][:calories]).to be_an(Integer)
            expect(result[:nutritions][:fat]).to be_a(Float)
            expect(result[:nutritions][:sugar]).to be_a(Float)
            expect(result[:nutritions][:carbohydrates]).to be_a(Float)
            expect(result[:nutritions][:protein]).to be_a(Float)
          end

          expect(results[0][:name]).to eq("Strawberry")
          expect(results[0][:id]).to eq(3)
          expect(results[0][:family]).to eq("Rosaceae")
          expect(results[0][:order]).to eq("Rosales")
          expect(results[0][:genus]).to eq("Fragaria")

          expect(results[0][:nutritions]).to be_a(Hash)
          expect(results[0][:nutritions][:calories]).to eq(29)
          expect(results[0][:nutritions][:fat]).to eq(0.4)
          expect(results[0][:nutritions][:sugar]).to eq(5.4)
          expect(results[0][:nutritions][:carbohydrates]).to eq(5.5)
          expect(results[0][:nutritions][:protein]).to eq(0.8)
        end
      end

      context "sad path" do
        it "returns an error", :vcr do
          query = "0"
          result = FruityViceService.new.related_by_calories(query)

          expect(result).to be_a(Hash)

          expect(result[:error]).to eq("No fruits with given nutritional parameter found")
        end
      end
    end
  end
end
