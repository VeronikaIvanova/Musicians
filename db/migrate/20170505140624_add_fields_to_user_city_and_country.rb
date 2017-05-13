class AddFieldsToUserCityAndCountry < ActiveRecord::Migration
  def change
    add_column :users, :country_name, :string
    add_column :users, :city_name, :string
    add_column :users, :state_name, :string
  end
end
