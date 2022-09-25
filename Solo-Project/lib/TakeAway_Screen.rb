require_relative "../lib/menu.rb"
require_relative "../lib/placing_order.rb"
require_relative "../lib/confirm_order.rb"

class TakeAwayScreen
  def initialize(terminal, menu)
    @menu = menu
    @terminal = terminal
    @user_selection = []
  end

  def run 
    welcome_user
    loop do
      print_interface
      user_selection(@terminal.gets.chomp)
    end
  end

  def welcome_user
    @terminal.puts "welcome to our cafe"
  end

  def print_interface
    @terminal.puts ""
    @terminal.puts "How can I help you today"
    @terminal.puts ""
    @terminal.puts "1. I would like to see the menu"
    @terminal.puts "2. I would like to add meals to my basket"
    @terminal.puts "3. I would like to checkout and get a recipt"
    @terminal.puts "4. I would like to exit"
    @terminal.puts ""
  end

  def user_selection(user_input)
    case user_input
    when "1"
      menu_formatt
    when "2"
      selecting_dishes
    when "3"
      checkout
    when "4"
      exit
    else 
      @terminal.puts "please ensure a number 1-4 is entered"
    end
  end

private 
  def menu_formatt
    @terminal.puts ""
    @terminal.puts "Lunch Menu (12pm - 3pm)"
    @terminal.puts @menu.view_menu
  end

  def selecting_dishes
    customer_order = PlacingOrder.new(@menu)
    @terminal.puts ""
    @terminal.puts "Please type 'menu' when wanting to see the menu, 'view' when wanting to see the dishes that have been selected and 'exit' when wanting to checkout or exit"
    
    loop do 
      puts ""
      puts "please enter a meal to add to the basked"
      user_input = @terminal.gets.chomp

      if user_input == "view"
        puts ""
        puts customer_order.view_selected_dishes
      elsif user_input == "menu"
        menu_formatt
      elsif user_input != "exit"
       customer_order.select_dish(user_input)
      else
        break
      end
    end 

    return @user_selection = customer_order
  end

  def checkout
    confirm_order = ConfirmOrder.new(@user_selection)
    @terminal.puts ""
    @terminal.puts "Thank you for shopping with us today please see your recipt below..."
    @terminal.puts ""
    @terminal.puts confirm_order.recipt
  end
end




menu = Menu.new
new_order = TakeAwayScreen.new(Kernel, menu)
new_order.run
