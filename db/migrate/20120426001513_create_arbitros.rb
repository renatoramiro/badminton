class CreateArbitros < ActiveRecord::Migration
  def change
    create_table :arbitros do |t|
      t.string :nome
      t.date :data_de_nascimento
      t.string :email
      t.text :endereco_completo
      t.string :rg
      t.string :cpf
      t.text :cursos_de_arbitragem
      t.date :ano_do_curso_de_arbitragem

      t.timestamps
    end
  end
end
