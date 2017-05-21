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
    let(:profit) { subject.profit.round.to_i }
    let(:profit_rate) { subject.profit_rate.round(2).to_f }

    context '6 months/in time' do
      let(:payments) do
        [191_666.67] * 6
      end

      it { expect(profit).to eq(150_000) }
      it { expect(profit_rate).to eq(0.30) }
    end

    context '3 months/in time then early repayment' do
      let(:payments) do
        [191_666.67] * 3 + [525_000.00]
      end

      it { expect(profit).to eq(100_000) }
      it { expect(profit_rate).to eq(0.2) }
    end

    context '2 months/in time then 4 months/delay' do
      let(:payments) do
        [191_666.67] * 2 + [208_333.33] * 4
      end

      it { expect(profit).to eq(216_667) }
      it { expect(profit_rate).to eq(0.43) }
    end

    context '6 months/delay' do
      let(:payments) do
        [208_333.33] * 6
      end

      it { expect(profit).to eq(250_000) }
      it { expect(profit_rate).to eq(0.5) }
    end

    context '6 months/loss' do
      let(:payments) do
        []
      end

      it { expect(profit).to eq(-1_000_000) }
      it { expect(profit_rate).to eq(-2.0) }
    end
  end
end
