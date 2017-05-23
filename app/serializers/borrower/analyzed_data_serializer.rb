class Borrower::AnalyzedDataSerializer < ActiveModel::Serializer
  include Serializer::Concerns::Formatter

  attributes :total_paid, :profit, :profit_rate

  def total_paid
    format_money_in_rub(object.total_paid)
  end

  def profit
    format_money_in_rub(object.profit)
  end

  def profit_rate
    format_rate(object.profit_rate)
  end
end
