class User < ActiveRecord::Base
  # belongs_to :game
  belongs_to :arcade
  has_many :games
  using Rainbow


  def self.user_tables
    tp User.all
  end

  def self.valid_no(id, username)
    if !!User.find_by_id(id)
      if User.find(id).username == username
        return true
      end
    end
    return false
  end


  def self.delete_by_id(id, username)
    prompt = TTY::Prompt.new
    if self.valid_no(id, username)
      really = prompt.select("Confirm?") do |task|
        task.choice "Yes".red + ", delete my account", 1
        task.choice "No, goto Main Menu", 2
        end
        if really == 1
          User.delete(id)
        else
          CommandLineInterface.main_menu
        end
     end
  end


  def self.check_info(id, username)
    if self.valid_no(id, username)
      tp User.find(id)
    end
    CommandLineInterface.main_menu
  end

  def self.find_money_by_id(id)
    prompt = TTY::Prompt.new
    starwars = TTY::Font.new(:starwars)
    # binding.pry
    puts starwars.write("#{User.find_by_id(id).username}")
    user = User.find(id).money
    puts "Account balance: $#{user}".blue.bright
    sleep 1
    @task_input = prompt.select("What would you like to do?") do |task|
      task.choice "Add credit", 1
      task.choice "Main Menu", 2
      end
    if @task_input == 1
      amount = prompt.select("How much would you like to add?") do |task|
        task.choice "10", 1
        task.choice "20", 2
        task.choice "50", 3
        task.choice "100", 4
        end
        if amount == 1
          curr_user = User.find(id)
          new_amount = curr_user.money += 10
          curr_user.update(money: new_amount)
          sleep 1
          puts "Done!"
          puts "Your current balance: $#{curr_user.money}".blue.bright
        elsif amount == 2
          curr_user = User.find(id)
          new_amount = curr_user.money += 20
          curr_user.update(money: new_amount)
          sleep 1
          puts "Done!"
          puts "Your current balance: $#{curr_user.money}".blue.bright
        elsif amount == 3
          curr_user = User.find(id)
          new_amount = curr_user.money += 50
          curr_user.update(money: new_amount)
          sleep 1
          puts "Done!"
          puts "Your current balance: $#{curr_user.money}".blue.bright
        elsif amount == 4
          curr_user = User.find(id)
          new_amount = curr_user.money += 100
          curr_user.update(money: new_amount)
          sleep 1
          puts "Done!"
          puts "Your current balance: $#{curr_user.money}".blue.bright
        end
    else
      CommandLineInterface.main_menu
    end
    sleep 1
    CommandLineInterface.main_menu
  end

  def self.change_my_username(id, username)
      new_username = User.find_by_id(id)
      new_username.username = username
      new_username.save
      puts "Your new Username: #{new_username.username}".yellow.bright
      sleep 1
      CommandLineInterface.player_login
  end

  def self.find_password
    prompt = TTY::Prompt.new
    puts "Enter your tele number..."
    check_tel = gets.chomp
    if !!User.find_by(pin: check_tel)
      puts "ID: #{User.find_by(pin: check_tel).id}, Username: #{User.find_by(pin: check_tel).username}"
      CommandLineInterface.player_login
    else
      puts "Sorry, that does not match any info in our system"
      sleep 1
      @retry = prompt.select("Try a different number?") do |task|
        task.choice "Yes, retry please.", 1
        task.choice "Create a new account", 2
      end
      if @retry == 1
        self.find_password
      else
        CommandLineInterface.create_player
      end
    end
  end
end
