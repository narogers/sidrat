class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title, :null => false
      
      t.integer :rating
      
      t.text :description
      t.date :released_on
      t.integer :length
      t.text :image
    end
  end
end
