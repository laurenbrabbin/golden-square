def includes_todo(text)
  if text == ""
    return false
  elsif text.include?("#TODO")
    return true
  else 
    return false
  end
end 