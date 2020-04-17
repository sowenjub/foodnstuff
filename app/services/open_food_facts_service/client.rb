class OpenFoodFactsService::Client
  attr_reader :api_version, :connection

  def initialize
    @connection = build_connection
  end

  def base_uri
    'https://world.openfoodfacts.org'
  end

  private

  def build_connection
    Faraday.new(url: base_uri) do |builder|
      builder.request  :url_encoded             # form-encode POST params
      builder.response :logger                  # log requests to STDOUT
      builder.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end
end
