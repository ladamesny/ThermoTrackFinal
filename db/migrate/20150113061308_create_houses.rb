class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :name
      t.string :time_zone
      t.timestamps
    end
  end
end
