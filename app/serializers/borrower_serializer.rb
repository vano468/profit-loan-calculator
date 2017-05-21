class BorrowerSerializer < ActiveModel::Serializer
  has_many :payments

  def analyzed_data
    ProfitAnalyzer.new(object).analyze.to_h
  end
end
