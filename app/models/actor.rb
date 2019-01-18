class Actor < ActiveRecord::Base
   has_many :characters
   has_many :shows, through: :characters

   def full_name
    "#{self.first_name} #{self.last_name}"
   end

   def list_roles
      #   all_characters=characters.select {|char| char.actor_id = self.id}
      # all_shows=Show.all.select {|show| show.id == all_characters.show_id}
      # "#{all_characters.name} - #{all_shows.name}"
      
      result=[]
         for character in characters
            for show in shows
               if character.show_id == show.id
                result<<"#{character.name} - #{show.name}"
               end
            end
         end
         result
   end
end