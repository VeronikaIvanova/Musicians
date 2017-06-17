class City < ActiveRecord::Base
belongs_to :state
has_many :concerts
has_many :users
has_many :groups

end
