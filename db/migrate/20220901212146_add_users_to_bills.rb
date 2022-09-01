class AddUsersToBills < ActiveRecord::Migration[7.0]
  def change
    add_column :bills, :user_id, :integer
    add_column :bills, :person2_id, :integer
    add_index :bills, :user_id
  end
end
