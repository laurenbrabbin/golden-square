require "09_greeter"

RSpec.describe Greeter do
  it "greets the user" do
    terminal = double :terminal
    expect(terminal).to receive(:puts).with("What is your name?").ordered #need to add this as it doesn't take into consideration order (if we mix the order of greet in 09_greeter.rb the tests will still pass unless we use .ordered)
    expect(terminal).to receive(:gets).and_return("Kay").ordered
    expect(terminal).to receive(:puts).with("Hello, Kay!").ordered

    greeter = Greeter.new(terminal)
    greeter.greet
  end
  it "greets the user" do
    terminal = double :io
    expect(terminal).to receive(:puts).with("What is your name?").ordered
    expect(terminal).to receive(:gets).and_return("Lauren").ordered
    expect(terminal).to receive(:puts).with("Hello, Lauren!").ordered

    greeter = Greeter.new(terminal)
    greeter.greet
  end
end

