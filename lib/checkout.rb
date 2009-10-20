class Checkout
  attr :total

  def initialize
    @total = 0
    @count = {}
  end
  
  def scan(item)
    @total += PRICES[item]
    DISCOUNTS.each do |code, discount|
      if (code == item)
        @count[code] ||= 0
        @count[code] += 1
        if (@count[code] == discount[:quantity])
          @total -= discount[:amount]
          @count[code] = 0
        end
      end
    end
  end
  
private
  PRICES = {"A" => 50, "B" => 30, "C" => 20, "D" => 15}
  DISCOUNTS = {'A' => {:quantity => 3, :amount => 20},
                      'B' => {:quantity => 2, :amount => 15}}
end