class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.references :borrower, foreign_key: true
      t.decimal :amount, precision: 15, scale: 2
      t.date :paid_at

      t.timestamps
    end
  end
end
