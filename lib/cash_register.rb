
class CashRegister


attr_accessor :total, :discount

def initialize(discount=0)
  @discount = discount
  @total = 0
  @items = []
end

def total
  @total
end

def add_item(title, price, quantity=1)
  @total += (price * quantity)
  quantity.times do
    @items << title
end

end

  def apply_discount
if @discount != 0
  disc = (@total*@discount)/100
  @total = @total - disc
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end
  end



def items
  @items
end



def void_last_transaction
  @total = 0
end
end
