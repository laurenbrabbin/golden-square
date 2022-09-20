RSpec.describe "doubles challenge" do
  it "creates a sophisticated double" do
    task_list = double :multiple_tasks, add: nil
    task = double :single_task
    
    allow(task_list).to receive(:count).and_return 1
    allow(task_list).to receive(:clear).and_return :success
    allow(task_list).to receive(:list).and_return [task]

    # Don't edit below
    task_list.add(task)
    expect(task_list.list).to eq [task]
    expect(task_list.count).to eq 1
    expect(task_list.clear).to eq :success
  end
end