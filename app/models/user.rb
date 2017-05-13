class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :city
  belongs_to :country
  belongs_to :state
  belongs_to :gender
  belongs_to :role
  has_many :instrumentalists
  has_many :instruments, through: :instrumentalists

  has_many :user_genres
  has_many :genres, through: :user_genres

  has_many :user_to_groups, :dependent => :delete_all
  has_many :groups, through: :user_to_groups

  has_many :messages

  has_many :chat_participants
  has_many :chats, through: :chat_participants

  

end
