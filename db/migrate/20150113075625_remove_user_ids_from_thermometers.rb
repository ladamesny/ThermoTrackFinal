class RemoveUserIdsFromThermometers < ActiveRecord::Migration
  def change
    remove_column :thermometers, :user_id
    add_column :thermometers, :house_id, :integer
  end
end
