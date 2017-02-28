class AddColumnsToUserGenre < ActiveRecord::Migration
  def change
    add_column :user_genres, :user_id, :integer
    add_index :user_genres, :user_id

    add_column :user_genres, :genre_id, :integer
    add_index :user_genres, :genre_id

    add_foreign_key :user_genres, :users
    add_foreign_key :user_genres, :genres

  end
end
