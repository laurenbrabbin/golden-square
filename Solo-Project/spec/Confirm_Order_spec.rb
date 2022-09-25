require "confirm_order"

RSpec.describe ConfirmOrder do
  it "returns a recipt" do
    selected_dishes = double :selected_dishes
    expect(selected_dishes).to receive(:view_selected_dishes).and_return("1x pizza: £1.50, 1x soup: £2.99")
    expect(selected_dishes).to receive(:dishes).and_return([["pizza", 1.5], ["soup", 2.99]])
    confirm_order = ConfirmOrder.new(selected_dishes)
    expect(confirm_order.recipt).to eq "Recipt: 1x pizza: £1.50, 1x soup: £2.99. Total: £4.49"
  end 
end

