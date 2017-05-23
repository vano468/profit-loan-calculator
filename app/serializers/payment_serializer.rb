class PaymentSerializer < ActiveModel::Serializer
  include Serializer::Concerns::Formatter

  attributes :id, :borrower_id, :month, :amount
  attributes :display_info, :display_amount

  def display_info
    "#{object.month} month — #{display_amount}"
  end

  def display_amount
    format_money_in_rub(object.amount)
  end
end
