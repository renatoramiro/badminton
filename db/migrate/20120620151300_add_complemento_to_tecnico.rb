class AddComplementoToTecnico < ActiveRecord::Migration
  def change
    add_column :tecnicos, :complemento, :string
  end
end
