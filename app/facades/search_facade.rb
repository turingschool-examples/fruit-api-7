class SearchFacade
  def fruit_named(query)
    result = service.fruit_named(query)

    @air_quality = Fruit.new(result)
  end

  private

  def service
    FruityViceService.new
  end
end
