require 'rails_helper'

describe 'Borrowers::Create|Update' do
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

  describe Borrowers::Create do
    subject { described_class.(borrower: params) }
    let(:contract_errors) { subject['contract.default'].errors.messages }

    context 'when all params are valid' do
      it { expect(subject.success?).to be(true) }
      it { expect { subject }.to change { Borrower.count }.by(1) }
    end

    context 'when some params are missed' do
      let(:params) { default_params.except(:credit_term, :base_rate) }

      it { expect(subject.success?).to be(false) }
      it { expect(contract_errors).to include(:credit_term, :base_rate) }
      it { expect { subject }.to_not change { Borrower.count } }
    end

    context 'when some params are invalid' do
      let(:credit_amount) { 'invalid value' }

      it { expect(subject.success?).to be(false) }
      it { expect(contract_errors).to include(:credit_amount) }
      it { expect { subject }.to_not change { Borrower.count } }
    end
  end

  describe Borrowers::Update do
    let!(:borrower) { create(:borrower) }

    subject do
      described_class.(id: id, borrower: params)
    end

    context 'when id is valid' do
      let(:id) { borrower.id }

      it { expect(subject.success?).to be(true) }
    end

    context 'when id in invalid' do
      let(:id) { 0 }

      it { expect(subject.success?).to be(false) }
    end
  end
end
