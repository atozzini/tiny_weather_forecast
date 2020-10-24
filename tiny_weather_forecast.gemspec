lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tiny_weather_forecast/version"

Gem::Specification.new do |spec|
  spec.name          = "tiny_weather_forecast"
  spec.version       = TinyWeatherForecast::VERSION
  spec.authors       = ["Alexandre Tozzini"]
  spec.email         = ["alexandre.tozzini@gmail.com"]

  spec.summary       = 'A tiny gem to get weather forecast'
  spec.homepage      = ""

  spec.metadata["homepage_uri"] = spec.homepage

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
