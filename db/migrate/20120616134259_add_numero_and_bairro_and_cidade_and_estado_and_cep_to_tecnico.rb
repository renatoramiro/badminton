class AddNumeroAndBairroAndCidadeAndEstadoAndCepToTecnico < ActiveRecord::Migration
  def change
    add_column :tecnicos, :numero, :integer
    add_column :tecnicos, :bairro, :string
    add_column :tecnicos, :cidade, :string
    add_column :tecnicos, :estado, :string
    add_column :tecnicos, :cep, :string
  end
end
