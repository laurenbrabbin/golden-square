require "placing_order"

RSpec.describe PlacingOrder do
  context "initially" do
    it "fails when wanting to view selected dishes" do
      cafe_menu = double :cafe_menu
      laurens_order = PlacingOrder.new(cafe_menu)
      expect {laurens_order.view_selected_dishes}.to raise_error "no selected dishes"
    end
  end
  context "dish recognised" do
    it "presents a list of added meals" do
      cafe_menu = double :cafe_menu
      expect(cafe_menu).to receive(:find_meal).with("pizza").and_return(["pizza", 1.5])
      expect(cafe_menu).to receive(:find_meal).with("soup").and_return(["soup", 2.99])
      laurens_order = PlacingOrder.new(cafe_menu)
      laurens_order.select_dish("pizza")
      laurens_order.select_dish("soup")
      expect(laurens_order.view_selected_dishes).to eq "1x pizza: £1.50, 1x soup: £2.99"
    end
    it "returns the stored selected meal" do
      cafe_menu = double :cafe_menu
      expect(cafe_menu).to receive(:find_meal).with("pizza").and_return(["pizza", 1.5])
      expect(cafe_menu).to receive(:find_meal).with("soup").and_return(["soup", 2.99])
      laurens_order = PlacingOrder.new(cafe_menu)
      laurens_order.select_dish("pizza")
      laurens_order.select_dish("soup")
      expect(laurens_order.dishes).to eq [["pizza", 1.5], ["soup", 2.99]]
    end
  end
end
