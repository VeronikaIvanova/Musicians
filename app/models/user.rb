class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
          :remberable 
belongs_to :city
belongs_to :state
belongs_to :country
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

  has_many :answers, :dependent => :delete_all
  has_many :vacancies, through: :answers

  has_many :user_notes, :dependent => :delete_all
  has_many :group_notes, :dependent => :delete_all


  has_many :concert_followers, :dependent => :delete_all
  has_many :concerts, through: :concert_followers

  has_many :concert_notes, :dependent => :delete_all

end
