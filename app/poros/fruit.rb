class Fruit
  attr_reader :name,
              :family,
              :order,
              :genus,
              :calories,
              :fat,
              :sugar,
              :carbohydrates,
              :protein

  def initialize(data)
    @name = data[:name]
    @family = data[:family]
    @order = data[:order]
    @genus = data[:genus]
    @calories = data[:nutritions][:calories]
    @fat = data[:nutritions][:fat]
    @sugar = data[:nutritions][:sugar]
    @carbohydrates = data[:nutritions][:carbohydrates]
    @protein = data[:nutritions][:protein]
  end
end
