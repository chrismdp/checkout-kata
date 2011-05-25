class Checkout
  def initialize
    @total = 0
    @items = Hash.new(0)
  end

  def add(item)
    @items[item] += 1
    @total += price(item)
    @total -= 20 if (@items["Cherries"] >= 2)
    @total
  end

  private

  def price(item)
    PRICE[item] || 0
  end

  PRICE = {"Apples" => 100, "Cherries" => 75, "Bananas" => 150}
end
