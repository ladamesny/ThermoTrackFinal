class CreateEmailList < ActiveRecord::Migration
  def change
    create_table :email_lists do |t|
      t.text :email
      t.timestamps
    end
  end
end
