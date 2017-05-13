class Chat < ActiveRecord::Base
  has_many :messages, :dependent => :delete_all
  has_many :chat_participants, :dependent => :delete_all
  has_many :users, through: :chat_participants
  validates :Theme, presence: true
end
