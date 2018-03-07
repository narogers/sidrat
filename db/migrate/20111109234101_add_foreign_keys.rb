class AddForeignKeys < ActiveRecord::Migration
  def change
    change_table :entries do |t|
      t.references :status
      t.references :series
      t.references :format
    end
    
    create_table :doctors_companions do |t|
      t.references :doctor
      t.references :companion
    end
    
    create_table :entries_doctors do |t|
      t.references :entry
      t.references :doctor
    end
    
    create_table :entries_companions do |t|
      t.references :entry
      t.references :companion
    end
  end
end
