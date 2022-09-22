class StringRepeater
  def initialize(terminal)
    @terminal = terminal
  end

  def run
    @terminal.puts "Hello. I will repeat a string many times."
    @terminal.puts "Please enter a string"
    string = @terminal.gets.chomp
    @terminal.puts "Please enter a number of repeats"
    number = get_number
    @terminal.puts "Here is your result:"
    @terminal.puts "#{string * number}"
  end

  private
  def get_number
    number = @terminal.gets.chomp
    return number.to_i if number.to_i.to_s == number
    fail "Must enter a number!"
  end
end

#to test 
  #string_repeat = StringRepeater.new(Kernel)
  #string_repeat.run