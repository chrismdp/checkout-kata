require File.dirname(__FILE__) + "/spec_helper"

describe "Checkout" do
  context "when totalling items" do
    def price(itemstring)
      checkout = Checkout.new
      itemstring.split(//).each do |item|
        checkout.scan(item)
      end
      checkout.total
    end
    
    it "returns 0 when no items have been added" do
      price("").should == 0
    end
    
    it "returns 50 when A is added" do
      price("A").should == 50
    end
    
    it "returns 80 when A and B are added" do
      price("AB").should == 80
    end
    
    it "returns 115 when CDBA are added" do
      price("CDBA").should == 115
    end
    
    it "returns 100 when AA is added" do
      price("AA").should == 100
    end
    
    it "returns 130 when AAA are added" do
      price("AAA").should == 130
    end

    it "returns 180 when AAAA are added" do
      price("AAAA").should == 180
    end

    it "returns 230 when AAAAA are added" do
      price("AAAAA").should == 230
    end

    it "returns 260 when AAAAAA are added" do
      price("AAAAAA").should == 260
    end

    it "returns 160 when AAAB are added" do
      price("AAAB").should == 160
    end

    it "returns 175 when AAABB are added" do
      price("AAABB").should == 175
    end

    it "returns 190 when AAABBD are added" do
      price("AAABBD").should == 190
    end

    it "returns 190 when DABABA are added" do
      price("DABABA").should == 190
    end
    
    it "performs incremental addition" do
      checkout = Checkout.new
      checkout.total.should == 0
      checkout.scan('A')
      checkout.total.should == 50
      checkout.scan('B')
      checkout.total.should == 80
      checkout.scan('A')
      checkout.total.should == 130
      checkout.scan('A')
      checkout.total.should == 160
      checkout.scan('B')
      checkout.total.should == 175
    end
    
  end
end