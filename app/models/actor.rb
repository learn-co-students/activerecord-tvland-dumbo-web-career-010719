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
         #  Write a method in the Actor class, #list_roles, that lists all of the characters that actor has
         # select actor.name, show.name 
         # from actors, characters, shows
         # where actors.id = characters.actor_id and characters.show_id=shows.id


   end
end