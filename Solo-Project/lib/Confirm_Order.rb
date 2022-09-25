class ConfirmOrder
  def initialize(selected_dishes)
    @selected_dishes = selected_dishes
  end
  
  def confirm_order
    #customer receives a text
  end
  
  def recipt
    return "Recipt: #{@selected_dishes.view_selected_dishes}. Total: £#{'%.2f' % total}"
  end

  private 

  def total
    return @selected_dishes.dishes.sum{|dish| dish[1] }
  end
end

