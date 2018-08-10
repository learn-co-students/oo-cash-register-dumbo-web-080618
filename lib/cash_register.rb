require 'pry'
class CashRegister
  attr_accessor :total, :discount
  @@all = []


  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
    @@all << self
  end

  def add_item(title, price, quantity=0)
    #pushes the items into the array to save the items
    if quantity == 0
      @items << title
    else
      i = 0
      while i < quantity
        @items << title
        i +=1
      end
    end

    #determines the total based on the quantity and price
    if quantity != 0
      @total += (price * quantity)
    else
      @total += price
    end
    @@all << self
  end

  def apply_discount
    if @discount != nil
      @discount= (@total *  @discount) / 100
      @total = @total - @discount
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    last_item = @@all.pop
    @total = @total - last_item.total
  end

end
