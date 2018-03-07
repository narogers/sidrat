class AddCompanionNames < ActiveRecord::Migration
  def change
    change_table :companions do |t|
      t.string :name, :required
    end
  end
end
