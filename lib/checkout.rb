class Checkout
  attr :total

  def initialize
    @total = 0
    @count = {}
  end

  def scan(item)
    @total += PRICE[item]
    @count[item] ||= 0
    @count[item] += 1
    if (code = DISCOUNT[item])
      if (@count[item] == DISCOUNT[item][:quantity])
        @count[item] = 0
        @total -= DISCOUNT[item][:discount]
      end
    end
  end
private
  PRICE = { 'A' => 50, 'B' => 30, 'C' => 20, 'D' => 15 }
  DISCOUNT = { 'A' => { :quantity => 3, :discount => 20 },
               'B' => { :quantity => 2, :discount => 15 } }
end
