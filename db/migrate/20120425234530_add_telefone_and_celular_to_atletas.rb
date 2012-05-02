class AddTelefoneAndCelularToAtletas < ActiveRecord::Migration
  def change
    add_column :atletas, :telefone, :string
    add_column :atletas, :celular, :string
  end
end
