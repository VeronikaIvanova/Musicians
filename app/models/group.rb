class Group < ActiveRecord::Base
  has_many :user_to_groups, :dependent => :delete_all
  has_many :users, through: :user_to_groups
belongs_to :city
belongs_to :state
belongs_to :country
  has_many :instrumentalist_to_groups, :dependent => :delete_all
  has_many :instrumentalists, through: :instrumentalist_to_groups

  has_many :group_to_genres, :dependent => :delete_all
  has_many :genres, through: :group_to_genres
  has_many :vacancies, :dependent => :delete_all
  has_many :group_notes, :dependent => :delete_all

  has_many :concert_participants, :dependent => :delete_all
  has_many :concerts, through: :concert_participants


end
