class Diary
  def initialize
    @entries = []
  end

  def add(entry) 
    fail "no entry has been given" unless entry != ""
    @entries << entry
  end

  def all
    @entries
  end

  def count_words
    return @entries.map(&:count_words).sum #map will go over all entires and call the count_word method and then sum all together. can also refactor into @entires.sum(&:count_words)
  end

  def reading_time(wpm) 
    fail "Please enter a number greater than 0" unless wpm.positive?
    return (count_words / wpm.to_f).ceil  #must call the method on the instance variable
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    return readable_entires(wpm, minutes).max_by(&:count_words) #max_by gives the maximum value
  end

private
  def readable_entires(wpm, minutes)
    return @entries.filter do |entry|
      entry.reading_time(wpm) <= minutes
    end
  end
end
