class AirtableService::UpdateRecord
  def initialize(record, response)
    @record = record
    @response = response
  end

  def found?
    @response['status'] == 1
  end

  def food_facts
    @food_facts ||= @response['product']
  end

  def call
    found? ? update_found : update_not_found
    @record.save
  end

  private

  def update_found
    @record['Image'] = food_facts['image_url']
    @record['Name'] = food_facts['product_name']
    @record['Brand'] = food_facts['brands']
  end

  def update_not_found
    @record['Brand'] = 'Not Found'
  end
end
