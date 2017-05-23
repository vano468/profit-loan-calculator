class BorrowerSerializer < ActiveModel::Serializer
  include Serializer::Concerns::Formatter

  attributes :id, :credit_amount, :credit_term, :base_rate, :delay_rate
  attributes :display_name, :display_base_rate, :display_delay_rate
  attributes :analyzed_data

  has_many :payments

  def display_name
    "borrower##{object.id} gets #{display_credit_amount} for #{object.credit_term} months"
  end

  def display_credit_amount
    format_money_in_rub(object.credit_amount)
  end

  def display_base_rate
    format_rate(object.base_rate)
  end

  def display_delay_rate
    format_rate(object.delay_rate)
  end

  def analyzed_data
    data = ProfitAnalyzer.new(object).analyze
    Borrower::AnalyzedDataSerializer.new(data).serializable_hash
  end
end
