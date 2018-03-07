class CreateCompanions < ActiveRecord::Migration
  def change
    create_table :companions do |t|
      t.string :played_by, :null => false
      
      t.text :description
      t.string :image
    end
  end
end
