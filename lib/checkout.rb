class Checkout
  def run!(argf)
    argf.each do |line|
      puts line.strip
    end
  end
end
