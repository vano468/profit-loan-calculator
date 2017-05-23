class PaymentSerializer < ActiveModel::Serializer
  include ActionView::Helpers::NumberHelper

  attributes :id, :month, :amount
  attributes :display_info, :display_amount

  def display_info
    "#{object.month} month — #{display_amount}"
  end

  def display_amount
    number_with_delimiter(object.amount) + ' ₽'
  end
end
