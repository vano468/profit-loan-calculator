class Borrower < ApplicationRecord
  has_many :payments, dependent: :destroy
end
