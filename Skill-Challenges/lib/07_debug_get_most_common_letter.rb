def get_most_common_letter(text)
  new_text = text.gsub(/[^0-9a-z]/i, '') #getting rid of any non alphabetical characters
  counter = Hash.new(0)
  new_text.chars.each do |char|
      counter[char] += 1 #adding +1 to the value for each character key
  end
  puts counter.to_a.sort_by { |k, v| -v }[0][0] 
  #counter.to_a.sort_by { |k, v| -v } - sorts by descending order of the hashes value. 
  #[0][0] pulls the first values
end
# Intended output:
# > get_most_common_letter("the roof, the roof, the roof is on fire!")
# => "o"
get_most_common_letter("the roof, the roof, the roof is on fire!")