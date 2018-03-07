class PublisherName < ActiveRecord::Migration
  def change
    change_table :publishers do |t|
      t.string :name, :nil => false
    end
  end
end
