class Addfields < ActiveRecord::Migration
  def change
   add_column :concert_notes, :user_id, :integer
   add_foreign_key :concert_notes, :users
   add_column :concert_notes, :text, :text
   add_column :concert_notes, :concert_id, :integer
   add_foreign_key :concert_notes, :concerts


   add_column :concert_followers, :user_id, :integer
   add_foreign_key :concert_followers, :users
   add_column :concert_followers, :concert_id, :integer
   add_foreign_key :concert_followers, :concerts

   add_column :concert_participants, :group_id, :integer
   add_foreign_key :concert_participants, :groups
   add_column :concert_participants, :concert_id, :integer
   add_foreign_key :concert_participants, :concerts

  end
end
