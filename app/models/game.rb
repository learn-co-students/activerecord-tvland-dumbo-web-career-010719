class Game < ActiveRecord::Base
  has_many :users
  belongs_to :arcade
  # belongs_to :user
  @@list = [["Rock, paper, scissor"],["Rock, paper, scissor, lizard and Spock"]]

  def self.list
    @@list
  end

  def self.again
    prompt = TTY::Prompt.new
      task = prompt.select("Play again?") do |games|
        games.choice "Yes!!", 1
        games.choice 'Nah, return to main menu', 2
      end
      if task == 1
      CommandLineInterface.play_game_1
      else
        CommandLineInterface.main_menu
    end
  end

  def self.again_2
    prompt = TTY::Prompt.new
      task = prompt.select("Play again?") do |games|
        games.choice "Yes!!", 1
        games.choice 'Nah, return to main menu', 2
      end
      if task == 1
      CommandLineInterface.play_game_2
      else
        CommandLineInterface.main_menu
    end
  end

  def self.rock_paper_scissor_lizard_spock
    starwars = TTY::Font.new(:starwars)
    doom = TTY::Font.new(:doom)
    prompt = TTY::Prompt.new

    rock = "
           _______
      ---'    ____)
             (_____)
             (_____)
             (____)
      ---.__ (___)
      "
    paper = "
          _______
      ---'   ____)____
                ______)
                _______)
               _______)
      ---.__________)
      "
    scissor = "
          _______
      ---'   ____)____
                ______)
             __________)
            (____)
      ---.__(___)
    "
    weapon_choice = [rock, paper, scissor]
    aiAns = weapon_choice.sample
    puts "Let's play Rock, Paper, Scissor!"
    puts "Rock paper scissor set..."

    meAns = prompt.select("Pick a weapon..") do |games|
    games.choice "Rock", rock
    games.choice 'Paper', paper
    games.choice 'Scissor', scissor
  end

    puts "Your choice :#{meAns} vs. A.I. :#{aiAns}"
    sleep 1

    if meAns == rock && aiAns == scissor
      puts ("Player wins!!")
      sleep 1
      self.again
    elsif meAns == paper && aiAns == rock
      puts ("Player wins!!")
      sleep 1
      self.again
    elsif meAns == scissor && aiAns == paper
      puts ("Player wins!!")
      sleep 1
      self.again
    elsif meAns == aiAns
      puts ("Draw?! AGAIN!")
      sleep 1
      Game.rock_paper_scissor_lizard_spock
    else
      puts ("Ai wins!!")
      sleep 1
      self.again
    end
  end


  def self.advance_rock_paper_scissor_lizard_spock
    starwars = TTY::Font.new(:starwars)
    doom = TTY::Font.new(:doom)
    prompt = TTY::Prompt.new

    rock = "
           _______
      ---'    ____)
             (_____)
             (_____)
             (____)
      ---.__ (___)
      "
    paper = "
          _______
      ---'   ____)____
                ______)
                _______)
               _______)
      ---.__________)
      "
    scissor = "
          _______
      ---'   ____)____
                ______)
             __________)
            (____)
      ---.__(___)
    "
    lizard = "
         _____________
      /``___  ________)
    _/ `  /////  _, -`
      /////   _./
           _/'
    __,--- `
    "

    spock = "
        _______
    ---'   ____)____
              ______)
             _______)
            |_______
             _______)
    ---.__________)
    "

    weapon_choice = [rock, paper, scissor, lizard, spock]
    aiAns = weapon_choice.sample
    puts "Let's play Rock, Paper, Scissor, Lizrd, Spock!"
    puts "Rock paper scissor lizrd spock set..."
    sleep 1
    meAns = prompt.select("Pick a weapon..") do |games|
    games.choice "Rock", rock
    games.choice 'Paper', paper
    games.choice 'Scissor', scissor
    games.choice 'Lizard', lizard
    games.choice 'Spock', spock
  end

    puts "Your choice :#{meAns} vs. A.I. :#{aiAns}"
    sleep 1

    if (meAns == rock) && (aiAns == scissor || aiAns == lizard)
      puts ("Player wins!!")
      sleep 1
      self.again_2
    elsif (meAns == paper) && (aiAns == rock || aiAns == spock)
      puts ("Player wins!!")
      sleep 1
      self.again_2
    elsif (meAns == scissor) && (aiAns == paper || aiAns == lizard)
      puts ("Player wins!!")
      sleep 1
      self.again_2
    elsif meAns == aiAns
      puts "Draw!?"
      sleep 1
      puts "Lets play again!"
      sleep 1
      Game.advance_rock_paper_scissor_lizard_spock
    else
      puts ("Ai wins!!")
      sleep 1
      self.again_2
    end
  end

end
