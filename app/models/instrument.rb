class Instrument < ActiveRecord::Base
  has_many :instrumentalists
  has_many :users, through: :instrumentalists
end
