class ConcertParticipant < ActiveRecord::Base
  belongs_to :concert
  belongs_to :group
  validates :group_id, presence: true
end
