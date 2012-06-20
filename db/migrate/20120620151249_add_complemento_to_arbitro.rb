class AddComplementoToArbitro < ActiveRecord::Migration
  def change
    add_column :arbitros, :complemento, :string
  end
end
