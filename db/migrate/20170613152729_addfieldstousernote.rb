class Addfieldstousernote < ActiveRecord::Migration
  def change
   add_column :user_notes, :user_id, :integer
   add_foreign_key :user_notes, :users
   add_column :user_notes, :text, :text
  end
end
