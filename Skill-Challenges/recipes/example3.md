# {{PROBLEM}} Method Design Recipe

## 1. Describe the Problem
_Put or write the user story here. Add any clarifying notes you might have._

> As a user
> So that I can keep track of my tasks 
> I want to check that a text includes the string #TODO


## 2. Design the Method Signature
_Include the name of the method, its parameters, return value, and side effects._
```ruby 
  checking_tasks = includes_todo(text)
#text is a string that contains words
#checking_todos is a boolean which returns true if the text contains todo and false if does not contain todo
```


## 3. Create Examples as Tests
_Make a list of examples of what the method will take and return_

```ruby
#1
includes_todo("")
# => false
#2 
includes_todo("#TODO wash car")
# => true
#3 
includes_todo("go shopping")
# => false


```

4. Implement the Behaviour
_After each test you write, follow the test-driving process of red, green, ref_