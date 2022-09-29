require "takeaway"

RSpec.describe TakeAwayScreen do
  it "welcomes user" do
    cafe_menu = double :cafe_menu
    terminal = double :terminal
    expect(terminal).to receive(:puts).and_return("Welcome to our cafe!")
    laurens_order = TakeAwayScreen.new(terminal, cafe_menu)
    expect(laurens_order.welcome_user).to eq "Welcome to our cafe!"
  end
  it "prints selection menu" do
    cafe_menu = double :cafe_menu
    terminal = double :terminal
    expect(terminal).to receive(:puts).and_return("").ordered
    expect(terminal).to receive(:puts).and_return("How can I help you today?").ordered
    expect(terminal).to receive(:puts).and_return("").ordered
    expect(terminal).to receive(:puts).and_return("1. View Menu").ordered
    expect(terminal).to receive(:puts).and_return("2. Add Meals to Basket").ordered
    expect(terminal).to receive(:puts).and_return("3. Review my Order").ordered
    expect(terminal).to receive(:puts).and_return("4. Confirm Order").ordered
    expect(terminal).to receive(:puts).and_return("5. Exit").ordered
    expect(terminal).to receive(:puts).and_return("").ordered
    
    laurens_order = TakeAwayScreen.new(terminal, cafe_menu)
    expect(laurens_order.print_interface).to eq ""
  end
  
  describe "#confirm order" do
    it "sends a text message" do
      cafe_menu = double :cafe_menu
      terminal = double :terminal
      laurens_order = TakeAwayScreen.new(terminal, cafe_menu)
      allow(laurens_order).to receive(:confirm_order)
      expect(laurens_order).to receive(:confirm_order).and_return("Thank you for ordering with us! Please enter your telephone number to recieve a text with delivery time confirmation")
      laurens_order.confirm_order
    end
  end
end