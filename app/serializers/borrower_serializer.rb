class BorrowerSerializer < ActiveModel::Serializer
  has_many :payments
end
