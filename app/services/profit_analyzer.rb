class ProfitAnalyzer
  AnalyzedData = Struct.new(:rate_of_return)

  attr_reader :borrower

  def initialize(borrower)
    @borrower = borrower
  end

  def analyze
    AnalyzedData.new(0.30)
  end
end
