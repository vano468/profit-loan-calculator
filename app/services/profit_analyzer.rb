class ProfitAnalyzer
  PERCENT_MONTHS_BASE = 12
  AnalyzedData = Struct.new(:total_paid, :profit, :profit_rate, :expected_rate)

  def self.analyze
    data = Borrower
      .includes(:payments).all
      .map { |b| new(b).analyze }

    data.inject(AnalyzedData.new(*[0]*4)) do |memo, item|
      AnalyzedData.members.each do |attr|
        memo[attr] += item[attr]
      end; memo
    end.tap do |result|
      data.empty? ? result :
        result.to_h.each { |k,_| result[k] /= data.size }
    end
  end

  attr_reader :borrower, :cacher

  def initialize(borrower, cacher: ResourceCacher)
    @borrower = borrower
    @payments = borrower.payments
    @cacher = cacher.new(payments)
  end

  def analyze
    cacher.fetch do
      total_paid  = payments.sum(&:amount)
      profit      = total_paid - credit_amount
      profit_rate = profit / credit_amount / credit_term * PERCENT_MONTHS_BASE

      AnalyzedData.new(total_paid, profit, profit_rate, base_rate)
    end
  end

  private

  attr_reader :payments
  delegate :credit_amount, :credit_term, :base_rate, to: :borrower
end
