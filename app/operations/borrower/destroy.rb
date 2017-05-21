class Borrower::Destroy < Trailblazer::Operation
  step Model(Borrower, :find_by)
  step Operation::Shared::DestroyModel
end
