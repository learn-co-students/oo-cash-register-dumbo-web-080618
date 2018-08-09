class CashRegister

  attr_accessor :total, :discount, :items, :last_trans

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    for i in 1..quantity
      @items << title
    end
    @total += price * quantity
    @last_trans = price * quantity
  end

  def apply_discount
    if @discount > 0
      @total *= 1 - (@discount/100.0)
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @last_trans
  end
end
