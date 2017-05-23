require 'rails_helper'

describe Payments::Destroy do
  subject { described_class.(params) }

  context 'when id is valid' do
    let!(:payment) { create(:payment) }
    let(:params) { { id: payment.id } }

    it { expect(subject.success?).to be(true) }
    it { expect { subject }.to change { Payment.count }.by(-1) }
  end

  context 'when id in invalid' do
    let(:params) { { id: 0 } }

    it { expect(subject.success?).to be(false) }
    it { expect { subject }.to_not change { Payment.count } }
  end

  context 'when id is not presented' do
    let(:params) { {} }

    it { expect(subject.success?).to be(false) }
    it { expect { subject }.to_not change { Payment.count } }
  end
end
