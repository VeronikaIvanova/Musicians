class State < ActiveRecord::Base
  has_many :cities
  belongs_to :country
  has_many :users
  has_many :groups
  has_many :concers
end
