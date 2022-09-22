require "11_string_repeater"

RSpec.describe StringRepeater do
  it "repeats a string n number of time" do
    terminal = double :terminal
    expect(terminal).to receive(:puts).with("Hello. I will repeat a string many times.").ordered
    expect(terminal).to receive(:puts).with("Please enter a string").ordered
    expect(terminal).to receive(:gets).and_return("TWIX").ordered
    expect(terminal).to receive(:puts).with("Please enter a number of repeats").ordered
    expect(terminal).to receive(:gets).and_return("10").ordered
    expect(terminal).to receive(:puts).and_return("Here is your result:").ordered
    expect(terminal).to receive(:puts).with("TWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIX").ordered

    string_repeater = StringRepeater.new(terminal)
    string_repeater.run
  end
  it "fails if number is a string" do
    terminal = double :terminal
    expect(terminal).to receive(:puts).with("Hello. I will repeat a string many times.").ordered
    expect(terminal).to receive(:puts).with("Please enter a string").ordered
    expect(terminal).to receive(:gets).and_return("TWIX").ordered
    expect(terminal).to receive(:puts).with("Please enter a number of repeats").ordered
    expect(terminal).to receive(:gets).and_return("string").ordered

    string_repeater = StringRepeater.new(terminal)
    expect{ string_repeater.run }.to raise_error "Must enter a number!"
  end
end 