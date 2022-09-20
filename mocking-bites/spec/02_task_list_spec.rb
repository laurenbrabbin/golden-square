require "02_task_list"

RSpec.describe TaskList do
  it "initially has an empty list" do
    task_list = TaskList.new
    expect(task_list.all).to eq []
  end

  it "is initially not all complete" do
    task_list = TaskList.new
    expect(task_list.all_complete?).to eq false
  end

  # Unit test `#all` and `#all_complete?` behaviour
  it "returns all tasks" do
    laurens_tasks = TaskList.new
    task_1 = double :task
    task_2 = double :task
    task_3 = double :task
    laurens_tasks.add(task_1)
    laurens_tasks.add(task_2)
    laurens_tasks.add(task_3)
    expect(laurens_tasks.all).to eq [task_1, task_2, task_3]
  end

  it "returns true if all tasks are complete" do
    laurens_tasks = TaskList.new
    task_1 = double :task, complete?: true
    task_2 = double :task, complete?: true
    laurens_tasks.add(task_1)
    laurens_tasks.add(task_2)
    expect(laurens_tasks.all_complete?).to eq true
  end
  it "returns false if some tasks are complete" do
    laurens_tasks = TaskList.new
    task_1 = double :task, complete?: true
    task_2 = double :task, complete?: false
    laurens_tasks.add(task_1)
    laurens_tasks.add(task_2)
    expect(laurens_tasks.all_complete?).to eq false
  end
end