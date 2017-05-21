class ProfitAnalyzer
  PERCENT_MONTHS_BASE = 12
  AnalyzedData = Struct.new(:total_paid, :profit, :profit_rate)

  attr_reader :borrower

  def initialize(borrower)
    @borrower = borrower
    @payments = borrower.payments
  end

  def analyze
    total_paid  = payments.sum(&:amount)
    profit      = total_paid - credit_amount
    profit_rate = profit / credit_amount / credit_term * PERCENT_MONTHS_BASE

    AnalyzedData.new(total_paid, profit, profit_rate)
  end

  private

  attr_reader :payments
  delegate :credit_amount, :credit_term, to: :borrower
end
