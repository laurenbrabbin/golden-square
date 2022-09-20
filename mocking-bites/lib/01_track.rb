class Track
  def initialize(title, artist) # title and artist are both strings
    fail "Please make sure both title and artist are inputted" if title == "" || artist == ""
    @title = title
    @artist = artist
  end

  def matches?(keyword) # keyword is a string
    keyword == @title || keyword == @artist ? true : false
  end
end