require "03_grammar_checker"

RSpec.describe "grammar_checker method" do
  context "Given no sentence" do
    it "returns error" do
      expect{grammar_checker("")}.to raise_error "Not a sentence"
    end
  end
  context "Given correct sentence" do
    it "returns true" do
    result = grammar_checker("Hello how are you?")
    expect(result).to eq true
  end
end
  context "Given incorrect sentence" do
    it "returns false" do
    result = grammar_checker("hello how are you")
    expect(result).to eq false
    end
  end 
end