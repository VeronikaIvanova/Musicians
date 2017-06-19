class Vacancy < ActiveRecord::Base
  has_many :answers, :dependent => :delete_all
  has_many :users, through: :answers
  belongs_to :group
  belongs_to :instrument

  validates :instrument_id, presence: true
  validates :group_id, presence: true

end
