class CreateBorrowers < ActiveRecord::Migration[5.1]
  def change
    create_table :borrowers do |t|
      t.decimal :credit_amount, precision: 15, scale: 2
      t.date :credit_taken_at
      t.integer :credit_term
      t.decimal :base_rate, precision: 8, scale: 5
      t.decimal :delay_rate, precision: 8, scale: 5

      t.timestamps
    end
  end
end
