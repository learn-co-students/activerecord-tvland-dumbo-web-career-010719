#arcade
rock_paper_scissor = Arcade.create(game_name: "Rock, paper, scissor")
rock_paper_scissor_lizard_spock = Arcade.create(game_name: "Rock, paper, scissor, lizard, spock", price: 4)
super_mario_bros = Arcade.create(game_name: "Super Mario Bros")

#games
game_1 = Game.create(game_name: "Rock.Paper.Scissor.Lizard.Spock", username: "jocake", price: 2)
game_2 = Game.create(game_name: "Rock.Paper.Scissor.Lizard.Spock", username: "loki", price: 2)
game_3 = Game.create(game_name: "Rock.Paper.Scissor.Lizard.Spock", username: "thor", price: 2)
game_4 = Game.create(game_name: "Rock.Paper.Scissor.Lizard.Spock", username: "loki", price: 2)

#users
master = User.create(name: "Game Master", username: "Master", pin: "88888888", age:0, money: 0)
jo = User.create(name: "Joseph", username: "jocake", pin: "1001001000", age: 18)
thor = User.create(name: "Thor", username: "thor", pin: "1231231234", age: 49)
loki = User.create(name: "Loki", username: "loki", pin: "3213214321", age: 98)
ironman = User.create(name: "Ironman", username: "tony", pin: "17", age: 43)
hulk = User.create(name: "Hulk", username: "bruce", pin: "Incredible Hulk", age: 52)
blackwidow = User.create(name: "Blackwidow", username: "spy", pin: "I dont know", age: 98)
