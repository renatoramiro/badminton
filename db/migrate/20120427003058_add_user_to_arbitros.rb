class AddUserToArbitros < ActiveRecord::Migration
  def change
    add_column :arbitros, :user_id, :integer
    add_index :arbitros, :user_id
  end
end
