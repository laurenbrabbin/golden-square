class SecretDiary
  def initialize(diary) 
    @locked_content = diary
    @unlocked_content = "" #could also do true and false
  end

  def read
    fail "Go away!the diary is locked" if @unlocked_content == "" 
    @unlocked_content
    # Raises the error "Go away!" if the diary is locked
    # Returns the diary's contents if the diary is unlocked
    # The diary starts off locked
  end

  def lock
    # Locks the diary
    # Returns nothing
    @locked_content = @unlocked_content
    @unlocked_content = ""
  end

  def unlock
    # Unlocks the diary
    # Returns nothing
    @unlocked_content = @locked_content
    @locked_content = ""
  end
end