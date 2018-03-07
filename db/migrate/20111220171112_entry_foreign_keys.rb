class EntryForeignKeys < ActiveRecord::Migration
  def up
    create_table :publishers do |t|
      t.string :name
    end

    create_table :entries_publishers do |t|
      t.references :entry
      t.references :publisher
    end
    
    remove_column :entries, :status_id
    remove_column :entries, :format_id
    add_column :entries, :format, :string, :nil => false
    add_column :entries, :status, :string
    
    drop_table :formats
    drop_table :statuses
  end
  
  def down
    add_column :entries, :status_id, :integer
    add_column :entries, :format_id, :integer
    remove_column :entries, :format
    remove_column :entries, :status
    
    create_table :formats do |t|
      t.string :format
    end
    
    create_table :statuses do |t|
      t.string :state
    end

 	drop_table :entries_publisher
 	drop_table :publishers
  end
end
