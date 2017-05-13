class Role < ActiveRecord::Base
  has_many :user_to_groups
  has_many :users
  before_save :downcase_fields

   def downcase_fields
      self.name.downcase!
   end
end
