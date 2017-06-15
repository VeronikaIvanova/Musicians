class CreateGroupNotes < ActiveRecord::Migration
  def change
    create_table :group_notes do |t|

      t.timestamps null: false
    end
  end
end
