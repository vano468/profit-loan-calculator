class ProfitAnalyzer
  PERCENT_MONTHS_BASE = 12
  AnalyzedData = Struct.new(:total_paid, :profit, :profit_rate)

  def self.analyze
    data = Borrower.all.map { |b| new(b).analyze }
    data.inject do |memo, item|
      AnalyzedData.members.each do |attr|
        memo[attr] += item[attr]
      end; memo
    end.tap do |result|
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

      AnalyzedData.new(total_paid, profit, profit_rate)
    end
  end

  private

  attr_reader :payments
  delegate :credit_amount, :credit_term, to: :borrower
end
