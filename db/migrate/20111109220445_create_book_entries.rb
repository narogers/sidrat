class CreateBookEntries < ActiveRecord::Migration
  def change
    create_table :book_entries do |t|
      t.timestamps
    end
  end
end
