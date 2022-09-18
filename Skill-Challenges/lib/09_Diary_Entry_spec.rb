require "09_Diary_Entry"

RSpec.describe DiaryEntry do
    it "constructs" do 
      diary_entry = DiaryEntry.new("my_title", "my contents in my diary")
      expect(diary_entry.title).to eq "my_title"
      expect(diary_entry.contents).to eq "my contents in my diary"
    end
  describe "#count_words" do #if we're focusing on one speciifc functionality we can use describe again. #count_words stand for instance methods
    it "returns the number of words in contents" do
      diary_entry = DiaryEntry.new("my_title", "my contents in my diary")
      expect(diary_entry.count_words).to eq 5
    end

    it "returns 0 when contents is empty" do
      diary_entry = DiaryEntry.new("my_title", "")
      expect(diary_entry.count_words).to eq 0
    end
  end
  describe "#reading_time" do
    context "given a wpm of 550" do
      it "returns the ceiling of the number of minutes it takes to read the contents" do
      diary_entry = DiaryEntry.new("my_title", "hello " * 550)
      expect(diary_entry.reading_time(200)).to eq 3
      end
    end
    context "given wpm of zero" do
      it "fails" do
        diary_entry = DiaryEntry.new("my_title", "hello " * 550)
        expect { diary_entry.reading_time(0) }.to raise_error "Please enter a number greater than 0"
      end
    end
  end
  describe "#reading_chunk" do
    context "with a text readable in the given minutes" do
      it "returns full contents" do
        diary_entry = DiaryEntry.new("my_title", "one two three")
        expect(diary_entry.reading_chunk(100, 2)).to eq "one two three"
      end
    end
    context "contents unreadable within the time" do
      it "returns only a section of the contents" do
        diary_entry = DiaryEntry.new("my_title", "one two three four five")
        expect(diary_entry.reading_chunk(1, 3)).to eq "one two three"
      end
    end
      it "restarts after reading the whole contents" do 
        diary_entry = DiaryEntry.new("my_title", "one two three")
        diary_entry.reading_chunk(2, 1)
        diary_entry.reading_chunk(2, 1)
        chunk = diary_entry.reading_chunk(2, 1)
        expect(chunk).to eq "one two"
      end

    it "restarts if it finishes exactly on the end" do
      diary_entry = DiaryEntry.new("my_title", "one two three")
      diary_entry.reading_chunk(2, 1)
      diary_entry.reading_chunk(1, 1)
      chunk = diary_entry.reading_chunk(2, 1)
      expect(chunk).to eq "one two"
    end
  end
end
