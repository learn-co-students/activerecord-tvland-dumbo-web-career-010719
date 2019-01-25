class CommandLineInterface
  using Rainbow
#-------------------------------------------------------------------------------
#------------------------------Greeting-----------------------------------------
#-------------------------------------------------------------------------------

  def self.greet
    starwars = TTY::Font.new(:starwars)
    doom = TTY::Font.new(:doom)
    straight = TTY::Font.new(:straight)
    prompt = TTY::Prompt.new
    puts starwars.write("Welcome")
    puts starwars.write("   -To-")
    puts straight.write("MINI")
    puts starwars.write("Arcade")
    player_or_owner
  end
  def self.player_or_owner
    prompt = TTY::Prompt.new
    starwars = TTY::Font.new(:starwars)
    who_are_you = prompt.select("Welcome, what would you like to do?") do |person|
      person.choice 'Create New Player', 1
      person.choice 'Player Login', 2
      person.choice 'Owner Login', 3
      person.choice 'Exit', 4
      end
      if who_are_you == 3
        self.owner_account
      elsif who_are_you == 2
        self.player_login
      elsif who_are_you == 1
        self.create_player
      elsif who_are_you == 4
        puts starwars.write("Goodbye")
        sleep 2
        exit
    end
  end

  def self.create_player
    starwars = TTY::Font.new(:starwars)
    prompt = TTY::Prompt.new
    puts "Let's create a new account"
    sleep 1
    puts "Your name..."
    new_player_name = gets.chomp
    puts "Create a not-so-unique Username..."
    not_unique_username = gets.chomp
    puts "Please enter a PIN number.."
    sleep 1
    puts "This is how we'll retrieve your ID/Username"
    tele = gets.chomp
    new_user = User.create(name: new_player_name, username: not_unique_username, pin: tele)
    puts "Name: #{new_user.name}, Username: #{new_user.username}, Pin: #{new_user.pin} "
    confirm = prompt.select("Confirm?") do |task|
      task.choice "Yes!", 1
      task.choice "No, I mistype something", 2
      end
    if confirm == 1
      puts starwars.write("Wooooo!")
      puts "As a new player you get..."
      sleep 1
      puts starwars.write("$20")
      sleep 1
      puts "Below is your ID and Username, you need both to log in"
      puts "ID:  #{new_user.id}"
      puts "Username: #{new_user.username}"
      sleep 2
      puts "Let's log in!"
      sleep 2
      self.player_login
      else
        new_user.delete
        self.create_player
    end

  end
  def self.owner_account
    puts "Password.."
    pass = gets.chomp
    if pass === "1234"
      self.owner_menu
    else
      puts "Not in my house!!"
      sleep 1
      self.player_or_owner
    end
  end

  def self.owner_menu
    starwars = TTY::Font.new(:starwars)
    prompt = TTY::Prompt.new
    puts starwars.write("Master")
    what_to_do = prompt.select("What would you like to do?") do |task|
      task.choice "Check total", 1
      task.choice "Check players", 2
      task.choice "Delete player", 3
      task.choice "Main menu", 4
      end
      if what_to_do == 1
        puts starwars.write("total")
        puts Arcade.money
        sleep 1
        self.owner_menu
      elsif what_to_do == 2
        puts starwars.write("players")
        User.user_tables
        yes_no = prompt.select("") do |task|
        task.choice "Go Back", 1
      end
        if yes_no == 1
            self.owner_menu
        end
      elsif what_to_do == 3
        puts starwars.write("players")
        User.user_tables
        sleep 1
        self.owner_delete_id
      elsif what_to_do == 4
        self.player_or_owner
      end
  end

  def self.owner_delete_id
    prompt = TTY::Prompt.new
    puts "Enter an ID to delete..."
    delete_id = gets.chomp
    if !!User.find_by_id(delete_id)
      User.delete(delete_id)
      puts "Player deleted"
      sleep 1
      self.owner_menu
    else
      puts "No player with that ID"
      sleep 1
      self.owner_delete_id
    end
  end

  def self.delete_player
    yes_no = prompt.select("Wrong input, would you like to try again?") do |task|
    task.choice "Try again", 1
    task.choice "Forgot ID/Username", 2
    task.choice 'Create new account', 3
    task.choice 'Main menu', 4
    end
  end


  def self.player_login
    starwars = TTY::Font.new(:starwars)
    prompt = TTY::Prompt.new
    puts "Please enter your username..."
    @user_name = gets.chomp
    puts "Please enter your id..."
    @user_id = gets.chomp
    if User.valid_no(@user_id, @user_name)
      self.main_menu
    else
      wrong_input = prompt.select("Wrong input, would you like to try again?") do |task|
      task.choice "Try again", 1
      task.choice "Forgot ID/Username", 2
      task.choice 'Create new account', 3
      task.choice 'Main menu', 4
      end
      if wrong_input == 1
        self.player_login
      elsif wrong_input == 2
        self.get_password
      elsif wrong_input == 2
        self.create_player
      else
        self.player_or_owner
      end
    end
  end

  def self.main_menu
    starwars = TTY::Font.new(:starwars)
    prompt = TTY::Prompt.new
    puts starwars.write("#{@user_name}")
    what_to_do = prompt.select("What would you like to do?") do |task|
    task.choice "Play a Game", 1
    task.choice 'Check my Info', 2
    task.choice 'Change my Username', 3
    task.choice 'Account Balance', 4
    task.choice 'Cancel my account', 5
    task.choice 'Main menu', 6
    task.choice 'Go home', 7
    end
    if what_to_do == 1
        self.play
      elsif what_to_do == 2
        sleep 1
        User.check_info(@user_id, @user_name)
      elsif what_to_do == 3
        puts "Your current Username: #{User.find(@user_id).username}"
        puts "Type in a new Username..."
        updating_username = gets.chomp
        User.change_my_username(@user_id, updating_username)
      elsif what_to_do == 4
        User.find_money_by_id(@user_id)
      elsif what_to_do == 5
        User.delete_by_id(@user_id, @user_name)
        puts "Your account has been deleted"
        puts "Logging out..."
        0.upto(3) do
          STDOUT.print "."
          sleep 0.8
        end
        puts "Thank you!"
        sleep 1
        self.greet
      elsif what_to_do == 6
        self.greet
      elsif what_to_do == 7
      puts starwars.write("Goodbye")
      sleep 2
      exit
    end
  end

#-------------------------------------------------------------------------------
#-------------------------------Task--------------------------------------------
#-------------------------------------------------------------------------------

  def self.play
    starwars = TTY::Font.new(:starwars)
    prompt = TTY::Prompt.new
    puts starwars.write("Welcome")
    # puts starwars.write("-#{@new_username}-")
    puts "Your balance: $#{User.find(@user_id).money}".blue.bright
    puts "Price of each game: " + "$2".green.bright
      which_game = prompt.select("Pick a game..") do |games|
        games.choice "Rock, paper, scissor", 1
        games.choice 'Advance - Rock, paper, scissor', 2
        games.choice 'Super Mario Bro..', 3
        games.choice 'Main menu', 4
      end
    puts which_game
    if which_game == 1
        self.play_game_1
      elsif which_game == 2
        self.play_game_2
      elsif which_game == 3
        puts starwars.write("Just")
        sleep 1
        puts starwars.write("Kidding")
        self.main_menu
      else
        self.main_menu
    end
  end

  def self.play_game_1
    new_game = Game.create(game_name: "Rock, paper...", username: @user_name)
    curr_user = User.find_by(username: @user_name)
    if curr_user.money <= 0
      puts "Your account balance is: #{curr_user.money}".red.bright
      puts "Please add credit to continue"
      sleep 1
      self.main_menu
    else
      curr_user.money -= 2
      curr_user.save
    Game.rock_paper_scissor_lizard_spock
    end
  end

  def self.play_game_2
    new_game = Game.create(game_name: "Advance-Rock, paper...", username: @user_name)
    curr_user = User.find_by(username: @user_name)
    if curr_user.money <= 0
      puts "Your account balance is: #{curr_user.money}".red.bright
      puts "Please add credit to continue"
      sleep 1
      self.main_menu
    else
      curr_user.money -= 2
      curr_user.save
    Game.advance_rock_paper_scissor_lizard_spock
    end
  end

  def self.get_password
    User.find_password
  end
end
