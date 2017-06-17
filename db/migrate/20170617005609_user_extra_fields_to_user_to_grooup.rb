class UserExtraFieldsToUserToGrooup < ActiveRecord::Migration
  def change
    add_column :instrumentalist_to_groups, :user_id, :integer
    add_column :instrumentalist_to_groups, :instrument_id, :integer
  end
end
