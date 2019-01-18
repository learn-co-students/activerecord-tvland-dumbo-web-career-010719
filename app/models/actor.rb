class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def list_roles
    char_name = self.characters.find do |a| a.name end
    char_show = self.shows.find do |a| a.name end

    ans = "#{char_name.name} - #{char_show.name}"
    # binding.pry
    ans
  end

end
