class DiaryEntry
  def initialize(title, content)
    fail "please ensure niether title nor contents are empty" if title == "" || content == ""
    @title = title
    @contents = content
  end

  def count_words
    @contents.split(" ").length
  end
end