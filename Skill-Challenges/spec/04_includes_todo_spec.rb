require "04_includes_todo" 
RSpec.describe "includes_todo method" do
  context "No text passed" do
    it "returns false" do
      result = includes_todo("")
      expect(result).to eq false
    end
  end
  context "text contains a todo" do
    it "returns true" do
      result = includes_todo("#TODO wash car")
      expect(result).to eq true
    end
  end 
  context "text does not contain todo" do
    it "returns false" do
      result = includes_todo("go shopping")
      expect(result).to eq false
    end
  end
end 
