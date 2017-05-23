class Api::PaymentsController < ApiController
  def create
    run_operation(Payment::Create, as: :model)
  end

  def update
    run_operation(Payment::Update, as: :model)
  end

  def destroy
    run_operation(Payment::Destroy)
  end
end
