class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.integer :order, :null => false
      t.string :played_by, :null => false
      
      t.text :description
      t.string :image
    end
  end
end
