class InstrumentalistToGroup < ActiveRecord::Base
  belongs_to :instrumentalist
  belongs_to :group
  validates :instrumentalist_id, presence: true
  validates :group_id, presence: true
end
