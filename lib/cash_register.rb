require 'pry'

class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(item_name, cost, quantity = 1)
        self.total = @total + cost * quantity
        quantity.times do
            @items << item_name
        end
        self.last_transaction = cost * quantity
    end

    def apply_discount
        if @discount > 0
            self.total = (@total * ((100.0 - @discount.to_f)/100)).to_i
            return "After the discount, the total comes to $#{@total}."
        else
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total = @total - @last_transaction
    end
    
end
#binding.pry