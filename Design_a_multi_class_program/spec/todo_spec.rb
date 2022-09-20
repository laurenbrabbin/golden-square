require "todo"

RSpec.describe Todo do
  context "task is complete" do
    it "returns true" do
      monday_todo = Todo.new("wash car")
      monday_todo.mark_done!
      expect(monday_todo.done?).to eq true
    end
  end
  context "task is incomplete" do
    it "returns false" do
      monday_todo = Todo.new("wash car")
      expect(monday_todo.done?).to eq false
    end
  end
  describe "#task" do
    it "returns incompleted task with the status as incomplete" do
      monday_todo = Todo.new("wash car")
      expect(monday_todo.task).to eq "wash car: incomplete"
    end
    it "returns completed task with the status as complete" do
      monday_todo = Todo.new("cook")
      monday_todo.mark_done!
      expect(monday_todo.task).to eq "cook: complete"
    end
  end
  context "no task given" do
    it "fails" do
      expect{ monday_todo = Todo.new("") }.to raise_error "no task has been entered"
    end
  end
end
