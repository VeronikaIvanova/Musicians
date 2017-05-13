class AddFieldsToInstrumentalistToGroup < ActiveRecord::Migration
  def change
   add_column :instrumentalist_to_groups, :instrumentalist_id, :integer
   add_column :instrumentalist_to_groups, :group_id, :integer
   add_foreign_key :instrumentalist_to_groups, :instrumentalists
   add_foreign_key :instrumentalist_to_groups, :groups
  end
end
