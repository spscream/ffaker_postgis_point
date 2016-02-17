require 'spec_helper'
require 'bigdecimal'

describe FFaker::PostgisPoint do
  it 'has a version number' do
    expect(FFaker::PostgisPoint::VERSION).not_to be nil
  end

  it 'generates random point' do
    point = FFaker::PostgisPoint.point
    expect(point).to be_kind_of(Hash)
    expect(point[:lat_dms]).to be_kind_of(String)
    expect(point[:lon_dms]).to be_kind_of(String)
    expect(point[:lat]).to be_kind_of(BigDecimal)
    expect(point[:lon]).to be_kind_of(BigDecimal)
  end
end
