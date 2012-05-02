class AddUserToAtletas < ActiveRecord::Migration
  def change
    add_column :atletas, :user_id, :integer
    add_index :atletas, :user_id
  end
end
