class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.references :borrower, foreign_key: true
      t.integer :month
      t.decimal :amount, precision: 15, scale: 2

      t.timestamps
    end
  end
end
