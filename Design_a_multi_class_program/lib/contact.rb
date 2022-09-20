class Contact 
  def initialize(name, number)
    fail "Please ensure both name and number have been submitted" if name == "" || number == ""
    @name = name
    @number = number
  end 
  def name
    @name
  end
  def number
    @number
  end
end