
class CashRegister
    attr_accessor :total
  
    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @items = []
    end
  
    def add_item(title, price, quantity = 1)
      @total += price * quantity
      quantity.times { @items << title }
    end
  
    def apply_discount
      if @discount > 0
        @total -= (@total * (@discount / 100.0))
        "After the discount, the total comes to $#{@total.round(2)}."
      else
        "There is no discount to apply."
      end
    end
  
    def items
      @items
    end
  
    def void_last_transaction
      if @items.empty?
        @total = 0
      else
        @total -= @total
        @items.pop
      end
    end
  end
  