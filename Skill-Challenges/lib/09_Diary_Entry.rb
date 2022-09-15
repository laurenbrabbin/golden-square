class DiaryEntry
  def initialize(title, contents) #these will be strings
    @title = title
    @contents = contents
    @furthest_word_read = 0 #created for the reading_chunk method
  end

  def title #returns the title as a string
    @title
  end 

  def contents #returns the contents as a string
    @contents
  end 

  def count_words #returns the number of words in the contents as an integer
    @contents.split(" ").length
  end

  def reading_time(wpm) #wpm is the reading pace of the user. reading_time retruns an integer representing number or words read per minute
    fail "Please enter a number greater than 0" unless wpm.positive?
    (count_words / wpm.to_f).ceil #.to_f so it stays as decimal and .ceil so it rounds up
  end

  def reading_chunk(wpm, minutes) #minutes is the number of minutes the user will have to read - reading chunk gives a chunk of the diary that the user will be able to read. If called again it should return the next chunk skipping what has already been given. Should continue until all contents read to which the next call asks if it should start from begining
    fail "Please enter a number greater than 0" unless wpm.positive?
    no_words_we_can_read = wpm * minutes
    start_at = @furthest_word_read
    end_at = @furthest_word_read + no_words_we_can_read
    word_list = words[start_at, end_at]

    if end_at >= count_words 
      @furthest_word_read = 0
    else
      @furthest_word_read = end_at
    end
    return word_list.join(" ")
  end

  private #methods which are not visible outside of the object - they are only used inside as a utility method

  def words
    @contents.split(" ")
  end
end