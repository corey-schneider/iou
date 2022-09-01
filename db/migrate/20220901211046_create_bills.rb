class CreateBills < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.string :title
      t.text :description
      t.decimal :amount
      t.boolean :paid, default: false, null: false
      t.date :paid_on
      t.string :paid_via
      t.date :transaction_date

      t.timestamps
    end
  end
end
