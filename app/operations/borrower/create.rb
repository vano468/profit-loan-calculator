class Borrower::Create < Trailblazer::Operation
  step Model(Borrower, :new)
  step Contract::Build(constant: BorrowerForm)
  step Contract::Validate(key: 'borrower')
  step Contract::Persist()
end
