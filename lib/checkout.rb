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
    apply_discounts(total, @items)
  end

  def apply_discounts(total, items)
    items = items.dup
    total -= MultiDiscount.new(items, ["Pommes", "Mele", "Apples"], 4, 100).calculate_discount
    total -= MultiDiscount.new(items, PRICE.keys, 5, 200).calculate_discount
    total -= Discount.new(items, "Cherries", 2, 20).calculate_discount
    total -= Discount.new(items, "Pommes", 3, 100).calculate_discount
    total -= Discount.new(items, "Mele", 2, 50).calculate_discount
    total -= Discount.new(items, "Bananas", 2, 150).calculate_discount
    total
  end

  class Discount
    def initialize(items, match, amount, discount)
      @items = items
      @match = match
      @amount = amount
      @discount = discount
    end
    def calculate_discount
      take_off_this = 0
      while(match?)
        remove_from_items
        take_off_this += find_discount
      end
      take_off_this
    end

    def find_discount
      @discount
    end

    def remove_from_items
      @items[@match] -= @amount
    end

    def match?
      @items[@match] >= @amount
    end
  end

  class MultiDiscount < Discount
    def initialize(items, match, amount, discount)
      items[match] = match.inject(0) do |count, m|
        count += items[m]
      end
      super(items,match,amount,discount)
    end
  end

  def price(item)
    PRICE[item] || 0
  end

  PRICE = {"Apples" => 100, "Pommes" => 100, "Mele" => 100, "Cherries" => 75, "Bananas" => 150}
end
