require File.dirname(__FILE__) + "/spec_helper"

describe "a simple Checkout class" do
  it "does something" do
    expect(false).to eq(true)
    expect { checkout.foo }.to raise_error
    expect do
      checkout.foo
    end.to raise_error
  end

  describe "a checkout" do
    before do
      @checkout = Checkout.new
    end

    it "does stuff" do
      # @checkout already exists
    end

    it "does more stuff" do
      # @checkout already exists
    end
  end
end
