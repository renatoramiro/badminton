class AddTelefoneAndCelularToArbitros < ActiveRecord::Migration
  def change
    add_column :arbitros, :telefone, :string
    add_column :arbitros, :celular, :string
  end
end
