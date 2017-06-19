class ConcertNote < ActiveRecord::Base
  belongs_to :concert
  belongs_to :user
  validates :concert_id, presence: true
  validates :text, presence: true
end
