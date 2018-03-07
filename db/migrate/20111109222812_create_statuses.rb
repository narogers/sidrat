class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :state, :null => false
    end
  end
end
