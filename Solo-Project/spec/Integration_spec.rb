require "placing_order"
require "menu"
require "confirm_order"

RSpec.describe "Integration" do
  context "initially" do
    it "fails when wanting to view selected dishes" do
      cafe_menu = Menu.new
      laurens_order = PlacingOrder.new(cafe_menu)
      expect {laurens_order.view_selected_dishes}.to raise_error "no selected dishes"
    end
  end
  context "dish recognised" do
    it "presents a list of added meals" do
      cafe_menu = Menu.new
      laurens_order = PlacingOrder.new(cafe_menu)
      laurens_order.select_dish("pizza")
      laurens_order.select_dish("soup")
      laurens_order.select_dish("pizza")
      expect(laurens_order.view_selected_dishes).to eq "2x pizza: £3.00, 1x soup: £2.99"
    end
    it "returns an array of the stored selected meals" do
      cafe_menu = Menu.new
      laurens_order = PlacingOrder.new(cafe_menu)
      laurens_order.select_dish("pizza")
      laurens_order.select_dish("soup")
      laurens_order.select_dish("pizza")
      expect(laurens_order.dishes).to eq [["pizza", 1.5], ["soup", 2.99], ["pizza", 1.5]]
    end
  end
  context "dish not recognised" do
    it "lets user know that the dish was not recognised" do
      cafe_menu = Menu.new
      laurens_order = PlacingOrder.new(cafe_menu)
      expect{ laurens_order.select_dish("piza") }.to raise_error "meal not recognised"
    end
  end 
  context "confirming order" do
    it "returns a recipt" do
      cafe_menu = Menu.new
      laurens_order = PlacingOrder.new(cafe_menu)
      laurens_order.select_dish("pizza")
      laurens_order.select_dish("soup")
      laurens_order.select_dish("pizza")
      confirm_order = ConfirmOrder.new(laurens_order)
      expect(confirm_order.recipt).to eq "Recipt: 2x pizza: £3.00, 1x soup: £2.99. Total: £5.99"
    end
    it "fails if no dishes selected" do
      cafe_menu = Menu.new
      laurens_order = PlacingOrder.new(cafe_menu)
      confirm_order = ConfirmOrder.new(laurens_order)
      expect{confirm_order.recipt}.to raise_error "no selected dishes"
    end
  end
end