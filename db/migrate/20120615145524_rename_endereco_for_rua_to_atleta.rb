class RenameEnderecoForRuaToAtleta < ActiveRecord::Migration
  def change
		rename_column(:atletas, :endereco, :rua)  
  end
end
