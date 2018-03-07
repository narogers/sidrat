class AddIconFields < ActiveRecord::Migration
  def change
    change_table :series do |t|
      t.string :icon
    end
    
    change_table :doctors do |t|
      t.string :icon
    end

    change_table :companions do |t|
      t.string :icon
    end
    
    change_table :entries do |t|
      t.string :icon
    end
  end
end
