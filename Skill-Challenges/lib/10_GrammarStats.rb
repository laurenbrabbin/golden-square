class GrammarStats
  def initialize
    @no_text_passed = 0
    @no_correct_text = 0
  end
  
  def check(text) #returns a bolean depending if there is a capital letter and punctuation ending 
    fail "No text entered, please enter some text" unless text != ""
    @no_text_passed += 1
    outcome = text.match?(/^[A-Z]/) && text.match?(/[?.!]$/) ? true : false
    @no_correct_text += 1 unless outcome == false
    return outcome
  end

  def percentage_good #returns an integer which represents the percentage of correct texts that has been passed i.e 55% --> 55
    (@no_correct_text / @no_text_passed.to_f) * 100
  end
end 