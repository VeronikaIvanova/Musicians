class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :city
  belongs_to :country
  belongs_to :state
  has_many :instrumentalists
  has_many :instruments, through: :instrumentalists

  has_many :user_genres
  has_many :genres, through: :user_genres

end
