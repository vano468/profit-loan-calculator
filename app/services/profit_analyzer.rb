class ProfitAnalyzer
  class AnalyzedData < Struct.new(:test)
  end

  def analyze
    AnalyzedData.new(:test)
  end
end
