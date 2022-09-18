require "16_todo_list"
require "16_todo"

RSpec.describe "integration" do
  context "Adds one uncompleted task" do
    it "returns that task" do
      laurens_todo = TodoList.new
      task1 = Todo.new("wash car")
      result = laurens_todo.add(task1)
      expect(result.incomplete).to eq task1
    end
  end
end