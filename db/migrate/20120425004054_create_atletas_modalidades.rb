class CreateAtletasModalidades < ActiveRecord::Migration
  def change
  	create_table "atletas_modalidades", :id => false, :force => true do |t|
  		t.integer "atleta_id", :null => false
  		t.integer "modalidade_id", :null => false
  	end
  end
end
