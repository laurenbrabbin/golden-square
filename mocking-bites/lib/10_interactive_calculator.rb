class InteractiveCalculator
  def initialize(terminal)
    @terminal = terminal
  end
  def run
    @terminal.puts "Hello. I will subtract 2 numbers"
    @terminal.puts "Please enter a number"
    number1 = get_number
    @terminal.puts "Please enter another number"
    number2 = get_number
    @terminal.puts "Here is your result:"
    @terminal.puts format_sum(number1, number2)
  end

  private 
  def get_number 
    response = @terminal.gets.chomp
    #"2" to_i is 2 back to string is "2"
    #"jim" to_i is 0 back to string is "0" which does not equal Jim
    return response.to_i if response.to_i.to_s == response
    fail "You must enter a number!"
  end

  def format_sum(number1, number2)
    return "#{number1} - #{number2} = #{number1 - number2}"
  end
end




#Example call
#=============
#interactive_calculator = InteractiveCalculator.new(Kernel)
#interactive_calculator.run

#Output
#=============
# Hello. I will subtract two numbers.
# Please enter a number
# 4
# Please enter another number
# 3
# Here is your result:
# 4 - 3 = 1