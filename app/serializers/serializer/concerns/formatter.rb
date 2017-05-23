module Serializer::Concerns::Formatter
  include ActionView::Helpers::NumberHelper

  def format_money_in_rub(val)
    number_with_delimiter(val) + ' ₽'
  end

  def format_rate(value)
    number_to_percentage(value * 100, precision: 1)
  end
end
