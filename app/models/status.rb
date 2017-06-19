class Status < ActiveRecord::Base

   def downcase_fields
      self.name.downcase!
   end
end
