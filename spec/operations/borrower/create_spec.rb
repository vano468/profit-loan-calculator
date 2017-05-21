require 'rails_helper'

describe Borrower::Create do
  let(:credit_amount) { '1000000' }
  let(:credit_term) { '6' }
  let(:base_rate) { '0.3' }
  let(:delay_rate) { '0.5' }

  let(:default_params) do
    { credit_amount: credit_amount,
      credit_term: credit_term,
      base_rate: base_rate,
      delay_rate: delay_rate }
  end
  let(:params) { default_params }

  subject { described_class.('borrower' => params) }
  let(:contract_errors) { subject['contract.default'].errors.messages }

  context 'when all params are valid' do
    it { expect(subject.success?).to be(true) }
  end

  context 'when some params are missed' do
    let(:params) { default_params.except(:credit_term, :base_rate) }

    it { expect(subject.success?).to be(false) }
    it { expect(contract_errors).to include(:credit_term, :base_rate) }
  end

  context 'when some params are invalid' do
    let(:credit_amount) { 'invalid value' }

    it { expect(subject.success?).to be(false) }
    it { expect(contract_errors).to include(:credit_amount) }
  end
end
