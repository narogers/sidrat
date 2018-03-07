class AddDoctorLabel < ActiveRecord::Migration
  def change
    change_table :doctors do |t|
      t.string :label
    end
  end
end
