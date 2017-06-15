class ConcertFollower < ActiveRecord::Base
  belongs_to :user
  belongs_to :concert
  belongs_to :role
end
