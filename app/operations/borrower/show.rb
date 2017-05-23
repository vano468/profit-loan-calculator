class Borrower::Show < Trailblazer::Operation
  step Model(Borrower, :find_by)
end
