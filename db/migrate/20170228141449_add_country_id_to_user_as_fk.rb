class AddCountryIdToUserAsFk < ActiveRecord::Migration
  def change
    add_foreign_key :users, :cities

  end
end
