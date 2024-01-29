class SearchFacade
  def fruit_named(query)
    result = service.fruit_named(query)

    @air_quality = Fruit.new(result)
  end

  def related_by_calories(max_calories)
    results = service.related_by_calories(max_calories)

    @related_fruits = results.map do |fruit_data|
      Fruit.new(fruit_data)
    end
  end

  private

  def service
    FruityViceService.new
  end
end
