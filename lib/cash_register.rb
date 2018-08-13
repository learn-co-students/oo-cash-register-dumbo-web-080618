require 'pry'
class CashRegister

  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = 0
  end

  def add_item(title, price, quantity = 1)
    for i in 1..quantity
      @items << title
    end
      @total += price * quantity
      @last_transaction = price * quantity
  end

  def apply_discount
    if @discount != nil
      @total *= 1 - (@discount/100.0)
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_transaction
  end

end
