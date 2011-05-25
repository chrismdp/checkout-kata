class Checkout
  def initialize
    @total = 0
    @items = Hash.new(0)
  end

  def add(line)
    line.split(",").each do |item|
      item.strip!
      @items[item] += 1
    end
    calc_total
  end

  private

  def calc_total
    total = 0
    @items.keys.each do |item|
      total += price(item) * @items[item]
    end
    total -= 20 * (@items["Cherries"] / 2)
    total -= 150 * (@items["Bananas"] / 2)
    total
  end

  def price(item)
    PRICE[item] || 0
  end

  PRICE = {"Apples" => 100, "Pommes" => 100, "Mele" => 100, "Cherries" => 75, "Bananas" => 150}
end
