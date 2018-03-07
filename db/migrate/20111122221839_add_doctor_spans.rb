class AddDoctorSpans < ActiveRecord::Migration
  def change
    change_table :doctors do |t|
      t.integer :start_year
      t.integer :end_year
    end
  end
end
