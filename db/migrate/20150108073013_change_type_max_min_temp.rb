class ChangeTypeMaxMinTemp < ActiveRecord::Migration
  def change
    remove_column :thermometers, :max_temp
    remove_column :thermometers, :min_temp
    add_column :thermometers, :max_temp, :integer
    add_column :thermometers, :min_temp, :integer
  end
end
