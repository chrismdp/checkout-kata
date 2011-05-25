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
    it "takes off 20p for 2 cherries" do
      checkout.add("Cherries").should == 75
      checkout.add("Cherries").should == 130
    end
  end

end
