class CreateUserNotes < ActiveRecord::Migration
  def change
    create_table :user_notes do |t|

      t.timestamps null: false
    end
  end
end
