class Checkout
  attr :total
  
  def initialize
    @total = 0
    @count = {}
  end

  def scan(item)
    @count[item] ||= 0
    @count[item] += 1
    @total += PRICE[item]
    if (discounted_item = DISCOUNT[item])
      if (@count[item] == discounted_item[:quantity])
        @total -= discounted_item[:discount]
        @count[item] = 0
      end
    end
  end

private
  PRICE = { 'A' => 50, 'B' => 30, 'C' => 20, 'D' => 15 }
  DISCOUNT = { 'A' => { :quantity => 3, :discount => 20 }, 'B' => { :quantity => 2, :discount => 15 } }
end

