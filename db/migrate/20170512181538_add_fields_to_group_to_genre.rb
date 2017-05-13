class AddFieldsToGroupToGenre < ActiveRecord::Migration
  def change
   add_column :group_to_genres, :group_id, :integer
   add_foreign_key :group_to_genres, :groups

   add_column :group_to_genres, :genre_id, :integer
   add_foreign_key :group_to_genres, :genres
  end
end
