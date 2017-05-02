class AddMessageToChat < ActiveRecord::Migration
  def change
    add_column :messages, :chat_id, :integer
    add_index :messages, :chat_id

    add_column :messages, :user_id, :integer
    add_index :messages, :user_id

    add_foreign_key :messages, :users
    add_foreign_key :messages, :chats

  end
end
