class AddFieldsToUserToGroup < ActiveRecord::Migration
  def change
   add_column :user_to_groups, :user_id, :integer
   add_column :user_to_groups, :group_id, :integer
   add_column :user_to_groups, :role_id, :integer  
   add_foreign_key :user_to_groups, :users
   add_foreign_key :user_to_groups, :groups
   add_foreign_key :user_to_groups, :roles
  end
end
