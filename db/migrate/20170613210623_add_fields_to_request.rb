class AddFieldsToRequest < ActiveRecord::Migration
  def change
   add_column :request_groups, :group_id, :integer
   add_foreign_key :request_groups, :groups
   add_column :request_groups, :concert_id, :integer
   add_foreign_key :request_groups, :concerts
  end
end
