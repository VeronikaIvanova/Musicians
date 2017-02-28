class AddFk < ActiveRecord::Migration
  def change
    add_foreign_key :users, :states
    add_foreign_key :users, :countries
    add_foreign_key :cities, :states
    add_foreign_key :states, :countries


  end
end
