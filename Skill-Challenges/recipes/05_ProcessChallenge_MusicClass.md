# {{PROBLEM}} Method Design Recipe

## 1. Describe the Problem
  > as a user
  > so that I can keep track of my music listening
  > I want to add tracks I've listened to and see a list of them 

## 2. Design the Class Interface

```Ruby
class MusicTracker
  def initiliaze 
  end

  def add(track) #track is a string which represents one song
  #returns nothing
  #returns error if no track is entered
  #returns error if a song has already been inputted
  end

  def list
  #returns a list of songs
  end
end

```

## 3. Create Examples as Tests
 
 ```ruby
 #1 returns an empty list if no songs have been added
   laurens_songs = MusicTracker.new
   expect(laurens_songs.list).to eq ""
  
#2 one song added to the list
   laurens_songs = MusicTracker.new
   laurens_songs.add("track1")
   expect(laurens_songs.list).to eq "track1"

#3 two songs added to the list
   laurens_songs = MusicTracker.new
   laurens_songs.add("track1")
   laurens_songs.add("track2")
   expect(laurens_songs.list).to eq "track1 track2"
  
#4 returns error if no track is entered
   laurens_songs = MusicTracker.new
   expect{ laurens_songs.add("")}.to raise_error "No track has been entered, please enter a track"

#5 returns error if song has already been inputted
   laurens_songs = MusicTracker.new
   laurens_songs.add("track1")
   expect{ laurens_songs.add("track1")}.to raise_error "This track has already been inputted, please enter a new track"
 ```

## 4. Implement the Behaviour
