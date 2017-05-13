class GroupToGenre < ActiveRecord::Base
  belongs_to :group
  belongs_to :genre
end
