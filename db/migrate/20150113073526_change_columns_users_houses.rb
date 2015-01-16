class ChangeColumnsUsersHouses < ActiveRecord::Migration
  def change
    remove_column :users, :address
    remove_column :users, :time_zone
  end
end
