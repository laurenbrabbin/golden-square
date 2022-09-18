class Todo
  def initialize(task) # task is a string
    fail "no task has been entered" unless task != ""
    @incomplete_task = task
    @complete_task = ""
  end

  def task
    if @complete_task == "" 
      return @incomplete_task 
    else
      return @complete_task
    end
  end

  def mark_done!
    @complete_task = @incomplete_task
  end

  def done?
    @complete_task == @incomplete_task ? true : false
  end
end