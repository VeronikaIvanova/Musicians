class AddFieldsToChartParticipant < ActiveRecord::Migration
  def change
    add_column :chat_participants, :chat_id, :integer
    add_index :chat_participants, :chat_id
    add_column :chat_participants, :user_id, :integer
    add_index :chat_participants, :user_id

    add_foreign_key :chat_participants, :users
    add_foreign_key :chat_participants, :chats
  end
end
