class FruityViceService
  def fruit_named(query)
    get_url("/api/fruit/#{query}")
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
