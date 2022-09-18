require "16_Todo"

RSpec.describe Todo do
  describe "#task" do
    context "adding a new task" do
      it "returns a string of the task" do
        task1 = Todo.new("wash car") 
        expect(task1.task).to eq "wash car"
      end
    end
    context "no task given" do
      it "raises an error" do
        expect{  task1 = Todo.new("") }.to raise_error "no task has been entered"
      end
    end
  end
   describe "#done?" do
    context "checking if a completed task is done" do
      it "returns true" do
        task1 = Todo.new("wash car")
        task1.mark_done!
        expect(task1.done?).to eq true
      end
    end
    context "checking if an uncompleted task is done" do
      it "returns false" do
        task1 = Todo.new("wash car")
        expect(task1.done?).to eq false
      end
    end
  end
end