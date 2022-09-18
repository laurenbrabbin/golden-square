require "15_DiaryEntry"
require "15_Diary"

RSpec.describe "integration" do
  context "given an entry" do
    it "adds one entry into the diary and returns that entries" do
      lauren_diary = Diary.new
      monday_entry = DiaryEntry.new("Monday", "I went to the park today and saw a duck")
      lauren_diary.add(monday_entry)
      result = lauren_diary.all
      expect(result).to eq [monday_entry]
    end
    it "adds two entries into the diary and returns all entries" do
      lauren_diary = Diary.new
      monday_entry = DiaryEntry.new("Monday", "I went to the park today and saw a duck")
      tuesday_entry = DiaryEntry.new("Tuesday", "I feel very happy today")
      lauren_diary.add(monday_entry)
      lauren_diary.add(tuesday_entry)
      result = lauren_diary.all
      expect(result).to eq [monday_entry, tuesday_entry]
    end
  end
  context "given no entry" do
    it "returns an error when no entry is given" do
      lauren_diary = Diary.new
      expect { lauren_diary.add("") }.to raise_error "no entry has been given"
    end
  end
  describe "#count_words" do
    it "retruns the number of words in the diary" do
      lauren_diary = Diary.new
      monday_entry = DiaryEntry.new("Monday", "I went to the park today and saw a duck")
      tuesday_entry = DiaryEntry.new("Tuesday", "I feel very happy today")
      lauren_diary.add(monday_entry)
      lauren_diary.add(tuesday_entry)
      expect(lauren_diary.count_words).to eq 15
    end
    it "returns 0 if there are 0 words in the diary" do
      lauren_diary = Diary.new
      monday_entry = DiaryEntry.new("Monday", "")
      lauren_diary.add(monday_entry)
      expect(lauren_diary.count_words).to eq 0
    end
  end
  describe "#reading_time" do
    it "returns the reading time of all the contents in the diary" do
      lauren_diary = Diary.new
      monday_entry = DiaryEntry.new("Monday", "I went to the park today and saw a duck")
      lauren_diary.add(monday_entry)
      expect(lauren_diary.reading_time(2)).to eq 5
    end
    it "returns the reading time of two of more entries" do
      lauren_diary = Diary.new
      monday_entry = DiaryEntry.new("Monday", "I went to the park today and saw a duck")
      tuesday_entry = DiaryEntry.new("Tuesday", "I feel very happy today")
      lauren_diary.add(monday_entry)
      lauren_diary.add(tuesday_entry)
      expect(lauren_diary.reading_time(2)).to eq 8
    end
    it "returns an error if wpm equals 0" do
      lauren_diary = Diary.new
      monday_entry = DiaryEntry.new("Monday", "I went to the park today and saw a duck")
      tuesday_entry = DiaryEntry.new("Tuesday", "I feel very happy today")
      lauren_diary.add(monday_entry)
      lauren_diary.add(tuesday_entry)
      expect{ lauren_diary.reading_time(0) }.to raise_error "Please enter a number greater than 0"
    end
  end
  describe "#find_best_entry_for_reading_time" do
    it "fails where wpm is 0" do #passes without adding to fuind_best_entry_method as fail is in the reading_time method
      lauren_diary = Diary.new
      monday_entry = DiaryEntry.new("Monday", "I went to the park")
      lauren_diary.add(monday_entry)
      expect{ lauren_diary.find_best_entry_for_reading_time(0, 5) }.to raise_error "Please enter a number greater than 0"
    end
    context "Where we just have one entry and it is readable in the time" do
      it "returns that entry" do
        lauren_diary = Diary.new
        monday_entry = DiaryEntry.new("Monday", "I went to the park")
        lauren_diary.add(monday_entry)
        result = lauren_diary.find_best_entry_for_reading_time(1, 5)
        expect(result).to eq monday_entry
      end
    end
    context "where we have one entry however it is longer than reading_time" do
      it "returns nil" do
        lauren_diary = Diary.new
        monday_entry = DiaryEntry.new("Monday", "I went to the park")
        lauren_diary.add(monday_entry)
        result = lauren_diary.find_best_entry_for_reading_time(1, 2)
        expect(result).to eq nil
      end
    end
    context "where we have more than one entry"
    it "returns the longest entry to read in a given time" do
      lauren_diary = Diary.new
      monday_entry = DiaryEntry.new("Monday", "one")
      tuesday_entry = DiaryEntry.new("Tuesday", "one two")
      wednesday_entry = DiaryEntry.new("Monday", "one two three")
      thursday_entry = DiaryEntry.new("Monday", "one two three four")
      lauren_diary.add(monday_entry)
      lauren_diary.add(tuesday_entry)
      lauren_diary.add(wednesday_entry)
      lauren_diary.add(thursday_entry)
      result = lauren_diary.find_best_entry_for_reading_time(2, 1)
      expect(result).to eq tuesday_entry
    end
  end
end