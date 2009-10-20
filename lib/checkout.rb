class Checkout
  attr :total
  
  PRICE = {'A' => 50, 'B' => 30, 'C' => 20, 'D' => 15}
  DISCOUNT = {'A' => { :quantity => 3, :discount => 20 },
              'B' => { :quantity => 2, :discount => 15 }}
  
  def initialize
    @total = 0
    @items = {}
  end

  def scan(item)
    @items[item] ||= 0
    @items[item] += 1
    @total += PRICE[item]
    apply_any_discount(item)
  end
  
private

  def apply_any_discount(item)
    DISCOUNT.keys.each do |code|
      if (item == code && @items[code] == DISCOUNT[code][:quantity])
        @total -= DISCOUNT[code][:discount]
        @items[code] = 0
      end
    end
  end
end
