class UpdateSeries < ActiveRecord::Migration
  def change
     change_table :series do |t|
       t.text :description
       t.string :image
     end
  end
end
