class Actor < ActiveRecord::Base
   has_many :characters
   has_many :shows, through: :characters

   def full_name
    "#{self.first_name} #{self.last_name}"
   end

   def list_roles
        name=characters.find {|char| char.actor_id = self.id}
        show_name=Show.all.find {|show| show.id == name.show_id}
         "#{name.name} - #{show_name.name}"
   end
end