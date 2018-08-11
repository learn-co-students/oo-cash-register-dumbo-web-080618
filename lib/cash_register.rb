require "pry"

class CashRegister
  attr_accessor :total, :discount, :items, :price #price is added bcuz we want to isolate it for iterate over for void and returns

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @price = []
  end
  def total
    @total
  end
  def add_item(title, price, quantity = 1)
    @total += price * quantity
    if quantity > 1  #if quanity is > 1 the we loop quanity x # of times
      quantity.times do

          @items << title #shovel quanity names in @item array
          @price << price
        end
      return @items #return the items array
  else
    @items << title #else the items array the the number of qunity purchased initially
    @price << price 
    return @items
    end
  end
  # def discount
  #   discount_percent = @discount * 0.01 #this allowed me to get percentage dicount
  # end

  def apply_discount
    if discount == 0
      return "There is no discount to apply."

    else
      discount_percent = @discount * 0.01
      percentage = @total * discount_percent#the discount total

    # percentage = @total * discount #the discount total
      @total -= percentage  #total - perentage then equal new total
    return "After the discount, the total comes to $#{@total.floor}." #put $ b4 #
    end
  end
def void_last_transaction
  @total -= @price[-1] # -1 returns the last price of the array and minus that price from total giving the new total price
end
end
