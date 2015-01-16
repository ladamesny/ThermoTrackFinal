class RemoveCelsiusFromReadings < ActiveRecord::Migration
  def change
    remove_column :readings, :celsius
    remove_column :thermometers, :curr_temp_cel
  end
end
