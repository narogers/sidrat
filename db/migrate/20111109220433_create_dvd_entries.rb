class CreateDvdEntries < ActiveRecord::Migration
  def change
    create_table :dvd_entries do |t|
      t.date :broadcast_starting
      t.date :broadcast_ending
      
      t.integer :season
      t.integer :episode
      t.integer :episode_count
    end
  end
end
