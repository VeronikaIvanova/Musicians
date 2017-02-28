class AddCountryIdToState < ActiveRecord::Migration
  def change
    add_column :states, :country_id, :integer
    add_index :states, :country_id    
  end
end
