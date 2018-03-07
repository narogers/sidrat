class AddSeriesRanges < ActiveRecord::Migration
  def change
    change_table :series do |t|
      t.integer :series_started_on
      t.integer :series_ended_on
    end
  end
end
