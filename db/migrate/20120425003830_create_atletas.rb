class CreateAtletas < ActiveRecord::Migration
  def change
    create_table :atletas do |t|
      t.string :codigo
      t.string :nome
      t.string :email
      t.date :data_de_nascimento
      t.text :endereco
      t.string :rg
      t.string :cpf
      t.string :nome_do_pai
      t.string :nome_da_mae
      t.string :entidade_filiada
      t.integer :ranking
      t.string :categoria

      t.timestamps
    end
  end
end
