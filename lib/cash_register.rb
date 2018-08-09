require 'pry'
class CashRegister

  attr_accessor :discount, :total, :items, :last_t

  def initialize(discount=nil)
    @total = 0
    @discount = discount
    @items =[]
    @last_t = nil
  end

  def add_item(title, price, quantity=nil)
    if quantity == nil
      self.total += price
      @items << title
      self.last_t = price
    else
      self.total += price*quantity
        self.last_t = price
        quantity.times do
          @items << title
        end
    end
  end

  def apply_discount
    if discount !=nil
      self.total -= self.total*(discount/100.0)
      "After the discount, the total comes to $#{total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    self.total -= last_t
  end



end
