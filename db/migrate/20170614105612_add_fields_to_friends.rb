class AddFieldsToFriends < ActiveRecord::Migration
  def change
   add_column :friends, :user1, :integer
   add_foreign_key :friends, :users, column: :user1
   add_column :friends, :user2, :integer
   add_foreign_key :friends, :users, column: :user2
  end
end
