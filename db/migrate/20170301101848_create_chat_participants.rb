class CreateChatParticipants < ActiveRecord::Migration
  def change
    create_table :chat_participants do |t|

      t.timestamps null: false
    end
  end
end
