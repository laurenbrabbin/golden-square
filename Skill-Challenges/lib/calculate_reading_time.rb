def calculate_reading_time(text)
  words = text.split(" ")
  return (words.length / 200.to_f).ceil 
  #to_f produces a decimal rather than whole number and .ceil The ceil() is an inbuilt method in Ruby returns the smallest number which is greater than or equal to the given number by keeping a precision of n digits of the decimal part.
end 
