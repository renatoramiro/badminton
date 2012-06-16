class RenameEnderecoForRuaToArbitro < ActiveRecord::Migration
  def change
  	rename_column :arbitros, :endereco_completo, :rua
  end
end
