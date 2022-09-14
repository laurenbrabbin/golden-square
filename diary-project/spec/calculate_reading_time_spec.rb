require "calculate_reading_time"

RSpec.describe "calculate_reading_time method" do
  context "given an empty string" do
    it "it returns zero" do
      result = calculate_reading_time("")
      expect(result).to eq 0
    end
  end
  context "given text under 200 words" do 
    it "returns 1" do 
      result = calculate_reading_time("One Word")
      expect(result).to eq 1
    end
  end
  context "given text is 200 words" do
    it "returns 1" do 
      result = calculate_reading_time("One " * 200)
      expect(result).to eq 1
    end
  end
  context "given text is 300 words" do
    it "returns 2" do 
      result = calculate_reading_time("One " * 300)
      expect(result).to eq 2
    end
  end
  context "given text is 400 words" do
    it "returns 2" do 
      result = calculate_reading_time("One " * 300)
      expect(result).to eq 2
    end
  end
  context "given text is 5000 words" do
    it "returns 25" do 
      result = calculate_reading_time("One " * 5000)
      expect(result).to eq 25
    end
  end
end 