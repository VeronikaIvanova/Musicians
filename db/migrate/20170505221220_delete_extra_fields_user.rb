class DeleteExtraFieldsUser < ActiveRecord::Migration
  def change
    remove_foreign_key :users, :cities
    remove_foreign_key :users, :states
    remove_foreign_key :users, :countries

    remove_column :users, :city_id
    remove_column :users, :state_id
    remove_column :users, :country_id

    drop_table :cities
    drop_table :states
    drop_table :countries
  end
end
