class PaymentForm < Reform::Form
  property :amount
  property :month

  validation do
    required(:amount).value(:decimal?)
    required(:month).value(:int?)
  end
end
