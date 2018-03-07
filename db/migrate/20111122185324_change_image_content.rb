class ChangeImageContent < ActiveRecord::Migration
  def change
    remove_column :series, :icon
    remove_column :doctors, :icon
    remove_column :companions, :icon
    remove_column :entries, :icon
  end
end
