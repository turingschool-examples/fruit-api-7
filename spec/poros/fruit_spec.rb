require "rails_helper"

RSpec.describe Fruit do
  it "makes fruit objects" do
    attributes =
      {
        name: "Apple",
        id: 6,
        family: "Rosaceae",
        order: "Rosales",
        genus: "Malus",
        nutritions: {
          calories: 52,
          fat: 0.4,
          sugar: 10.3,
          carbohydrates: 11.4,
          protein: 0.3
        }
      }
    fruit = Fruit.new(attributes)

    expect(fruit).to be_a(Fruit)
    expect(fruit.name).to eq(attributes[:name])
    expect(fruit.family).to eq(attributes[:family])
    expect(fruit.order).to eq(attributes[:order])
    expect(fruit.genus).to eq(attributes[:genus])
    expect(fruit.calories).to eq(attributes[:nutritions][:calories])
    expect(fruit.fat).to eq(attributes[:nutritions][:fat])
    expect(fruit.sugar).to eq(attributes[:nutritions][:sugar])
    expect(fruit.carbohydrates).to eq(attributes[:nutritions][:carbohydrates])
    expect(fruit.protein).to eq(attributes[:nutritions][:protein])
  end
end
