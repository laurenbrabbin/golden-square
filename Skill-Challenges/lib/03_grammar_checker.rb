def grammar_checker(text)
  if text == ""
    fail "Not a sentence"
  else
  text.match?(/^[A-Z]/) && text.match?(/[?.!]$/) ? true : false
  end
end 
