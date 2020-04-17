class Products < Airrecord::Table
  self.base_key = 'app09fEoLwDSbtuim'
  self.table_name = 'Products'

  def self.incomplete
    all(view: 'Incomplete')
  end

  def self.new_incomplete
    all(view: 'Incomplete New')
  end

  def barcode
    self['Barcode']['text']
  end
end
