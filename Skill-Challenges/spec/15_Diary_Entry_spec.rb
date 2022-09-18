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
  describe "#reading_chunk" do
    context "with a text readable in the given minutes" do
      xit "returns full contents" do
        diary_entry = DiaryEntry.new("my_title", "one two three")
        expect(diary_entry.reading_chunk(100, 2)).to eq "one two three"
      end
    end
    context "contents unreadable within the time" do
      xit "returns only a section of the contents" do
        diary_entry = DiaryEntry.new("my_title", "one two three four five")
        expect(diary_entry.reading_chunk(1, 3)).to eq "one two three"
      end
    end
      xit "restarts after reading the whole contents" do 
        diary_entry = DiaryEntry.new("my_title", "one two three")
        diary_entry.reading_chunk(2, 1)
        diary_entry.reading_chunk(2, 1)
        chunk = diary_entry.reading_chunk(2, 1)
        expect(chunk).to eq "one two"
      end

    xit "restarts if it finishes exactly on the end" do
      diary_entry = DiaryEntry.new("my_title", "one two three")
      diary_entry.reading_chunk(2, 1)
      diary_entry.reading_chunk(1, 1)
      chunk = diary_entry.reading_chunk(2, 1)
      expect(chunk).to eq "one two"
    end
  end
end
