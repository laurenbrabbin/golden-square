require "RegularDiary"
require "Todo"
require "Contact"
require "DiaryEntry"

RSpec.describe "Integration" do
  context "adding one diary entry and returning that entry" do
    it "returns that entry" do 
      laurens_diary = RegularDiary.new
      monday_entry = DiaryEntry.new("monday", "I went to the park")
      laurens_diary.add_entry(monday_entry)
      expect(laurens_diary.all_entries).to eq [monday_entry]
    end
  end
  context "adding two diary entries and returning both when calling all entries" do
    it "returns both entries" do
      laurens_diary = RegularDiary.new
      monday_entry = DiaryEntry.new("monday", "I went to the park")
      tuesday_entry = DiaryEntry.new("tuesday", "I ate apples")
      laurens_diary.add_entry(monday_entry)
      laurens_diary.add_entry(tuesday_entry)
      expect(laurens_diary.all_entries).to eq [monday_entry, tuesday_entry]
    end
  end
  context "no saved entires" do
    it "lets the user know there are no entries" do
      laurens_diary = RegularDiary.new
      expect(laurens_diary.all_entries).to eq "There are no saved diary entries"
    end
  end
  describe "#readable_entry" do
    context "given one entry" do
      it "returns that entry if it can be read in given time period" do
        laurens_diary = RegularDiary.new
        monday_entry = DiaryEntry.new("monday", "I went to the park")
        laurens_diary.add_entry(monday_entry)
        result = laurens_diary.readable_entry(1, 5)
        expect(result).to eq monday_entry
      end
    end
    context "given multiple entires" do
      it "returns the best entry given the wpm and minutes" do
        laurens_diary = RegularDiary.new
          monday_entry = DiaryEntry.new("monday", "I went to the park")
          tuesday_entry = DiaryEntry.new("tuesday", "I ate apples")
          wednesday_entry = DiaryEntry.new("wednesday", "I am going to see my friends at a cafe this afternoon")
          laurens_diary.add_entry(monday_entry)
          laurens_diary.add_entry(tuesday_entry)
          laurens_diary.add_entry(wednesday_entry)
          result = laurens_diary.readable_entry(1, 5)
          expect(result).to eq monday_entry
      end
      it "returns the best entry given the wpm and minutes" do
        laurens_diary = RegularDiary.new
          monday_entry = DiaryEntry.new("monday", "I went to the park")
          tuesday_entry = DiaryEntry.new("tuesday", "I ate apples")
          wednesday_entry = DiaryEntry.new("wednesday", "I am going to see my friends at a cafe this afternoon")
          laurens_diary.add_entry(monday_entry)
          laurens_diary.add_entry(tuesday_entry)
          laurens_diary.add_entry(wednesday_entry)
          result = laurens_diary.readable_entry(1, 4)
          expect(result).to eq tuesday_entry
      end
      it "returns the best entry given the wpm and minutes" do
        laurens_diary = RegularDiary.new
          monday_entry = DiaryEntry.new("monday", "I went to the park")
          tuesday_entry = DiaryEntry.new("tuesday", "I ate apples")
          wednesday_entry = DiaryEntry.new("wednesday", "I am going to see my friends at a cafe this afternoon")
          laurens_diary.add_entry(monday_entry)
          laurens_diary.add_entry(tuesday_entry)
          laurens_diary.add_entry(wednesday_entry)
          result = laurens_diary.readable_entry(1, 13)
          expect(result).to eq wednesday_entry
      end
    end
    context "no entries can be read in given time period" do
      it "returns an error" do
        laurens_diary = RegularDiary.new
          monday_entry = DiaryEntry.new("monday", "I went to the park")
          tuesday_entry = DiaryEntry.new("tuesday", "I ate apples")
          wednesday_entry = DiaryEntry.new("wednesday", "I am going to see my friends at a cafe this afternoon")
          laurens_diary.add_entry(monday_entry)
          laurens_diary.add_entry(tuesday_entry)
          laurens_diary.add_entry(wednesday_entry)
          expect{ laurens_diary.readable_entry(1, 2) }.to raise_error "no entries can be read in given time period"
      end
    end
  end
  describe "#all_todos" do
    context "no todos" do
      it "lets the user know that there are no todos" do
        laurens_diary = RegularDiary.new
        expect(laurens_diary.all_todos).to eq "There are no todos"
      end
    end    
    context "one todo added" do
      it "returns that todo" do
        laurens_diary = RegularDiary.new
        monday_todo = Todo.new("wash car")
        laurens_diary.add_todo(monday_todo)
        expect(laurens_diary.all_todos).to eq [monday_todo]
      end
    end
    context "multiple todos added" do
      it "returns all todos" do
        laurens_diary = RegularDiary.new
        monday_todo = Todo.new("wash car")
        tuesday_todo = Todo.new("shopping")
        laurens_diary.add_todo(monday_todo)
        laurens_diary.add_todo(tuesday_todo)
        expect(laurens_diary.all_todos).to eq [monday_todo, tuesday_todo]
      end
    end
    context "filters out incopmplete and complete todos" do
      it "returns an error if the user tries to add a completed todo" do
        laurens_diary = RegularDiary.new
        monday_todo = Todo.new("wash car")
        monday_todo.mark_done!
        expect{ laurens_diary.add_todo(monday_todo) }.to raise_error "this task is complete"
      end
    end
  end
  describe "#all_contacts" do
    context "one contact added" do
      it "returns that contact" do
        laurens_diary = RegularDiary.new
        tom = Contact.new("tom", "0787878787")
        laurens_diary.add_contact(tom)
        expect(laurens_diary.all_contacts).to eq [tom]
      end
    end
    context "more than one contact added" do
      it "returns all contacts" do
        laurens_diary = RegularDiary.new
        tom = Contact.new("tom", "0787878787")
        lulu = Contact.new("lulu", "0121212121")
        laurens_diary.add_contact(tom)
        laurens_diary.add_contact(lulu)
        expect(laurens_diary.all_contacts).to eq [tom, lulu]
      end
    end
    context "no contacts" do
      it "returns no contacts" do
        laurens_diary = RegularDiary.new
        expect(laurens_diary.all_contacts).to eq "There are no saved contacts"
      end
    end
  end
end


