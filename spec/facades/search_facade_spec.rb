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
  end
end
