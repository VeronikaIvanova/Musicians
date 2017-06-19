class Resume < ActiveRecord::Base
  has_many :resume_genres, :dependent => :delete_all
  has_many :genres, through: :resume_genres
  belongs_to :instrumentalist
  validates :instrumentalist_id, presence: true

end
