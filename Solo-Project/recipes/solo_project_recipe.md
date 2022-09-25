## 1. Describe the Problem
  > As a customer
  > So that I can check if I want to order something
  > I would like to see a list of dishes with prices.

  > As a customer
  > So that I can order the meal I want
  > I would like to be able to select some number of several available dishes.

  > As a customer
  > So that I can verify that my order is correct
  > I would like to see an itemised receipt with a grand total.

  Use the twilio-ruby gem to implement this next one. You will need to use doubles too.

  > As a customer
  > So that I am reassured that my order will be delivered on time
  > I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.



## 2. Design the Class System
class name
atribute
methods

```Ruby

class Menu
  def initialize
    #stores all the dishes
  end
 
  def view_menu
    #allows user to see the dishes
  end

  def find_meal(keyword)
    #returns the meal if the keyword matches the title
  end
end


class PlacingOrder
  def initialize(menu) #Instance of the menu class
    #stores the menu and the selected dishes
  end
  
  def select_dish(keyword)
    #allows user to select a dish by inputting the dish title as the keyword
  end
    
  def view_selected_dishes
    #allows user to view the dishes that have been selected
  end

  def dishes
    #returns the stored selected dishes
  end
end

class ConfirmOrder
  def initialize(selected_dishes) #instance of the Placing_Order class
    #stores the selected dishes
  end
  
  def confirm_order
    #sends a text message
  end
  
  def recipt
   #returns the recipt with total
  end
end

```

## 3. Create Examples as Integration Tests

 ```ruby
# Menu and PlacingOrder Integrated

#1 fails when wanting to view selected dishes and no dishes have been selected
    cafe_menu = Menu.new
    laurens_order = PlacingOrder.new(cafe_menu)
    expect {laurens_order.view_selected_dishes}.to raise_error "no selected dishes"
   
#2 presents a list of added meals
    cafe_menu = Menu.new
    laurens_order = PlacingOrder.new(cafe_menu)
    laurens_order.select_dish("pizza")
    laurens_order.select_dish("soup")
    laurens_order.select_dish("pizza")
    expect(laurens_order.view_selected_dishes).to eq "2x pizza: £3.00, 1x soup: £2.99"
   
#3 fails if keyword does not match dish title
    cafe_menu = Menu.new
    laurens_order = PlacingOrder.new(cafe_menu)
    expect{ laurens_order.select_dish("piza") }.to raise_error "no dish recognised"

#4 returns an array of the stored selected_meals
    cafe_menu = Menu.new
    laurens_order = PlacingOrder.new(cafe_menu)
    laurens_order.select_dish("pizza")
    laurens_order.select_dish("soup")
    laurens_order.select_dish("pizza")
    expect(lauren_order.dishes).to eq [["pizza", 1.5], ["soup", 2.99], ["pizza", 1.5]]

# ConfirmOrder and PlacingOrder Integration

#1 returns a recipt
    cafe_menu = Menu.new
    laurens_order = PlacingOrder.new(cafe_menu)
    laurens_order.select_dish("pizza")
    laurens_order.select_dish("soup")
    laurens_order.select_dish("pizza")
    confirm_order = ConfirmOrder.new(laurens_order)
    expect(confirm_order.recipt).to eq "Recipt: 2x pizza: £3.00, 1x soup: £2.99. Total: £5.99"

#2 fails if recipt is called and no dishes have been selected
    cafe_menu = Menu.new
    laurens_order = PlacingOrder.new(cafe_menu)
    confirm_order = ConfirmOrder.new(laurens_order)
    expect{confirm_order.recipt}.to raise_error "no selected dishes"
    end


 ```
## 4. Create Examples as Unit Tests
 ```ruby
# Menu Class
#1 prints the menu
    cafe_menu = Menu.new
    expect(cafe_menu.view_menu).to eq ["pizza: £1.50", "soup: £2.99", "sandwich: £3.00", "milkshake: £3.50"]

#2 returns the dish if keyword matches the dish title
    cafe_menu = Menu.new
    expect(cafe_menu.find_meal("pizza")).to eq ["pizza", 1.5]
 
#3 fails if keyword does not match dish title 
    cafe_menu = Menu.new
    expect{cafe_menu.find_meal("piza")}.to raise_error "no dish recognised"

# PlacingOrder Class

#1 fails when wanting to view selected dishes and no dishes have been selected
      cafe_menu = double :cafe_menu
      laurens_order = PlacingOrder.new(cafe_menu)
      expect {laurens_order.view_selected_dishes}.to raise_error "no selected dishes"
   
#2 returns a list of all selected meals nicely formatted
      cafe_menu = double :cafe_menu
      expect(cafe_menu).to receive(:find_meal).with("pizza").and_return(["pizza", 1.5])
      expect(cafe_menu).to receive(:find_meal).with("soup").and_return(["soup", 2.99])
      laurens_order = PlacingOrder.new(cafe_menu)
      laurens_order.select_dish("pizza")
      laurens_order.select_dish("soup")
      expect(laurens_order.view_selected_dishes).to eq "1x pizza: £1.50, 1x soup: £2.99"

#3 returns an array of the meals selected when dishes called
      cafe_menu = double :cafe_menu
      expect(cafe_menu).to receive(:find_meal).with("pizza").and_return(["pizza", 1.5])
      expect(cafe_menu).to receive(:find_meal).with("soup").and_return(["soup", 2.99])
      laurens_order = PlacingOrder.new(cafe_menu)
      laurens_order.select_dish("pizza")
      laurens_order.select_dish("soup")
      expect(laurens_order.view_selected_dishes).to eq [["pizza", 1.5], ["soup", 2.99]]

# ConfirmOrder Class

#1 returns a recipt
    selected_dishes = double :selected_dishes
    expect(selected_dishes).to receive(:view_selected_dishes).and_return("1x pizza: £1.50, 1x soup: £2.99")
    expect(selected_dishes).to receive(:dishes).and_return([["pizza", 1.5], ["soup", 2.99]])
    confirm_order = ConfirmOrder.new(selected_dishes)
    expect(confirm_order.recipt).to eq "Recipt: 1x pizza: £1.50, 1x soup: £2.99. Total: £4.49"

```
## 5. Implement the Behaviour]
