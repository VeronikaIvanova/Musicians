class Group < ActiveRecord::Base
  has_many :user_to_groups, :dependent => :delete_all
  has_many :users, through: :user_to_groups

  has_many :instrumentalist_to_groups, :dependent => :delete_all
  has_many :instrumentalists, through: :instrumentalist_to_groups

  has_many :group_to_genres, :dependent => :delete_all
  has_many :genres, through: :group_to_genres
end
