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

    it "is 0 when nothing has been added" do
      price("").should == 0
    end

    it "is 50 when A is added" do
      price("A").should == 50
    end

    it "is 80 when AB is added" do
      price("AB").should == 80
    end

    it "is 115 when CDBA is added" do
      price("CDBA").should == 115
    end

    it "is 100 when AA is added" do
      price("AA").should == 100
    end

    it "is 130 when AAA is added" do
      price("AAA").should == 130
    end

    it "is 180 when AAAA is added" do
      price("AAAA").should == 180
    end

    it "is 230 when AAAAA is added" do
      price("AAAAA").should == 230
    end

    it "is 260 when AAAAA is added" do
      price("AAAAAA").should == 260
    end

    it "is 160 when AAAB is added" do
      price("AAAB").should == 160
    end

    it "is 175 when AAABB is added" do
      price("AAABB").should == 175
    end

    it "is 190 when AAABBD is added" do
      price("AAABBD").should == 190
    end

    it "is 190 when DABABA is added" do
      price("DABABA").should == 190
    end

    it "handles incremental additions" do
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

