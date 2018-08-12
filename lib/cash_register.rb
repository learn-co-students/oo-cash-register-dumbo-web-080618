# To call an instance method inside another instance method, we use the self keyword to
# refer to the instance on which we are operating

# apply_discount - working with an Integer vs a Float
# 100.class returns Integer
# 100.0.class returns Float
# Ruby provides methods for changing an Integer to a Float

# void_last_transaction removes the last transaction from the total
# Need to make an additional attribute accessor and keep track of that
# last transaction amount somehow
# What method of the class are you working with an individual item?

require 'pry'

class CashRegister

  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def total
    @total
  end

  def add_item(title, price, quantity = 0)
    if quantity > 0
      @total += price * quantity
      quantity.times do
        @items << title
      end
    else
      @total += price
      @items << title
    end
    @last_transaction = @total
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      new_discount = @discount * 0.01
      new_total = @total * new_discount
      @total -= new_total
      "After the discount, the total comes to $#{@total.to_int}."
      # total * discount = new_total
      #   right now discount = 20
      #   *turn discount into decimal* or multiply by percentage
      # total - new_total = total
    end
  end


  def items
    @items
  end

  def void_last_transaction
    @total -= last_transaction
  end
end
