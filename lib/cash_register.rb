class CashRegister
 attr_accessor :total
attr_reader :discount, :last_transaction
#@@items_in_bag = []
   def initialize(discount=0)
    @@items_in_bag = []
    @total = 0
    @discount = discount
  end
   def add_item(title, price, items=1)
    @total += (price * items)
    @last_transaction = (price * items)
      items.times do
        @@items_in_bag << title
      end
  end

  def apply_discount
    discounted_total = (@total *= (1-(@discount.to_f/100))).to_i
    #1000 * .20 = 800
    if discounted_total == 0
      "There is no discount to apply."
    else
      "After the discount, the total comes to $#{discounted_total}."
    end
  end
   def items
      @@items_in_bag
  end
   def void_last_transaction
    #'subtracts the last transaction from the total'
    #last transaction is from add_item so is equal to price * items
    @total -= @last_transaction
  end
 end 
