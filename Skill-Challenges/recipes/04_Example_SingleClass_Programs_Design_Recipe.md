# {{PROBLEM}} Method Design Recipe

## 1. Describe the Problem
  > as a user
  > so that I can keep track of my tasks
  > I want a program that I can add todo tasks to and see a list of them

  > as a user
  > so that I can focus on tasks to complete
  > I want to mark tasks as complete and have them disappear from the list 

## 2. Design the Class Interface

```Ruby
class todo
  def initalize
  end
  def add(task) #task is a string representing an instruction
  #return nothing
  #fails if the task does not exist
  end
  def completed(task) #task is a string representing tasks to mark as completed
  #returns nothing
  #fails if the task does not exist
  end
  def all_tasks 
  #returns a list of all tasks that still need to be done
  end
end 
```

## 3. Create Examples as Tests
 
 ```ruby
 #1
   monday_todo = Todo.new
   monday_todo.all_tasks # => []
 #2
   monday_todo = Todo.new
   monday_todo.add("garden")
   expect(monday_todo.all_tasks).to eq "garden"
#3
   monday_todo = Todo.new
   monday_todo.add("garden")
   monday_todo.add("wash car")
   expect(monday_todo.all_tasks).to eq "garden, wash car"
 #4
   monday_todo = Todo.new
   monday_todo.add("bills")
   monday_todo.add("shopping")
   monday_todo.completed("bills")
   expect(monday_todo.all_tasks).to eq "shopping"
  #5
  monday_todo = Todo.new
   monday_todo.add("bills")
   monday_todo.add("shopping")
   monday_todo.completed("collect dog")
   expect { monday_todo.all_tasks }.to raise_error "that task does not exist"
  #6
   monday_todo = Todo.new
   monday_todo.add("")
   expect{ monday_todo.all_tasks }.to raise_error "no task was entered"
  #7
   monday_todo = Todo.new
   monday_todo.complete("")
   expect{ monday_todo.all_tasks }.to raise_error "no task was entered"

 ```

## 4. Implement the Behaviour
