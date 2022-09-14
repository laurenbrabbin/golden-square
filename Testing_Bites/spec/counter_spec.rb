require 'counter'

RSpec.describe Counter do
  context "initially" do
    it "adds two numbers to the counter and returns the total" do
      counter = Counter.new()
      expect(counter.report).to eq "Counted to 0 so far."
    end
  end


  context "many additions" do
    it "adds two numbers to the counter and returns the total" do
      counter = Counter.new()
      counter.add(7)
      counter.add(4)
      expect(counter.report).to eq "Counted to 11 so far."
    end
  end
end