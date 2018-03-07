class CreateFormats < ActiveRecord::Migration
  def change
    create_table :formats do |t|
      t.string :format, :null => false
    end
  end
end
