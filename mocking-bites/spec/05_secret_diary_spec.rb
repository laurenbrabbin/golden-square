require "05_secret_diary"

RSpec.describe SecretDiary do
  context "initially" do
    it "fails since the content is locked" do
      fake_entry = double(:fake_entry, contents: "I went to the shop")
      laurens_diary = SecretDiary.new(fake_entry)
      expect{ laurens_diary.read }.to raise_error "Go away!the diary is locked"
    end
  end
  context "when unlocked" do
    it "returns the content" do
      fake_entry = double(:fake_entry, contents: "I went to the shop")
      laurens_diary = SecretDiary.new(fake_entry)
      laurens_diary.unlock
      expect(laurens_diary.read).to eq fake_entry
    end
  end
  context "when relocked" do
    it "fails and does not read the diary" do
      fake_entry = double(:fake_entry, contents: "I went to the shop")
      laurens_diary = SecretDiary.new(fake_entry)
      laurens_diary.unlock
      laurens_diary.lock
      expect{ laurens_diary.read }.to raise_error "Go away!the diary is locked"
    end
  end
end