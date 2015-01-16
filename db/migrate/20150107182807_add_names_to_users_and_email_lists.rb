class AddNamesToUsersAndEmailLists < ActiveRecord::Migration
  def change
    add_column :users, :name, :text
    add_column :users, :address, :text
    add_column :email_lists, :name, :text
  end
end
