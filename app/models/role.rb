class Role < ActiveRecord::Base
  has_many :user_to_groups
  has_many :users
  has_many :concert_followers
  before_save :downcase_fields

   def downcase_fields
      self.name.downcase!
   end
end
