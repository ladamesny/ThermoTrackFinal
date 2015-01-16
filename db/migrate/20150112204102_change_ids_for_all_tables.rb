class ChangeIdsForAllTables < ActiveRecord::Migration
  def change
    remove_column :users, :id
    remove_column :thermometers, :id
    remove_column :readings, :id

    add_column :users, :id, :primary_key
    add_column :thermometers, :id, :primary_key
    add_column :readings, :id, :primary_key
  end
end
