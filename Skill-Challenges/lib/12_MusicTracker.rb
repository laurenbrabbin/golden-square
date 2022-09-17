class MusicTracker
  def initialize
    @tracks = []
  end
  
  def add(track)
    if track == ""
      fail "No track has been entered, please enter a track"
    elsif @tracks.include?(track)
      fail "This track has already been inputted, please enter a new track"
    else
      @tracks << track
    end
  end
  
  def list
    @tracks.join(" ")
  end
end