require_relative "../lib/menu.rb"

RSpec.describe Menu do
  it "prints menu" do
    cafe_menu = Menu.new
    expect(cafe_menu.view_menu).to eq ["pizza: £1.50", "soup: £2.99", "sandwich: £3.00", "milkshake: £3.50"]
  end
  it "returns the dish if keyword matches" do
    cafe_menu = Menu.new
    expect(cafe_menu.find_meal("pizza")).to eq ["pizza", 1.5]
  end
  it "lets user know if keyword does not match any dish" do
    cafe_menu = Menu.new
    expect{cafe_menu.find_meal("piza")}.to raise_error "meal not recognised"
  end
end