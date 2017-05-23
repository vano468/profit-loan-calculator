class Payments::Create < Trailblazer::Operation
  step Model(Payment, :new)
  step :assign_borrower!
  step Contract::Build(constant: PaymentForm)
  step Contract::Validate(key: :payment)
  step Contract::Persist()

  def assign_borrower!(options)
    options['model'].borrower = Borrower.find_by_id(options['params'][:borrower_id])
  end
end
