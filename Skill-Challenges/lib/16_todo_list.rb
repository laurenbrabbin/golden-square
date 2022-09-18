class TodoList
  def initialize
    @incomplete_tasks = []
    @completed_tasks = []
  end

  def add(todo) # todo is an instance of Todo
    todo.done? ? @completed_tasks << todo : @incomplete_tasks << todo
  end

  def incomplete
    return @incomplete_tasks.map{|task| task.task}.join("; ")
  end

  def complete
    return @completed_tasks.map{|task| task.task}.join("; ")
  end

  def give_up!
    @incomplete_tasks.map{|task| @completed_tasks << task}
    @incomplete_tasks = []
  end
end