# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ffaker/postgis_point/version'

Gem::Specification.new do |spec|
  spec.name          = "ffaker_postgis_point"
  spec.version       = FFaker::PostgisPoint::VERSION
  spec.authors       = ["Alexander Malaev"]
  spec.email         = ["am@malaev.net"]

  spec.summary       = %q{Small library to generate random lng/lat.}
  spec.description   = %q{This library is planned to extend FFaker library with gis randoms.}
  spec.homepage      = "https://github.com/spscream/ffaker_postgis_point"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
