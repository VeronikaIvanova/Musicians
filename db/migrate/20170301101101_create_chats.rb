class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.string :Theme


      t.timestamps null: false
    end
  end
end
