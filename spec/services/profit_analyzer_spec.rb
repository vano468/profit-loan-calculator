require 'rails_helper'

describe ProfitAnalyzer do
  let(:instance) { described_class.new(borrower) }

  describe '#perform' do
    let(:borrower) { create(:borrower) }

    before do
      payments.each_with_index do |amount, i|
        create(:payment, borrower: borrower, amount: amount, month: i + 1)
      end
    end

    subject { instance.analyze }
    let(:rate_of_return) { subject.rate_of_return.round(2).to_f }

    context '6 months/in time' do
      let(:payments) do
        [191_666.67] * 6
      end

      it { expect(rate_of_return).to eq(0.30) }
    end

    context '3 months/in time then early repayment' do
      let(:payments) do
        [191_666.67] * 3 + [525_000.00]
      end

      it { expect(rate_of_return).to eq(0.20) }
    end

    context '2 months/in time then 4 months/delay' do
      let(:payments) do
        [191_666.67] * 2 + [208_333.33] * 4
      end

      it { expect(rate_of_return).to eq(0.43) }
    end
  end
end
