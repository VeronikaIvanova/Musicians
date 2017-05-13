class CreateGroupToGenres < ActiveRecord::Migration
  def change
    create_table :group_to_genres do |t|

      t.timestamps null: false
    end
  end
end
