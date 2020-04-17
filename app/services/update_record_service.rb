class UpdateRecordService
  def initialize(record)
    @record = record
  end

  def product
    @product ||= OpenFoodFactsService::Product.new(@record.barcode)
  end

  def call
    product.call
    AirtableService::UpdateRecord.new(@record, product.body).call
  end
end
