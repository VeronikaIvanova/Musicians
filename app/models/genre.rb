class Genre < ActiveRecord::Base
  has_many :user_genres, :dependent => :delete_all
  has_many :users, through: :user_genres

  has_many :resume_genres, :dependent => :delete_all
  has_many :resumes, through: :resume_genres

  has_many :group_to_genres, :dependent => :delete_all
  has_many :groups, through: :group_to_genres
end
