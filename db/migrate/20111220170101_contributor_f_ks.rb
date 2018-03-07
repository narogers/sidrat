class ContributorFKs < ActiveRecord::Migration
  def change
    change_table :contributors do |t|
      t.references :entry
    end
  end
end
