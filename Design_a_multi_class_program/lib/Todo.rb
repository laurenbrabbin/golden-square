class Todo
  def initialize(task)
    fail "no task has been entered" unless task != ""
    @incomplete_task = task
    @complete_task = ""
  end

  def task
    @complete_task == "" ? "#{@incomplete_task}: incomplete" : "#{@complete_task}: complete"
  end

  def mark_done!
    @complete_task = @incomplete_task
    @incomplete_task = ""
  end

  def done?
    @complete_task == "" ? false : true 
  end
end