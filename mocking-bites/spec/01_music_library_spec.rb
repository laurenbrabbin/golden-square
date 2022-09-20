require "01_music_library"

RSpec.describe MusicLibrary do 
  it "adds one track and lists that track" do
    laurens_music = MusicLibrary.new
    track_1 = double :track
    laurens_music.add(track_1)
    expect(laurens_music.all).to eq [track_1]
  end
  it "adds more than one track and lists all tracks" do
    laurens_music = MusicLibrary.new
    track_1 = double :track
    track_2 = double :track
    laurens_music.add(track_1)
    laurens_music.add(track_2)
    expect(laurens_music.all).to eq [track_1, track_2]
  end
  it "lets user know if there are no tracks in library" do
    laurens_music = MusicLibrary.new
    expect(laurens_music.all).to eq "There are no tracks in your library"
  end
  it "searches tracks by title" do  #however this test will pass with any given keyword since it is set to true
    laurens_music = MusicLibrary.new
    track_1 = double :track, matches?: true #instead can do --> expect(track_1).to recieve(:matches?).with("one").and_return(true) --> this will assign it a keyword that will pass as true
    track_2 = double :track, matches?: false #instead can do --> expect(track_2).to recieve(:matches?).with("one").and_return(false) --> this will assign it a keyword that will pass as true
    laurens_music.add(track_1)
    laurens_music.add(track_2)
    expect(laurens_music.search("one")).to eq [track_1] 
    
  end
end