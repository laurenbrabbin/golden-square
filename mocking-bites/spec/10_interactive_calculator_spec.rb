require "10_interactive_calculator"

RSpec.describe InteractiveCalculator do
  it "subtracts one number from the other and returns the output" do
    terminal = double :terminal
    expect(terminal).to receive(:puts).with("Hello. I will subtract 2 numbers").ordered #do expectations first 
    expect(terminal).to receive(:puts).with("Please enter a number").ordered
    expect(terminal).to receive(:gets).and_return("6").ordered #gets always returns a string
    expect(terminal).to receive(:puts).with("Please enter another number").ordered
    expect(terminal).to receive(:gets).and_return("2").ordered
    expect(terminal).to receive(:puts).with("Here is your result:").ordered
    expect(terminal).to receive(:puts).with("6 - 2 = 4").ordered

    calculate = InteractiveCalculator.new(terminal) #run terminal after expect
    calculate.run
  end 
  it "fails if given a string rather than a number for the first number" do
    terminal = double :terminal
    expect(terminal).to receive(:puts).with("Hello. I will subtract 2 numbers").ordered #do expectations first 
    expect(terminal).to receive(:puts).with("Please enter a number").ordered
    expect(terminal).to receive(:gets).and_return("Jim").ordered #gets always returns a string

    calculate = InteractiveCalculator.new(terminal) #run terminal after expect
    expect{ calculate.run }.to raise_error "You must enter a number!"
  end 
  it "fails if given a string rather than a number for the second number" do
    terminal = double :terminal
    expect(terminal).to receive(:puts).with("Hello. I will subtract 2 numbers").ordered #do expectations first 
    expect(terminal).to receive(:puts).with("Please enter a number").ordered
    expect(terminal).to receive(:gets).and_return("6").ordered #gets always returns a string
    expect(terminal).to receive(:puts).with("Please enter another number").ordered
    expect(terminal).to receive(:gets).and_return("string").ordered

    calculate = InteractiveCalculator.new(terminal) #run terminal after expect
    expect{ calculate.run }.to raise_error "You must enter a number!"
  end
end


