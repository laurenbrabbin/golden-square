require_relative "../lib/confirm_order.rb"

RSpec.describe ConfirmOrder do
  it "sends a text message" do
    customer_number = double :number
    laurens_order = ConfirmOrder.new(customer_number)
    expect(laurens_order).to receive(:send_text)
    laurens_order.send_text
  end
end
