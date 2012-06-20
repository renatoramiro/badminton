class AddComplementoToAtleta < ActiveRecord::Migration
  def change
    add_column :atletas, :complemento, :string
  end
end
