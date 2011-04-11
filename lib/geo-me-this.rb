require 'geokit'
require 'ostruct'

class GeoMeThis
  def initialize(address)
    @address = address
  end

  def result
    result = Geokit::Geocoders::MultiGeocoder.geocode(@address)
    struct = transpose_result(result)
    RESULT_TO_STRING.call(struct)
  end

  def transpose_result(result)
    OpenStruct.new({
      :address => [result.street_address, result.city, result.state, result.country].find_all{|e| !e.nil?}.join(" "),
      :location => OpenStruct.new(
        {
          :latitude => result.lat,
          :longitude => result.lng
        }
      )
    })
  end

  RESULT_TO_STRING = lambda do |result|
    sprintf("%s; ll: %s,%s", result.address, result.location.latitude, result.location.longitude)
  end
end

