require File.dirname(__FILE__) + "/spec_helper"

describe "Checkout" do
  context "initialize" do
    it "allows a custom price list to be specified" do
      @c = Checkout.new 'A' => 100, 'B' => 200
      @c.scan('A')
      @c.total.should == 100
    end
  end
  
  context "total" do
    before do
      @c = Checkout.new
    end
    
    def check_scan(items, total)
      items.map{|i| @c.scan(i) }
      @c.total.should == total
    end
    
    it "is 0 when nothing has been scanned" do
      @c.total.should == 0
    end
    
    it "is the value of A when A has been added to it" do
      check_scan(['A'], 15)
    end

    it "is the value of B when B has been added to it" do
      check_scan(['B'], 30)
    end
    
    it "is not affected by an unknown item being added" do
      check_scan(['A', 'Foo'], 15)
    end
    
    it "is the combined value of A and B when both are added" do
      check_scan(['A', 'B'], 45)
    end
    
    it "will total up successive items of the same type" do
      check_scan(['A', 'A', 'A', 'A'], 60)
    end
  end
end