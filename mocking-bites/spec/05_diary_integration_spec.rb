require "05_diary"
require "05_secret_diary"

RSpec.describe "Integration" do
  context "initially" do
    it "fails if content is locked" do
      monday_entry = Diary.new("contents of the diary")
      laurens_diary = SecretDiary.new(monday_entry)
      expect{ laurens_diary.read }.to raise_error "Go away!the diary is locked"
    end
  end
  context "when it is unlocked" do
    it "returns the content" do
      monday_entry = Diary.new("contents of the diary")
      laurens_diary = SecretDiary.new(monday_entry)
      laurens_diary.unlock
      expect(laurens_diary.read).to eq monday_entry
    end
  end
  context "when it is relocked" do
    it "fails and does not read the diary" do
      monday_entry = Diary.new("contents of the diary")
      laurens_diary = SecretDiary.new(monday_entry)
      laurens_diary.unlock
      laurens_diary.lock
      expect{ laurens_diary.read }.to raise_error "Go away!the diary is locked"
    end
  end
end