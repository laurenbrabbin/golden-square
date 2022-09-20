## 1. Describe the Problem
  > as a user
  > So that I can record my experiences
  > I want to keep a regular diary

  > As a user
  > So that I can reflect on my experiences
  > I want to read my past diary entries

  > As a user
  > So that I can reflect on my experiences in my busy day
  > I want to select diary entries to read based on how much time I have and my reading speed

  > As a user
  > So that I can keep track of my tasks
  > I want to keep a todo list along with my diary

  > As a user
  > So that I can keep track of my contacts
  > I want to see a list of all of the mobile phone numbers in all my diary entries

## 2. Design the Class System

```Ruby

class RegularDiary
  def intialize
    #contacts, todos, entries
  end
  
  def add_entry(entry)
    #adds entry to all entries
  end

  def all_entries
    #returns a list of all entries
  end

  def readable_entry(wpm, minutes)
    #returns a readable chunk given the users reading speed and time
  end

  def add_todo(todo)
    #adds incomplete todos to all todo list
  end
  
  def all_todos
    #returns a list of all incomplete todos
  end

  def add_contact(contact)
    #adds a new contact to all contacts
  end
  
  def all_contacts
    #returns names and mobile phone numbers of all contacts
  end

  private 
    def readable_entries(wpm, minutes)
      #filters out the entries that can be read in given time period
    end
end

class Contact 
  def initialise(name, number)
  end 
  def name
    #returns the name of the contact
  end
  def number
    #returns the number of the contact 
  end
end

class DiaryEntry
  def initialise(title, contents)
    #stores the title and content of the entry
  end

  def count_words
    #returns the number of words in the entry 
  end
end

class Todo
  def initialise(task)
  end

  def task
    #returns the task if it is complete or incomplete
  end

  def mark_done!
    #marks tasks as complete
  end

  def done?
    #returns true if the task is complete and false if not
  end
end


```

## 3. Create Examples as Integration Tests
 
 ```ruby
#1 adding one diary entry and returning that entry
  laurens_diary = RegularDiary.new
  monday_entry = DiaryEntry.new("monday", "I went to the park")
  laurens_diary.add(monday_entry)
  expect(laurens_diary.all_entries).to eq monday_entry

#2 adding two diary entries and returning both entries
  laurens_diary = RegularDiary.new
  monday_entry = DiaryEntry.new("monday", "I went to the park")
  tuesday_entry = DiaryEntry.new("tuesday", "I ate apples")
  laurens_diary.add(monday_entry)
  laurens_diary.add(tuesday_entry)
  expect(laurens_diary.all_entries).to eq monday_entry tuesday_entry

#3 returning entry if it can be read in given reading time
  laurens_diary = RegularDiary.new
  monday_entry = DiaryEntry.new("monday", "I went to the park")
  laurens_diary.add(monday_entry)
  result = laurens_diary.readable_entry(1, 5)
  expect(result).to eq monday_entry

#4 returning the most suitable entry out of multiple given the wpm and minutes
  laurens_diary = RegularDiary.new
  monday_entry = DiaryEntry.new("monday", "I went to the park")
  tuesday_entry = DiaryEntry.new("tuesday", "I ate apples")
  wednesday_entry = DiaryEntry.new("wednesday", "I am going to see my friends at a cafe this afternoon")
  laurens_diary.add(monday_entry)
  laurens_diary.add(tuesday_entry)
  laurens_diary.add(wednesday_entry)
  result = laurens_diary.readable_entry(1, 5)
  expect(result).to eq monday_entry

#5 returns error if no entries can be read 
  laurens_diary = RegularDiary.new
  monday_entry = DiaryEntry.new("monday", "I went to the park")
  tuesday_entry = DiaryEntry.new("tuesday", "I ate apples")
  wednesday_entry = DiaryEntry.new("wednesday", "I am going to see my friends at a cafe this afternoon")
  laurens_diary.add(monday_entry)
  laurens_diary.add(tuesday_entry)
  laurens_diary.add(wednesday_entry)
  expect{ laurens_diary.readable_entry(1, 2) }.to raise_error "no entries can be read in given time period"

#6 adds one todo and returns that todo when all todos are called
  laurens_diary = RegularDiary.new
  monday_todo = Todo.new("wash car")
  laurens_diary.add_todo(monday_todo)
  expect(laurens_diary.all_todos).to eq monday_todo

#7 adds multiple todos and returns all todos when all todos are called
  laurens_diary = RegularDiary.new
  monday_todo = Todo.new("wash car")
  tuesday_todo = Todo.new("shopping")
  laurens_diary.add_todo(monday_todo)
  laurens_diary.add_todo(tuesday_todo)
  expect(laurens_diary.all_todos).to eq monday_todo tuesday_todo

#8 returns only the incomplete todos
  laurens_diary = RegularDiary.new
  monday_todo = Todo.new("wash car")
  tuesday_todo = Todo.new("shopping")
  monday_todo.mark_done!
  laurens_diary.add_todo(monday_todo)
  laurens_diary.add_todo(tuesday_todo)
  expect(laurens_diary.all_todos).to eq tuesday_todo

#9 one contact added and returns that contanst
  laurens_diary = RegularDiary.new
  tom = Contact.new("tom", "0787878787")
  laurens_diary.add_contact(tom)
  expect(laurens_diary.all_contacts).to eq tom

#10 two contacts added and returns both contants
  laurens_diary = RegularDiary.new
  tom = Contact.new("tom", "0787878787")
  lulu = Contact.new("lulu", "0121212121")
  laurens_diary.add_contact(tom)
  laurens_diary.add_contact(lulu)
  expect(laurens_diary.all_contacts).to eq tom lulu

#11 returns nil if there are no contacts 
  laurens_diary = RegularDiary.new
  expect(laurens_diary.all_contacts).to eq []

#12 returns nil if there are no todos 
  laurens_diary = RegularDiary.new
  expect(laurens_diary.all_todos).to eq []

#13 returns nil if there are no entries
  laurens_diary = RegularDiary.new
  expect(laurens_diary.all_entries).to eq n[]

#14 returns error if there are no entries and readable_entry is called
  laurens_diary = RegularDiary.new
  expect{laurens_diary.readable_entry}.to raise_error "no entries have been submitted"

 ```
## 4. Create Examples as Unit Tests
 ```ruby

# DiaryEntry
  #1 counts the number of words in an entry
    monday_entry = DiaryEntry.new("monday", "I went to the park")
    expect(monday_entry.count_words).to eq 5
  
  #2 returns error if no title or contents have been entered
    expect{monday_entry = DiaryEntry.new("monday", "")}.to raise_error "please ensure niether title nor contents are empty"
    expect{monday_entry = DiaryEntry.new("", "contents")}.to raise_error "please ensure niether title nor contents are empty"
    expect{monday_entry = DiaryEntry.new("", "")}.to raise_error "please ensure niether title nor contents are empty"

# ToDo
  #1 returns true if the task is complete
    monday_todo = Todo.new("wash car")
    monday_todo.mark_done!
    expect(monday_todo.done?).to eq true

  #2 returns true if the task is complete
    monday_todo = Todo.new("wash car")
    expect(monday_todo.done?).to eq false
  
  #3 returns the task and it's status
    monday_todo = Todo.new("wash car")
    expect(monday_todo.task).to eq "wash car: incomplete"


# Contact
  #1 returns error if no name has been entered
    expect{ lauren = Contact.new("", "0789898") }.to raise_error "Please ensure both name and number have been submitted"
    expect{ lauren = Contact.new("lauren", "") }.to raise_error "Please ensure both name and number have been submitted"
  
  #2 returns the name of the contact 
    contact1 = Contact.new("lauren", "1234")
    expect(contact1.name).to eq "lauren"
    expect(contact1.number).to eq "1234"
```
## 5. Implement the Behaviour