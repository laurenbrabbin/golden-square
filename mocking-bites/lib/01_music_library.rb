class MusicLibrary
  def initialize
    @tracks = []
  end

  def add(track) # track is an instance of Track
    @tracks << track
  end

  def all
    @tracks == [] ? "There are no tracks in your library" : @tracks
  end
  
  def search(keyword) # keyword is a string
    tracks_with_match = @tracks.filter do |track|
      track.matches?(keyword) 
    end
    tracks_with_match != [] ? tracks_with_match : "sorry no tracks match"
  end
end