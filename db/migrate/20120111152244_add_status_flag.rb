class AddStatusFlag < ActiveRecord::Migration
  def change
    change_table :entries do |t|
      t.string :broadcast_status
    end
  end
end
