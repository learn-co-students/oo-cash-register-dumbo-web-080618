require 'pry'
class CashRegister

  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = 0
  end

  def add_item(title, price, quantity = 0)
    if quantity != 0
      @total += (price * quantity)
      quantity.times { |x| @items << title }
    else
      @total += price
      @items << title
      @last_transaction = price
    end
  end

  def apply_discount
    if @discount != nil
      @total *= 0.8
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_transaction
  end

end
