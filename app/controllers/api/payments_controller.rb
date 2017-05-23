class Api::PaymentsController < ApiController
  def create
    run_operation(Payments::Create, as: :model)
  end

  def update
    run_operation(Payments::Update, as: :model)
  end

  def destroy
    run_operation(Payments::Destroy)
  end
end
