class AddToStatus < ActiveRecord::Migration
  def change
   add_column :friends, :status_id, :integer
   add_foreign_key :friends, :statuses

   add_column :statuses, :name, :string
   add_column :concert_participants, :status_id, :integer
   add_foreign_key :concert_participants, :statuses
  end
end
