def make_snippet(text)
  words = text.split(" ")
    if words.length >= 5
      new_arr = words[0..4].push("...").join(" ")
      return new_arr
    else
      return text
    end 
  end 