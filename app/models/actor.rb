class Actor < ActiveRecord::Base
    has_many :characters
    has_many :shows, through: :characters

    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    def list_roles
        show = shows.pluck("name").pop()
        char = characters.pluck("name").pop()
        "#{char} - #{show}"
    end

end