class Api::BorrowersController < ApiController
  def show
    run_operation(Borrowers::Show, as: :render)
  end

  def create
    run_operation(Borrowers::Create, as: :model)
  end

  def update
    run_operation(Borrowers::Update, as: :model)
  end

  def destroy
    run_operation(Borrowers::Destroy)
  end
end
