require "02_task_formatter"

RSpec.describe TaskFormatter do
  context "task is complete" do
    it "returns the task marked complete and the task title" do
      fake_task = double(:fake_task, title: "fake_task", complete?: true)
      formatter = TaskFormatter.new(fake_task)
      expect(formatter.format).to eq "- [x] fake_task"
    end
  end
  context "task is incomplete" do 
    it "returns the task marked as incomplete and the task title" do
      fake_task = double(:fake_task, title: "fake_task", complete?: false)
      formatter = TaskFormatter.new(fake_task)
      expect(formatter.format).to eq "- [ ] fake_task"
    end
  end
end