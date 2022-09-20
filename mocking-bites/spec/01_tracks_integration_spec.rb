require "01_track"
require "01_music_library"

RSpec.describe "Integration" do
  describe "#all" do
    context "one track added" do
      it "returns that one song" do
        laurens_music = MusicLibrary.new
        track1 = Track.new("title1", "artist1")
        laurens_music.add(track1)
        expect(laurens_music.all).to eq [track1]
      end
    end
    context "more than one track added" do
      it "returns all tracks" do
        laurens_music = MusicLibrary.new
        track1 = Track.new("title1", "artist1")
        track2 = Track.new("title2", "artist2")
        track3 = Track.new("title3", "artist3")
        laurens_music.add(track1)
        laurens_music.add(track2)
        laurens_music.add(track3)
        expect(laurens_music.all).to eq [track1, track2, track3]
      end
    end
    context "no tracks added" do
      it "lets user know there are no tracks" do
        laurens_music = MusicLibrary.new
        expect(laurens_music.all).to eq "There are no tracks in your library"
      end
    end
  end
  describe "#search(keyword)" do
    context "keyword matches the one track in the library" do
      it "returns that track" do
        laurens_music = MusicLibrary.new
        track1 = Track.new("title1", "artist1")
        laurens_music.add(track1)
        expect(laurens_music.search("title1")).to eq [track1]
      end
    end
    context "keyword does not match with the one track in the library" do
      it "lets the user know there are no tracks" do
        laurens_music = MusicLibrary.new
        track1 = Track.new("title1", "artist1")
        laurens_music.add(track1)
        expect(laurens_music.search("title3")).to eq "sorry no tracks match"
      end
    end
    context "keyword matches with one track out of multiple in the library" do
      it "returns that track" do
        laurens_music = MusicLibrary.new
        track1 = Track.new("title1", "artist1")
        track2 = Track.new("title2", "artist2")
        track3 = Track.new("title3", "artist3")
        laurens_music.add(track1)
        laurens_music.add(track2)
        laurens_music.add(track3)
        expect(laurens_music.search("title2")).to eq [track2]
      end
    end
    context "keyword does not match with any tracks out of multiple in the library" do
      it "lets the user know there are no tracks" do
        laurens_music = MusicLibrary.new
        track1 = Track.new("title1", "artist1")
        track2 = Track.new("title2", "artist2")
        track3 = Track.new("title3", "artist3")
        laurens_music.add(track1)
        laurens_music.add(track2)
        laurens_music.add(track3)
        expect(laurens_music.search("title4")).to eq "sorry no tracks match"
      end
    end
    context "multiple tracks match with the keyword" do
      it "returns a list of all tracks" do
        laurens_music = MusicLibrary.new
        track1 = Track.new("title1", "artist1")
        track2 = Track.new("title2", "artist2")
        track3 = Track.new("title3", "artist2")
        laurens_music.add(track1)
        laurens_music.add(track2)
        laurens_music.add(track3)
        expect(laurens_music.search("artist2")).to eq [track2, track3]
      end
    end
  end
end