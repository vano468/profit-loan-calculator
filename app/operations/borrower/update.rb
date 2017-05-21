class Borrower::Update < Trailblazer::Operation
  step Model(Borrower, :find_by)
  step Contract::Build(constant: BorrowerForm)
  step Contract::Validate(key: 'borrower')
  step Contract::Persist()
end
