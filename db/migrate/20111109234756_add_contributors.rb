class AddContributors < ActiveRecord::Migration
  def change
    create_table :contributors do |t|
      t.string :name
      t.text :description
    end
    
    create_table :entries_contributors do |t|
      t.references :entry
      t.references :contributor
    end
  end
end
