class PlacingOrder
  def initialize(menu)
    @menu = menu
    @selected_dishes = [] #stores list of all dishes
  end
  
  def select_dish(keyword)
    @selected_dishes << @menu.find_meal(keyword)
  end
    
  def view_selected_dishes
    fail "no selected dishes" if @selected_dishes == []
    format_selected_dishes
  end

  def dishes
    @selected_dishes
  end

  private
    
  def format_selected_dishes
    selected_dishes_quantities = @selected_dishes.each_with_object(Hash.new(0)) { |dish, quantity| quantity[dish] += 1}
    formatted = selected_dishes_quantities.map do |dish, quantity|
      "#{quantity}x #{dish[0]}: #{amount_in_pounds(quantity * dish[1])}"
    end
    return formatted.join(", ")
  end

  def amount_in_pounds(amount)
    return "£#{'%.2f' % (amount.to_f)}"
  end
end

