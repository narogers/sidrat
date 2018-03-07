class EntryRelationships < ActiveRecord::Migration
  def change
    drop_table :dvd_entries if table_exists? :dvd_entries
    
    change_table :entries do |t|
      t.date :broadcast_starting
      t.date :broadcast_ending
      t.integer :season
      t.integer :episode
      t.integer :episode_count
      
      t.string :type
    end
  end
end
