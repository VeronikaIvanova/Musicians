class Vacancy < ActiveRecord::Base
  has_many :answers, :dependent => :delete_all
  has_many :users, through: :answers
end
