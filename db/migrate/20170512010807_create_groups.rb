class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :information
      t.string :city_name
      t.string :state_name
      t.string :country_name

      t.timestamps null: false
    end
  end
end
