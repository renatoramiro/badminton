class RenameEnderecoForRuaToTecnico < ActiveRecord::Migration
  def change
  	rename_column :tecnicos, :endereco_completo, :rua
  end
end
