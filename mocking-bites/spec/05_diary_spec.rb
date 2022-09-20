require "05_diary"

RSpec.describe Diary do
  context "initially" do
    it "returns an empty array if no contents given" do
      entry = Diary.new("")
      expect(entry.read).to eq ""
    end
  end
  context "given contents" do
    it "returns the contents" do
      entry = Diary.new("hello")
      expect(entry.read).to eq "hello"
    end
  end
end