#view 04_Example_SingleClass_Programs_Design_Recipe.md
class Todo
  def initialize
    @tasks = []
  end

  def add(task)
    fail "that task already exists" if @tasks.include?(task)
    @tasks << task
  end
  
  def completed(task)
    fail "that task does not exist" unless @tasks.include?(task)
    @tasks = @tasks - [task] #can also do @tasks.delete(task)
  end 

  def all_tasks
    @tasks.join(", ")
  end
end