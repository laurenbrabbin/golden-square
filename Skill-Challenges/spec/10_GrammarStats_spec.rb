require "10_GrammarStats"

RSpec.describe GrammarStats do
  describe "#check" do
    it "returns true if grammar is correct and false if not" do
      lauren_stats = GrammarStats.new
      expect(lauren_stats.check("Hello my name is Lauren!")).to eq true
      expect(lauren_stats.check("hello my name is Lauren")).to eq false
      expect(lauren_stats.check("hello my name is Lauren.")).to eq false
      expect(lauren_stats.check("Hello my name is Lauren")).to eq false
    end
    it "throws an error if no text is entered" do
      lauren_stats = GrammarStats.new
      expect{lauren_stats.check("")}.to raise_error "No text entered, please enter some text"
    end
  end
  describe "#percentage_good" do
    it "returns 100 if all number of correct text passed" do
      lauren_stats = GrammarStats.new
      lauren_stats.check("Hello friend.")
      lauren_stats.check("Hello friend!")
      expect(lauren_stats.percentage_good).to eq 100
    end
    it "returns 0 if none of the text passed is correct" do
      lauren_stats = GrammarStats.new
      lauren_stats.check("hello friend.")
      lauren_stats.check("hello friend")
      expect(lauren_stats.percentage_good).to eq 0
    end
    it "returns integer percent of correct text passed" do
      lauren_stats = GrammarStats.new
      lauren_stats.check("Hello friend.")
      lauren_stats.check("hello friend")
      expect(lauren_stats.percentage_good).to eq 50
    end
  end
end 