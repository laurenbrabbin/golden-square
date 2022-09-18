require "15_Diary"

RSpec.describe Diary do
  context "add one diary entry to an empty diary" do
    it "returns a list of that one entry" do
      lauren_diary = Diary.new
      lauren_diary.add("monday_contents")
      expect(lauren_diary.all).to eq ["monday_contents"]
    end
    it "has a word count of 0" do
      diary = Diary.new
      expect(diary.count_words).to eq 0
    end
    it "has a reading time of 0" do
      diary = Diary.new
      expect(diary.reading_time(2)).to eq 0
    end
    it "has a best readable entry of nil" do
      diary = Diary.new
      expect(diary.find_best_entry_for_reading_time(2, 1)).to eq nil
    end
  end
end