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

  def recipt
    fail "no dishes have been selected" if @selected_dishes == []
    return "Recipt: #{view_selected_dishes}. Total: £#{'%.2f' % total}"
  end

  private
    
  def format_selected_dishes
    dishes = combining_duplicates
    dish_formatt = dishes.map do |dish, quantity|
      "#{quantity}x #{dish[0]}: #{amount_in_pounds(quantity * dish[1])}"
    end
    return dish_formatt.join(", ")
  end

  def combining_duplicates
    return @selected_dishes.each_with_object(Hash.new(0)) { |dish, quantity| quantity[dish] += 1}
  end

  def amount_in_pounds(amount)
    return "£#{'%.2f' % (amount.to_f)}"
  end

  def total
    return @selected_dishes.sum{|dish| dish[1] }
  end
end
