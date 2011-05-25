require File.dirname(__FILE__) + "/spec_helper"

describe Checkout do
  let(:checkout) { Checkout.new }
  context "add" do
    it "accepts Apples" do
      checkout.add("Apples").should == 100
      checkout.add("Apples").should == 200
    end
    it "also accepts Cherries" do
      checkout.add("Apples").should == 100
      checkout.add("Cherries").should == 175
      checkout.add("Cherries").should == 230
    end

    it "accepts Bananas" do
      checkout.add("Bananas").should == 150
    end

    it "ignores failed scans" do
      checkout.add("FOO").should == 0
      checkout.add("Bananas").should == 150
      checkout.add("FOO").should == 150
    end
      
  end

  context "discounts" do
    it "takes off 30p for 2 cherries" do
      checkout.add("Cherries").should == 75
      checkout.add("Cherries").should == 130
      checkout.add("Cherries").should == 205
      checkout.add("Cherries").should == 260
    end

    it "is BOGOF for Bananas" do
      checkout.add("Bananas").should == 150
      checkout.add("Bananas").should == 150
      checkout.add("Bananas").should == 300
      checkout.add("Bananas").should == 300
    end
  end

  it "passes iteration 3a" do
    checkout.add("Cherries,Cherries,Bananas").should == 280
  end

  it "passes iteration 4" do
    checkout.add("Cherries").should == 75
    checkout.add("Pommes").should == 175
    checkout.add("Cherries").should == 230
    checkout.add("Bananas").should == 380
    checkout.add("Bananas").should == 380
    checkout.add("Apples").should == 480
  end

  context "CSV" do
    it "accepts csv lines" do
      checkout.add("Apples, Cherries,Cherries").should == 230
    end
  end
end
