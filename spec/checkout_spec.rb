require File.dirname(__FILE__) + "/spec_helper"


describe "Checkout" do
  context "total" do
    def price(string)
      checkout = Checkout.new
      string.split(//).each do |item|
        checkout.scan(item)
      end
      checkout.total
    end

    it "is 0 if nothing has been scanned" do
      price("").should == 0
    end
    it "is 50 if A is scanned" do
      price('A').should == 50
    end

    it "is 80 if AB is scanned" do
      price('AB').should == 80
    end

    it "is 115 if CDBA is scanned" do
      price('CDBA').should == 115
    end
    it "is 100 if AA is scanned" do
      price('AA').should == 100
    end
    it "is 130 if AAA is scanned" do
      price('AAA').should == 130
    end
    it "is 180 if AAAA is scanned" do
      price('AAAA').should == 180
    end
    it "is 230 if AAAAA is scanned" do
      price('AAAAA').should == 230
    end
    it "is 260 if AAAAAA is scanned" do
      price('AAAAAA').should == 260
    end
    it "is 160 if AAAB is scanned" do
      price('AAAB').should == 160
    end
    it "is 175 if AAABB is scanned" do
      price('AAABB').should == 175
    end
    it "is 190 if AAABBD is scanned" do
      price('AAABBD').should == 190
    end
    it "is 190 if DABABA is scanned" do
      price('DABABA').should == 190
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
