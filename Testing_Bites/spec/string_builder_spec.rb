require "string_builder"

RSpec.describe StringBuilder do
  context "initally" do
    it "returns 0" do
      string = StringBuilder.new
      expect(string.size).to eq 0
    end
    it "returns empty string" do
      string = StringBuilder.new
      expect(string.output).to eq ""
    end
  end

  context "adding multiple strings" do
    it "returns length of combined string" do
      string = StringBuilder.new
      string.add("Cat")
      string.add("Dog")
      expect(string.size).to eq 6
    end
    it "returns combined string" do
      string = StringBuilder.new
      string.add("Cat")
      string.add("Dog")
      expect(string.output).to eq "CatDog"
    end
  end
end
