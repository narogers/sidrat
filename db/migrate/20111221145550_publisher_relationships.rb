class PublisherRelationships < ActiveRecord::Migration
  def up
    add_column :entries, :publisher_id, :integer
    drop_table :entries_publishers    
  end

  def down
    create_table :entries_publishers do |t|
      t.references :entry
      t.references :publisher
    end
    remove_column :entries, :publisher_id, :integer
  end
end
