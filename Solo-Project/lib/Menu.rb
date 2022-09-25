class Menu
  def initialize
    @available_meals = [["pizza", 1.5], ["soup", 2.99], ["sandwich", 3.0], ["milkshake", 3.5]]
  end
 
  def view_menu
    return @available_meals.map do |meal|
      "#{meal[0]}: #{amount_in_pounds(meal[1])}"
    end
  end

  def find_meal(keyword)
    selected_meal = @available_meals.filter do |meal|
      meal[0] == keyword
    end
    fail "meal not recognised" if selected_meal == []
    return selected_meal.first
  end

  private

  def amount_in_pounds(amount)
    return "£#{'%.2f' % (amount.to_f)}"
  end
end
