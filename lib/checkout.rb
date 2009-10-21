class Checkout
  attr :total

  def initialize
    @total = 0
    @count = {}
  end
  
  def scan(item)
    @count[item] ||= 0
    @count[item] += 1
    @total += PRICES[item]

    apply_any_discount(item)
  end
  
private

  def apply_any_discount(item)
    if (details = DISCOUNT[item])
      if @count[item] == details[:quantity]
        @total -= details[:discount]
        @count[item] = 0
      end
    end
  end

  PRICES = { "A" => 50, "B" => 30, "C" => 20, "D" => 15 }
  DISCOUNT = { "A" => {:quantity => 3, :discount => 20},
               "B" => {:quantity => 2, :discount => 15}}
end