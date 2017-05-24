class Payments::Create < Trailblazer::Operation
  step Model(Payment, :new)
  step :assign_borrower!
  step Contract::Build(constant: PaymentForm)
  step Contract::Validate(key: :payment)
  step Rescue(ActiveRecord::RecordNotUnique, handler: :handle_record_not_unique!) {
    step Contract::Persist()
  }

  def assign_borrower!(options)
    options['model'].borrower = Borrower.find_by_id(options['params'][:borrower_id])
  end

  def handle_record_not_unique!(_, options)
    options['errors.messages'] = { month: ['must be uniq'] }
  end
end
