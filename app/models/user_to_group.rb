class UserToGroup < ActiveRecord::Base
  belongs_to :role
  belongs_to :user
  belongs_to :group

end
