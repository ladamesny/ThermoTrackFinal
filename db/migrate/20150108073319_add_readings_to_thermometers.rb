class AddReadingsToThermometers < ActiveRecord::Migration
  def change
    add_column :thermometers, :readings_on, :bool
  end
end
