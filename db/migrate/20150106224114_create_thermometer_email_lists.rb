class CreateThermometerEmailLists < ActiveRecord::Migration
  def change
    create_table :thermometer_email_lists do |t|
      t.integer :thermometer_id, :email_list_id
      t.timestamps
    end
  end
end
