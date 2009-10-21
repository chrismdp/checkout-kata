require File.dirname(__FILE__) + "/spec_helper"

describe "Checkout" do
  context "total" do
    def price(string)
      checkout = Checkout.new
      string.split(//).each do |code|
        checkout.scan(code)
      end
      checkout.total
    end

    it "is 0 when nothing has been added" do
      price("").should == 0
    end
    
    it "is 50 when A has been added" do
      price("A").should == 50
    end
    
    it "is 80 when AB have been added" do
      price("AB").should == 80
    end
    
    it "is 115 when CDBA have been added" do
      price("CDBA").should == 115
    end

    it "is 100 when AA have been added" do
      price("AA").should == 100
    end
    
    it "is 130 when AAA have been added" do
      price("AAA").should == 130
    end
    
    it "is 180 when AAAA have been added" do
      price("AAAA").should == 180
    end
    
    it "is 230 when AAAAA have been added" do
      price("AAAAA").should == 230
    end
    
    it "is 260 when AAAAAA have been added" do
      price("AAAAAA").should == 260
    end
    
    it "is 160 when AAAB have been added" do
      price("AAAB").should == 160
    end
    
    it "is 175 when AAABB have been added" do
      price("AAABB").should == 175
    end
    
    it "is 190 with AAABBD have been added" do
      price("AAABBD").should == 190
    end
    
    it "is 190 when DABABA have been added" do
      price("DABADA").should == 190
    end
    
    it "handles incremental scanning" do
      checkout = Checkout.new
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