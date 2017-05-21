require 'rails_helper'

describe 'Payment::Create|Update' do
  let(:borrower) { create(:borrower) }
  let(:month) { '1' }
  let(:amount) { '192000' }
  let(:borrower_id) { borrower.id }

  let(:default_params) do
    { month: month,
      amount: amount }
  end
  let(:params) { default_params }

  describe Payment::Create do
    subject { described_class.(borrower_id: borrower_id, payment: params) }
    let(:contract_errors) { subject['contract.default'].errors.messages }

    context 'when all params are valid' do
      it { expect(subject.success?).to be(true) }
    end

    context 'when borrower is invalid' do
      let(:borrower_id) { 0 }

      it { expect(subject.success?).to be(false) }
    end

    context 'when some params are missed' do
      let(:params) { default_params.except(:amount) }

      it { expect(subject.success?).to be(false) }
      it { expect(contract_errors).to include(:amount) }
    end

    context 'when some params are invalid' do
      let(:month) { 'invalid value' }

      it { expect(subject.success?).to be(false) }
      it { expect(contract_errors).to include(:month) }
    end
  end
end
