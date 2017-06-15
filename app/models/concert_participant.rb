class ConcertParticipant < ActiveRecord::Base
  belongs_to :concert
  belongs_to :group
end
