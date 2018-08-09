require 'pry'
class CashRegister
  attr_accessor :total, :discount, :items, :last_price

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=0)
    if quantity != 0
      @total += price*quantity
      quantity.times {@items << title}
      @last_price = price*quantity
    else
      @total += price
      @items << title
      @last_price = price
    end

  end

  def apply_discount
    if discount != 0
      @total *= (100.0-discount)/100.0
      return "After the discount, the total comes to $#{total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_price
  end
end
