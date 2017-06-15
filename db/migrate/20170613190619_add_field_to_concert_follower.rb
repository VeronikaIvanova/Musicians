class AddFieldToConcertFollower < ActiveRecord::Migration
  def change
   add_column :concert_followers, :role_id, :integer
   add_foreign_key :concert_followers, :roles
  end
end
