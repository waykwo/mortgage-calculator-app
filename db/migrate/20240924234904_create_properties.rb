class CreateProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :properties do |t|
      t.string :address
      t.text :notes
      t.integer :purchase_price
      t.decimal :interest_rate
      t.integer :amortization
      t.integer :down_payment
      t.integer :loan_amount
      t.integer :monthly_payment
      t.integer :property_tax
      t.integer :monthly_income

      t.timestamps
    end
  end
end
