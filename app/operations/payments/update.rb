class Payments::Update < Trailblazer::Operation
  step Model(Payment, :find_by)
  step Contract::Build(constant: PaymentForm)
  step Contract::Validate(key: :payment)
  step Contract::Persist()
end
