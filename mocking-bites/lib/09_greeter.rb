#class structure before inputting kernal 
  #class Greeter
    #def greet
      #puts "What is your name?"
      #name = gets.chomp
      #puts "Hello, #{name}!"
    #end
  #end


class Greeter
  def initialize(terminal)
    @terminal = terminal
  end

  def greet
    @terminal.puts "What is your name?"
    name = @terminal.gets.chomp
    @terminal.puts "Hello, #{name}!"
  end
end

# If we want to run `Greeter` for real, we do it like this
#greeter = Greeter.new(Kernel)
#greeter.greet
