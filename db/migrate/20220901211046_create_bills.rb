class CreateBills < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.string :title
      t.text :description
      t.decimal :amount
      t.boolean :paid
      t.date :paid_on

      t.timestamps
    end
  end
end
