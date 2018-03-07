class AddLabelToSeries < ActiveRecord::Migration
  def change
    change_table :series do |t|
      t.string :category, :null => false
      t.string :abbreviation, :null => false
    end
  end
end
