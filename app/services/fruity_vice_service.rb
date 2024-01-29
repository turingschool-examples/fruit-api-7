class FruityViceService
  def fruit_named(query)
    get_url("/api/fruit/#{query}")
  end

  def related_by_calories(max_calories)
    get_url("/api/fruit/calories?max=#{max_calories}")
  end

  private

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://www.fruityvice.com/")
  end
end
