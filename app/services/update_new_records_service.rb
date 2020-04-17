class UpdateNewRecordsService
  def initialize(products = nil)
    @products = products || Products.new_incomplete
  end

  def call
    @products.each do |product|
      UpdateRecordService.new(product).call
    end
  end
end
