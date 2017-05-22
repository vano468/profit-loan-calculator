class BorrowerSerializer < ActiveModel::Serializer
  include ActionView::Helpers::NumberHelper

  attributes :id, :credit_amount, :credit_term, :base_rate, :delay_rate
  attributes :display_name, :display_base_rate, :display_delay_rate

  has_many :payments

  def display_name
    credit_amount = number_with_delimiter(object.credit_amount)
    "borrower##{object.id} | #{credit_amount} ₽ for #{object.credit_term} months"
  end

  def display_base_rate
    number_to_percentage(object.base_rate * 100, precision: 1)
  end

  def display_delay_rate
    number_to_percentage(object.delay_rate * 100, precision: 1)
  end

  def analyzed_data
    ProfitAnalyzer.new(object).analyze.to_h
  end
end
