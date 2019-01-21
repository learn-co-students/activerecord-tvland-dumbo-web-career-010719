require 'pry'
class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def list_roles
    # x = []
    # for character in characters
    #   for show in shows
    #     if character.show_id == show.id
    #       x << "#{character.name} - #{show.name}"
    #     end
    #   end
    # end
    # x
    self.characters.map do |character|
      "#{character.name} - #{character.show.name}"
    end
  end



end
