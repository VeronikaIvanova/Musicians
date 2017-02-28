class AddCountryIdAndStateIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :state_id, :integer
    add_index :users, :state_id

    add_column :users, :country_id, :integer
    add_index :users, :country_id
  end
end
