# {{PROBLEM}} Method Design Recipe

## 1. Describe the Problem
_Put or write the user story here. Add any clarifying notes you might have._

> As a user
> So that I can improve my grammar
> I want to verify that a text starts with a capital letter and ends with a suitable sentence-ending punctuation mark.


## 2. Design the Method Signature
_Include the name of the method, its parameters, return value, and side effects._
```ruby 
is_correct = grammar_checker(text)
#text is a string with words in it
#is_correct is a boolean which verifies the grammar of the text 
```


## 3. Create Examples as Tests
_Make a list of examples of what the method will take and return_

```ruby
# 1
check_grammar("")
# => fail "Not a sentence"
#2
check_grammar("Hello")
# => fail "Not a correct sentence ending
#3 
check_grammar("hello.")
# => fail "Sentence needs to start with a capital letter"
#4
check_grammar("Hello!")
# => "Well done! This is a correct sentence."

```

4. Implement the Behaviour
_After each test you write, follow the test-driving process of red, green, ref_