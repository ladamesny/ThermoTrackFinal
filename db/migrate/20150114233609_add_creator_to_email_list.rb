class AddCreatorToEmailList < ActiveRecord::Migration
  def change
    add_column :email_lists, :creator_id, :integer 
  end
end
