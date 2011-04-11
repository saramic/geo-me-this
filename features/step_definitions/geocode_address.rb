Given /^this address "([^"]*)"$/ do |address|
  @address = address
end

When /^I pass this address to geo\-me\-this$/ do
  @geo_me_this = GeoMeThis.new(@address)
end

Then /^the returned value will be "([^"]*)"$/ do |return_value|
  @geo_me_this.result.should == return_value
end

