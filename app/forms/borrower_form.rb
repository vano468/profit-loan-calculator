class BorrowerForm < Reform::Form
  property :credit_amount
  property :credit_term
  property :base_rate
  property :delay_rate

  validation do
    required(:credit_amount).value(:decimal?)
    required(:credit_term).value(:int?)
    required(:base_rate).value(:decimal?)
    required(:delay_rate).value(:decimal?)
  end
end
