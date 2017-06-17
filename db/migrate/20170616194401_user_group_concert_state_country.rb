class UserGroupConcertStateCountry < ActiveRecord::Migration
  def change
    add_column :concerts, :state_id, :integer
    add_column :groups, :state_id, :integer
    add_column :users, :state_id, :integer

    add_foreign_key :concerts, :states
    add_foreign_key :groups, :states
    add_foreign_key :users, :states

    add_column :concerts, :country_id, :integer
    add_column :groups, :country_id, :integer
    add_column :users, :country_id, :integer

    add_foreign_key :concerts, :countries
    add_foreign_key :groups, :countries
    add_foreign_key :users, :countries
  end
end
