require "rails_helper"

RSpec.describe SearchFacade do
  describe "class methods" do
    describe "::fruits_named" do
      it "returns a fruit object", :vcr do
        query = "Apple"
        fruit = SearchFacade.new.fruit_named(query)

        expect(fruit).to be_a(Fruit)
        expect(fruit.name).to eq("Apple")
        expect(fruit.family).to eq("Rosaceae")
        expect(fruit.order).to eq("Rosales")
        expect(fruit.genus).to eq("Malus")
        expect(fruit.calories).to eq(52)
        expect(fruit.fat).to eq(0.4)
        expect(fruit.sugar).to eq(10.3)
        expect(fruit.carbohydrates).to eq(11.4)
        expect(fruit.protein).to eq(0.3)
      end
    end

    describe "::related_by_calories" do
      it "returns related fruits in an array", :vcr do
        query = "52"
        results = SearchFacade.new.related_by_calories(query)

        expect(results).to be_an(Array)

        results.each do |result|
          expect(result).to be_a(Fruit)
          expect(result.name).to be_a(String)
          expect(result.family).to be_a(String)
          expect(result.order).to be_a(String)
          expect(result.genus).to be_a(String)
          expect(result.calories).to be_an(Integer)
          expect(result.fat).to be_a(Float)
          expect(result.sugar).to be_a(Float)
          expect(result.carbohydrates).to be_a(Float)
          expect(result.protein).to be_a(Float)
        end

        expect(results[0].name).to eq("Strawberry")
        expect(results[0].family).to eq("Rosaceae")
        expect(results[0].order).to eq("Rosales")
        expect(results[0].genus).to eq("Fragaria")
        expect(results[0].calories).to eq(29)
        expect(results[0].fat).to eq(0.4)
        expect(results[0].sugar).to eq(5.4)
        expect(results[0].carbohydrates).to eq(5.5)
        expect(results[0].protein).to eq(0.8)
      end
    end
  end
end
