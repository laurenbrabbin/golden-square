class RegularDiary
  def initialize
    @entries = []
    @todo_list = []
    @contacts = []
  end
  
  def add_entry(entry)
    @entries << entry
  end

  def all_entries
    @entries == [] ? "There are no saved diary entries" : @entries
  end

  def readable_entry(wpm, minutes)
    fail "no entries can be read in given time period" if readable_entries(wpm, minutes) == []
    return readable_entries(wpm, minutes).max_by(&:count_words)
  end

  def add_todo(todo)
    fail "this task is complete" if todo.done?
    @todo_list << todo
  end
  
  def all_todos
    @todo_list == [] ? "There are no todos" : @todo_list
  end

  def add_contact(contact)
    @contacts << contact
  end
  
  def all_contacts
    @contacts == [] ? "There are no saved contacts" : @contacts
  end

  private 
    def readable_entries(wpm, minutes)
      return @entries.filter do |entry|
        entry.count_words <= (wpm * minutes)
      end
    end
end
