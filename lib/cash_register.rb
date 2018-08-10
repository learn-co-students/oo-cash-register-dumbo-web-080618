require 'pry'

class CashRegister
  attr_accessor :total,:discount, :items,:price_total
  def initialize(discount = '')
    @total = 0
    @discount = discount
    @items = []
    @price_total =[]
  end


  def add_item(title, price, quantity ='')
    if quantity == ''
      self.total += price
      @items << title
      @price_total << price
    else
      self.total += price * quantity.to_i
      quantity.to_i.times do
        @items << title
        @price_total << price
      end
      
    end

  end

  def apply_discount
    if !(discount.is_a?(String))
      percentage= discount/100.0
      percentage *= self.total
      self.total -= percentage
      self.total = (self.total).floor
      return "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction

  @total -= @price_total[-1]
end



  # def items
  #   @items
  #
  # end






end
