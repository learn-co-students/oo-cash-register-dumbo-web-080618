require 'pry'

class CashRegister

  attr_accessor :total, :discount, :items, :prices

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @prices = []
  end

  def add_item(title, price, quantity = 1)
    self.total += price * quantity
    quantity.times do
      @items << title
      @prices << price
    end
  end

  def apply_discount
    if self.discount != 0
      decimal = @discount/100.0
      decimal *= self.total
      self.total -= decimal
      self.total = self.total.floor
      return "After the discount, the total comes to $#{self.total}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    last_price = @prices.pop
    self.total -= last_price
    #binding.pry
  end
end
