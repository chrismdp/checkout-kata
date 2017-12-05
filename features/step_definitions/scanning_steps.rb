Given /^nothing has been scaned yet$/ do
  @checkout = Checkout.new
end

Then /^the total should be (\d+)p$/ do |price|
  expect(@checkout.total).to eq(price.to_i)
end

When /^I scan an apple$/ do
  @checkout.scan("Apple")
end
