class Arcade < ActiveRecord::Base
  has_many :games
  has_many :users
  using Rainbow

  def self.game
      Game.list
  end
  def self.money
    curr_money = 0
    User.all.map{|user| curr_money += user.money}
    return "Total amount: $#{curr_money}".blue.bright
  end

  def self.players
    tp User.all
    "Total amount of players: #{User.all.size}.".green
  end
end
