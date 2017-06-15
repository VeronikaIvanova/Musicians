class CreateRequestGroups < ActiveRecord::Migration
  def change
    create_table :request_groups do |t|

      t.timestamps null: false
    end
  end
end
