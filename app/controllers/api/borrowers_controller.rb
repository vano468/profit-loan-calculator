class Api::BorrowersController < ApiController
  def show
    run_operation(Borrower::Show, as: :render)
  end

  def create
    run_operation(Borrower::Create, as: :model)
  end

  def update
    run_operation(Borrower::Update, as: :model)
  end

  def destroy
    run_operation(Borrower::Destroy)
  end
end
