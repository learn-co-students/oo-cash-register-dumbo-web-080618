require 'pry'
class CashRegister

  attr_accessor :total, :discount, :quantity, :items, :price

  def initialize(discount = 20)
    @total = 0
    @discount = discount
    # @title = []
    @items = []
    @price = []
    #binding.pry

  end

  def add_item(title, price, quantity = 1)
  #   if quantity != nil
  @total += price * quantity

  if quantity > 1
    quantity.times do
      @items << title
      @price << price
    end
    @items
  else
    @items << title
    @price << price
  end

  end



  def apply_discount
    #binding.pry
    if @total == 0
      "There is no discount to apply."
    else
    @total -= (@total * @discount*0.01)
    "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def void_last_transaction
    @total = @total - @price[-1]
    @total
    #binding.pry
  end



end
