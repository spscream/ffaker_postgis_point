require 'ffaker/postgis_point/version'
require 'bigdecimal'

module FFaker
  module PostgisPoint
    extend self

    EARTH_RADIUS = BigDecimal.new("6372.796924")
    EQUATOR_LENGTH = EARTH_RADIUS * 2 * Math::PI

    def point2d(lat: "55.7522200", lng: "37.6155600", distance: 50)
      """
      Returns hash with random point. Hash has the following fields:

        - lat: latitude in float
        - lon: longitude in float

      Default params sets to Moscow coordinates and distance of 50km.
      """
      lat = BigDecimal.new(lat)
      lng = BigDecimal.new(lng)
      distance = distance.to_i
      latRandom = lat + latDegInMeters((-distance..distance).to_a.sample * 1000)
      lngRandom = lng + lngDegInMeters(lat,(-distance..distance).to_a.sample * 1000)

      { lat: latRandom.to_f,
        lng: lngRandom.to_f }
    end

    private

    def latDegInMeters(meters)
      meters / metersInLatDeg
    end

    def lngDegInMeters(lat, meters)
      meters / metersInLngDeg(lat)
    end

    def metersInLatDeg
      """
      Returns kilometers in one latitude degree
      """
      EQUATOR_LENGTH / 360 * 1000
    end

    def metersInLngDeg(lat)
      """
      Returns kilometers in one longitude degree on specified latitude
      """
      Math.cos(lat) * EQUATOR_LENGTH / 360 * 1000
    end
  end
end
