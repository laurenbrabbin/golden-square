require_relative "../lib/menu.rb"
require_relative "../lib/placing_order.rb"
require_relative "../lib/confirm_order.rb"
require 'twilio-ruby'

class TakeAwayScreen
  def initialize(terminal, menu)
    @menu = menu
    @terminal = terminal
    @customer_order = []
  end

  def run 
    welcome_user
    loop do
      print_interface
      user_selection(@terminal.gets.chomp)
    end
  end

  def welcome_user
    @terminal.puts "Welcome to our cafe!"
  end

  def print_interface
    @terminal.puts ""
    @terminal.puts "How can I help you today?"
    @terminal.puts ""
    @terminal.puts "1. View Menu"
    @terminal.puts "2. Add Meals to Basket"
    @terminal.puts "3. Review my Order"
    @terminal.puts "4. Confirm Order"
    @terminal.puts "5. Exit"
    @terminal.puts ""
  end

  def user_selection(user_input)
    case user_input
    when "1"
      menu_formatt
    when "2"
      selecting_dishes
    when "3"
      review_order
    when "4"
      confirm_order
    when "5"
      exit
    else 
      @terminal.puts "please ensure a number 1-4 is entered"
    end
  end

  def confirm_order
    fail "Nothing has been added to the basket" if @customer_order == []
    @terminal.puts "Thank you for ordering with us! Please enter your telephone number to recieve a confirmation text with delivery time"
    customer_number = @terminal.gets.chomp
    ConfirmOrder.new(customer_number).send_text
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
      puts "please enter a meal to add to the basket: pizza, soup, sandwich, milkshake"
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

    return @customer_order = customer_order
  end

  def review_order
    if @customer_order == []
      @terminal.puts ""
      @terminal.puts "Your basket is empty"
    else
      @terminal.puts ""
      @terminal.puts @customer_order.recipt
    end
  end
end

#To run
menu = Menu.new
TakeAwayScreen.new(Kernel, menu).run