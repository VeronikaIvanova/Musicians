class CreateUserToGroups < ActiveRecord::Migration
  def change
    create_table :user_to_groups do |t|

      t.timestamps null: false
    end
  end
end
