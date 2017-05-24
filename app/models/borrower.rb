class Borrower < ApplicationRecord
  has_many :payments, -> { order(:month) }, dependent: :destroy
end
