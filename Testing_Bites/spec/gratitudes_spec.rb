require 'gratitudes'

RSpec.describe Gratitudes do
  context "initially" do
    it "returns no gratitudes" do
      gratitude = Gratitudes.new()
      expect(gratitude.format).to eq "Be grateful for: "
    end
  end
  
  context "multiple additions" do
    it "returns multiple gratitudes" do
      gratitude = Gratitudes.new()
      gratitude.add("life")
      gratitude.add("love")
      expect(gratitude.format).to eq "Be grateful for: life, love"
    end
  end
end
