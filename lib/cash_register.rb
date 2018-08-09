require 'pry'
class CashRegister

  attr_reader :discount
  attr_accessor :total, :prices


    def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @prices = []
    end



  def add_item(title, price, quantity = 1)
    @total += price * quantity
      quantity.times do |i|
        @items << title
        @prices << (price * quantity)
      end
  end

  def apply_discount
    if discount > 0
    @total -= @total * (@discount * 0.01)
    "After the discount, the total comes to $800."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @prices[-1]
  end

end
