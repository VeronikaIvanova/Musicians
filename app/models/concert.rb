class Concert < ActiveRecord::Base
belongs_to :city
belongs_to :state
belongs_to :country
has_many :concert_participants, :dependent => :delete_all
has_many :groups, through: :concert_participants

has_many :concert_followers, :dependent => :delete_all
has_many :users, through: :concert_followers

has_many :concert_notes, :dependent => :delete_all
end
