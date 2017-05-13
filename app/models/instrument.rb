class Instrument < ActiveRecord::Base
  has_many :instrumentalists, :dependent => :delete_all
  has_many :users, through: :instrumentalists
end
