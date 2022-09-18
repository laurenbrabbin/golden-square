require "12_MusicTracker"

RSpec.describe MusicTracker do 
  context "returns an empty list if no songs have been added" do
    it "returns an empty list" do
      laurens_songs = MusicTracker.new
      expect(laurens_songs.list).to eq ""
    end
  end
  context "One song added to the music tracker" do
    it "returns a list of one song" do
      laurens_songs = MusicTracker.new
      laurens_songs.add("track1")
      expect(laurens_songs.list).to eq "track1"
    end
  end
  context "two songs added to the music tracker" do
    it "returns a list of two songs" do
      laurens_songs = MusicTracker.new
      laurens_songs.add("track1")
      laurens_songs.add("track2")
      expect(laurens_songs.list).to eq "track1 track2"
    end
  end
  context "no track entered" do
    it "returns an error if no track is given" do
      laurens_songs = MusicTracker.new
      expect{ laurens_songs.add("") }.to raise_error "No track has been entered, please enter a track"
    end
  end
  context "duplicate song added" do
    it "returns an error if a song has already been added" do
      laurens_songs = MusicTracker.new
      laurens_songs.add("track1")
      expect{ laurens_songs.add("track1") }.to raise_error "This track has already been inputted, please enter a new track"
    end
  end
end