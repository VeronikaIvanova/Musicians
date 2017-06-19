class Vacancy < ActiveRecord::Base
  has_many :answers, :dependent => :delete_all
  has_many :users, through: :answers
  belongs_to :group
  belongs_to :instrument
end
