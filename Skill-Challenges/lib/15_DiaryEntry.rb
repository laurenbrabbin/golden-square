class DiaryEntry
  def initialize(title, contents) # title, contents are strings
   @title = title
   @contents = contents
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def count_words
    @contents.split(" ").length #could also do @contents.count(" ") + 1 which counts all the spaces and then adds one however would need to add an arguement for if the string is 0 words
  end

  def reading_time(wpm) # wpm is an integer representing the number of words the user can read per minute. Returns an integer representing an estimate of the reading time in minutes for the contents at the given wpm.
    fail "Please enter a number greater than 0" unless wpm.positive?
    (count_words / wpm.to_f).ceil #.to_f so it stays as decimal and .ceil so it rounds up
  end

  def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
  end
end
