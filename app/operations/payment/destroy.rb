class Payment::Destroy < Trailblazer::Operation
  step Model(Payment, :find_by)
  step Operation::Shared::DestroyModel
end
