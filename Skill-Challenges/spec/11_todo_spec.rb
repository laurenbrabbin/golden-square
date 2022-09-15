require "11_todo"

RSpec.describe Todo do
  context "given no tasks" do
    it "has an empty list" do
      monday_todo = Todo.new
      expect(monday_todo.all_tasks).to eq ""
    end
  end 
  context "given a task" do
    it "adds a task onto the todo" do
      monday_todo = Todo.new
      monday_todo.add("garden")
      expect(monday_todo.all_tasks).to eq "garden"
    end
  end
  context "given two tasks" do
    it "returns a list of two tasks" do 
      monday_todo = Todo.new
      monday_todo.add("garden")
      monday_todo.add("wash car")
      expect(monday_todo.all_tasks).to eq "garden, wash car"
    end
  end
  context "completing a task" do
    it "removes completed tasks from the todo list" do
      monday_todo = Todo.new
      monday_todo.add("bills")
      monday_todo.add("shopping")
      monday_todo.completed("bills")
      expect(monday_todo.all_tasks).to eq "shopping"
    end
  end
  context "completing a task that does not exist" do
    it "throws an error if the task does not exist" do
      monday_todo = Todo.new
      monday_todo.add("bills")
      monday_todo.add("shopping")
      expect { monday_todo.completed("collect dog") }.to raise_error "that task does not exist"
    end
  end
  context "adding a task that already exists" do
    it "throws an error if task already exists" do
      monday_todo = Todo.new
      monday_todo.add("bills")
      expect { monday_todo.add("bills") }.to raise_error "that task already exists"
    end
  end
end