class CashRegister 
  attr_accessor :total, :discount, :items, :transactions

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @transactions = []
  end

  #add_item accepts a title and a price and increases the total
  def add_item (title, price, quantity = 1)
    i = 0
    while i < quantity
      @items << title
      i += 1
    end
    my_price = price * quantity
    @transactions << my_price
    @total += (price * quantity)
  end
  
  #apply_discount the cash register was initialized with an employee discount applies the discount to the total price
  def apply_discount
    if discount > 0 
      @total = @total * 0.8
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  #void_last_transaction subtracts the last transaction from the total
  def void_last_transaction
    @items.pop
    @total -= @transactions.pop
  end


end
