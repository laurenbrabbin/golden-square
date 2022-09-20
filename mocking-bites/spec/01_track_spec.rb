require "01_track"

RSpec.describe Track do
  context "title or track empty" do
    it "returns an error" do
      expect{ track1 = Track.new("", "artist1")}.to raise_error "Please make sure both title and artist are inputted"
      expect{ track1 = Track.new("title1", "")}.to raise_error "Please make sure both title and artist are inputted"
      expect{ track1 = Track.new("", "")}.to raise_error "Please make sure both title and artist are inputted"
    end
  end
  describe "#matches?" do
    context "keyword matches title" do
      it "returns true" do
        track1 = Track.new("title1", "artist1")
        expect(track1.matches?("title1")).to eq true
      end
    end
    context "keyword matches artist" do
      it "returns true" do 
        track1 = Track.new("title1", "artist1")
        expect(track1.matches?("artist1")).to eq true
      end
    end
    context "keyword does not match either the title or artist" do
      it "returns false" do
        track1 = Track.new("title1", "artist1")
        expect(track1.matches?("artist3")).to eq false
      end
    end
  end
end