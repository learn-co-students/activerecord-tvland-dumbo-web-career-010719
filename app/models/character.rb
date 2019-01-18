class Character < ActiveRecord::Base
    belongs_to :actor
    belongs_to :show

    def say_that_thing_you_say
        name = Character.pluck("name").pop()
        catchphrase = Character.pluck("catchphrase").pop()
        "#{name} always says: #{catchphrase}"
    end
end

    
