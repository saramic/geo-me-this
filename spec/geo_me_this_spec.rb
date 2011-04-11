require File.join(File.dirname(__FILE__), %w(.. lib geo-me-this))

describe "GeoMeThis" do
  it "should expect an address in the constructor" do
    geo_me_this = GeoMeThis.new("some address string")
  end

  it "should return the geo coordinates of the address as text" do
    address = "some address string"
    geo_me_this = GeoMeThis.new(address)
    Geokit::Geocoders::MultiGeocoder.
      should_receive(:geocode).
      with(address).
      and_return(OpenStruct.new(
        {
          :street_address => "some address string parsed",
          :lat => "latitude",
          :lng => "longitude"
        }
      ))
    geo_me_this.result.should == "some address string parsed; ll: latitude,longitude"
  end
end
