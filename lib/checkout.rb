class Checkout
  def initialize
    @total = 0
  end

  def add(item)
    @total += price(item)
  end

  private

  def price(item)
    PRICE[item] || 0
  end

  PRICE = {"Apples" => 100, "Cherries" => 75, "Bananas" => 150}
end
