require "16_todo_list"
require "16_todo"

RSpec.describe "integration" do
  context "no todo entered" do
    it "returns an error" do
      laurens_todo = TodoList.new
      expect{ task1 = Todo.new("") }.to raise_error "no task has been entered"
    end
  end
  describe "#incomplete" do
    context "Adds one uncompleted task" do
      it "returns one task" do
        laurens_todo = TodoList.new
        task1 = Todo.new("wash car")
        result = laurens_todo.add(task1)
        result = laurens_todo.incomplete
        expect(result).to eq "wash car"
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
    end
  end
  describe "#complete" do
    context "given one completed task" do
      it "returns that task" do 
        laurens_todo = TodoList.new
        task1 = Todo.new("completed task")
        task1.mark_done!
        laurens_todo.add(task1)
        result = laurens_todo.complete
        expect(result).to eq "completed task"
      end
    end
    context "give more than one completed task" do 
      it "returns that task" do 
        laurens_todo = TodoList.new
        task1 = Todo.new("completed task")
        task2 = Todo.new("another completed task")
        task1.mark_done!
        task2.mark_done!
        laurens_todo.add(task1)
        laurens_todo.add(task2)
        result = laurens_todo.complete
        expect(result).to eq "completed task; another completed task"
      end
    end
  end
  describe "#give up!" do
    context "one task to give up" do
      it "moves one task from incomplete to complete" do 
        laurens_todo = TodoList.new
        task1 = Todo.new("football")
        laurens_todo.add(task1)
        laurens_todo.give_up!
        expect(laurens_todo.complete).to eq "football"
      end
      it "returns an empty string after give_up! has been called" do 
        laurens_todo = TodoList.new
        task1 = Todo.new("football")
        laurens_todo.add(task1)
        laurens_todo.give_up!
        expect(laurens_todo.incomplete).to eq ""
      end
    end
  end
    context "more than one task to give up" do
      it "moves all tasks from incomplete to complete" do 
        laurens_todo = TodoList.new
        task1 = Todo.new("football")
        task2 = Todo.new("swimming")
        task3 = Todo.new("gymnastics")
        task2.mark_done!
        laurens_todo.add(task1)
        laurens_todo.add(task2)
        laurens_todo.add(task3)
        laurens_todo.give_up!
        expect(laurens_todo.complete).to eq "swimming; football; gymnastics"
      end
    end
end