require "16_todo_list"

RSpec.describe TodoList do
  context "given one task" do
    it "returns the task as incomplete" do
      laurens_todo = TodoList.new
      task1 = Todo.new("shopping")
      laurens_todo.add(task1)
      expect(laurens_todo.incomplete).to eq "shopping"
    end
    it "returns the task as complete" do
      laurens_todo = TodoList.new
      task1 = Todo.new("shopping")
      task1.mark_done!
      laurens_todo.add(task1)
      expect(laurens_todo.complete).to eq "shopping"
    end
    it "returns no task if complete is called and the task is not complete" do
      laurens_todo = TodoList.new
      task1 = Todo.new("shopping")
      laurens_todo.add(task1)
      expect(laurens_todo.complete).to eq ""
    end
  end
  context "two tasks given" do 
    it "returns all incompleted tasks" do 
      laurens_todo = TodoList.new
      task1 = Todo.new("wash car")
      task2 = Todo.new("shopping")
      result = laurens_todo.add(task1)
      result = laurens_todo.add(task2)
      result = laurens_todo.incomplete
      expect(result).to eq "wash car; shopping"
    end
    it "returns just the completed tasks" do 
      laurens_todo = TodoList.new
      task1 = Todo.new("wash car")
      task2 = Todo.new("shopping")
      task1.mark_done!
      result = laurens_todo.add(task1)
      result = laurens_todo.add(task2)
      result = laurens_todo.incomplete
      expect(result).to eq "shopping"
    end
  end
end