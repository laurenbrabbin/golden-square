require "01_make_snippet"

RSpec.describe "make_snippet method" do
  context "given an empty string" do 
    it "retruns an empty string" do
      result = make_snippet("")
      expect(result).to eq ""
    end
  end
  context "given string greater than or equal to 5 words" do
    it "Takes first five words followed by ..." do
      result = make_snippet("Today I went to the shop to buy apples")
      expect(result).to eq "Today I went to the ..."
    end
  end 
  context "given string that is less than 5 words" do
    it "Takes all words followed by ..." do
      result = make_snippet("I swam")
      expect(result).to eq "I swam"
    end
  end
end
