class CreateUniqIndexOnPayments < ActiveRecord::Migration[5.1]
  def change
    add_index :payments, [:borrower_id, :month], unique: true
  end
end
