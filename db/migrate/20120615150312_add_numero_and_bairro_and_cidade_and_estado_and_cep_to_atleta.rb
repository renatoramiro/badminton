class AddNumeroAndBairroAndCidadeAndEstadoAndCepToAtleta < ActiveRecord::Migration
  def change
    add_column :atletas, :numero, :integer
    add_column :atletas, :bairro, :string
    add_column :atletas, :cidade, :string
    add_column :atletas, :estado, :string
    add_column :atletas, :cep, :string
  end
end
