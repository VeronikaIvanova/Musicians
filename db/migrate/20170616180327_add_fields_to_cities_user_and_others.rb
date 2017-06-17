class AddFieldsToCitiesUserAndOthers < ActiveRecord::Migration
  def change
    remove_column :users, :city_name
    remove_column :users, :state_name
    remove_column :users, :country_name

    remove_column :groups, :city_name
    remove_column :groups, :state_name
    remove_column :groups, :country_name

    remove_column :concerts, :city
    remove_column :concerts, :state
    remove_column :concerts, :country

    add_column :concerts, :city_id, :integer
    add_column :groups, :city_id, :integer
    add_column :users, :city_id, :integer

    add_foreign_key :concerts, :cities
    add_foreign_key :groups, :cities
    add_foreign_key :users, :cities

    add_foreign_key :cities, :states
    add_foreign_key :states, :countries
  end
end
