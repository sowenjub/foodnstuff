# Test: OpenFoodFactsService::Product.new('3608580959991')
class OpenFoodFactsService::Product
  attr_reader :barcode

  def initialize(barcode)
    @barcode = barcode
  end

  def client
    @client ||= OpenFoodFactsService::Client.new
  end

  def response
    @response ||= client.connection.get("/api/v0/product/#{barcode}.json")
  end

  def body
    @body ||= ActiveSupport::JSON.decode(response.body)
  end

  def call
    body
  end
end
