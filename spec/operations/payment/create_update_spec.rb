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
      it { expect { subject }.to change { Payment.count }.by(1) }
    end

    context 'when borrower is invalid' do
      let(:borrower_id) { 0 }

      it { expect(subject.success?).to be(false) }
      it { expect { subject }.to_not change { Payment.count } }
    end

    context 'when some params are missed' do
      let(:params) { default_params.except(:amount) }

      it { expect(subject.success?).to be(false) }
      it { expect(contract_errors).to include(:amount) }
      it { expect { subject }.to_not change { Payment.count } }
    end

    context 'when some params are invalid' do
      let(:month) { 'invalid value' }

      it { expect(subject.success?).to be(false) }
      it { expect(contract_errors).to include(:month) }
      it { expect { subject }.to_not change { Payment.count } }
    end
  end

  describe Payment::Update do
    let!(:payment) { create(:payment) }

    subject { described_class.(id: id, payment: params) }

    context 'when id is valid' do
      let(:id) { payment.id }

      it { expect(subject.success?).to be(true) }
    end

    context 'when id in invalid' do
      let(:id) { 0 }

      it { expect(subject.success?).to be(false) }
    end
  end
end
