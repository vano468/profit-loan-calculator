class BorrowerSerializer < ActiveModel::Serializer
  include ActionView::Helpers::NumberHelper

  attributes :id, :credit_amount, :credit_term, :base_rate, :delay_rate
  attributes :display_name, :display_base_rate, :display_delay_rate

  has_many :payments

  def display_name
    "borrower##{object.id} get #{display_credit_amount} ₽ for #{object.credit_term} months"
  end

  def display_credit_amount
    number_with_delimiter(object.credit_amount)
  end

  def display_base_rate
    format_rate(object.base_rate)
  end

  def display_delay_rate
    format_rate(object.delay_rate)
  end

  def analyzed_data
    ProfitAnalyzer.new(object).analyze.to_h
  end

  private

  def format_rate(value)
    number_to_percentage(value * 100, precision: 1)
  end
end
