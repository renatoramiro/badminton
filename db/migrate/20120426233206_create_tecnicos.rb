class CreateTecnicos < ActiveRecord::Migration
  def change
    create_table :tecnicos do |t|
      t.string :nome
      t.date :data_de_nascimento
      t.string :telefone
      t.string :celular
      t.string :email
      t.text :endereco_completo
      t.string :rg
      t.string :cpf
      t.string :intituicao_de_ensino
      t.string :cref

      t.timestamps
    end
  end
end
