require "DiaryEntry"

RSpec.describe DiaryEntry do
  context "no title or contents have been entered" do
    it "returns error" do
      expect{ monday_entry = DiaryEntry.new("monday", "") }.to raise_error "please ensure niether title nor contents are empty"
    end
  end
  describe "#count_words" do
    context "when provided with contents" do
      it "returns the number of words of the contents" do
        monday_entry = DiaryEntry.new("monday", "I went to the park")
        expect(monday_entry.count_words).to eq 5
      end
    end
  end
end