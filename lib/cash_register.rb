require "pry"
class CashRegister

  attr_accessor :discount, :total, :last_transaction

  def initialize (discount=nil)
    @total = 0
    @discount = discount
    @items = []
  end



  def add_item(title,price,quantity=1)
    @total += (price*quantity)
    quantity.times do
      @items << title
    end
    @last_transaction = price*quantity
  end

  def apply_discount
    if @discount != nil
      @total *= ((100- @discount).to_f/100)
       # multiplier = 1 - (@discount/100)
       # @total = (@total*multiplier)
       # binding.pry
       "After the discount, the total comes to $#{@total.round}."
     else
       "There is no discount to apply."
     end
  end

  def items
    @items
  end

  def void_last_transaction
    last_item = @items.pop
    @total -= last_transaction
  end
end
