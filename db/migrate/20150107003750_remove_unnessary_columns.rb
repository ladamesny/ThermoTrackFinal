class RemoveUnnessaryColumns < ActiveRecord::Migration
  def change
    remove_column :users, :encrypt_password
    remove_column :thermometers, :email
  end
end
