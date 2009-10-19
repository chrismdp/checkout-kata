class Checkout
  
  PRICES = {
    'A' => 15,
    'B' => 30,
  }

  def initialize(prices = nil)
    @total = 0
    @prices = prices || PRICES
  end
  
  def scan(item)
    @total += @prices[item] if @prices.include?(item)
  end
  
  def total
    @total
  end
end