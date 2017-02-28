class Genre < ActiveRecord::Base
  has_many :user_genres
  has_many :users, through: :user_genres
end
