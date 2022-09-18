require "15_DiaryEntry"

RSpec.describe DiaryEntry do
  context "new entry added" do
    it "returns the title and contents" do
      monday_entry = DiaryEntry.new("monday", "today I went to the park to see the ducks")
      expect(monday_entry.title).to eq "monday"
      expect(monday_entry.contents).to eq "today I went to the park to see the ducks"
    end
  end
  context "returns the number of words in the contents" do
    it "returns the number of words in the contents" do
      monday_entry = DiaryEntry.new("Monday", "I went to the park today and saw a duck")
      expect(monday_entry.count_words).to eq 10
    end
    it "returns zero if there are no contents" do
      monday_entry = DiaryEntry.new("Monday", "")
      expect(monday_entry.count_words).to eq 0
    end
  end
  describe "#ready_time" do
    it "returns the reading time of contents rounded to the nearest minute" do
      monday_entry = DiaryEntry.new("monday", "today I went to the park to see the ducks")
      result = monday_entry.reading_time(2)
      expect(result).to eq 5
    end
    it "returns an error if wpm is 0" do 
      monday_entry = DiaryEntry.new("monday", "today I went to the park to see the ducks")
      expect{ monday_entry.reading_time(0) }.to raise_error "Please enter a number greater than 0"
    end
  end
end
