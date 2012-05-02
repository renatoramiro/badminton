class AddUserToTecnicos < ActiveRecord::Migration
  def change
    add_column :tecnicos, :user_id, :integer
    add_index :tecnicos, :user_id
  end
end
