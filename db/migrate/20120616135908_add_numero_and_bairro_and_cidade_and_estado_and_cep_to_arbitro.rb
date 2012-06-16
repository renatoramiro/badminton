class AddNumeroAndBairroAndCidadeAndEstadoAndCepToArbitro < ActiveRecord::Migration
  def change
    add_column :arbitros, :numero, :integer
    add_column :arbitros, :bairro, :string
    add_column :arbitros, :cidade, :string
    add_column :arbitros, :estado, :string
    add_column :arbitros, :cep, :string
  end
end
