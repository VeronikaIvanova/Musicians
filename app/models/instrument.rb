class Instrument < ActiveRecord::Base
  has_many :instrumentalists, :dependent => :delete_all
  has_many :users, through: :instrumentalists
  has_many :vacancies, :dependent => :delete_all
end
