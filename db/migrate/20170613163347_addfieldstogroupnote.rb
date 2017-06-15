class Addfieldstogroupnote < ActiveRecord::Migration
  def change
   add_column :group_notes, :user_id, :integer
   add_foreign_key :group_notes, :users

   add_column :group_notes, :text, :text

   add_column :group_notes, :group_id, :integer
   add_foreign_key :group_notes, :groups
  end
end
