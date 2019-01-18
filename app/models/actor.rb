class Actor < ActiveRecord::Base
   has_many :characters
   has_many :shows, through: :characters

   def full_name
    "#{self.first_name} #{self.last_name}"
   end

   def list_roles
         # result=[]
         # for character in characters
           
         #       if character.show_id == show.id
         #        result<<"#{character.name} - #{show.name}"
         #       end
         #    end
         # end

         # result

         characters.map do |char|
            "#{char.name} - #{char.show.name}"
         end
   end
end