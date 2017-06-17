class Country < ActiveRecord::Base
  has_many :states
  has_many :users
  has_many :groups
  has_many :concers
end
