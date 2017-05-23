class PaymentSerializer < ActiveModel::Serializer
  attributes :id, :month, :amount
end
