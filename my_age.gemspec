# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'my_age/version'

Gem::Specification.new do |spec|
  spec.name          = "my_age"
  spec.version       = MyAge::VERSION
  spec.authors       = ["Edgar"]
  spec.email         = ["zorro.ej@gmail.com"]

  spec.summary       = %q{Calculate my age.}
	spec.description   = %q{a simple module to be mixed in to provide an age method. Also provide a CLI. Default calender: Gregorian, though would like to expand to other calendars too}
  spec.homepage      = "https://github.com/ej2015/my_age.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
	
  spec.required_ruby_version = ">=2.1.0"

	spec.add_dependency "activesupport", ">= 4.2"
	spec.add_dependency "thor", "~>0.20.0"
  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
	spec.add_development_dependency "pry", "~>0.11"
	spec.add_development_dependency "cucumber", "~>3.1.0"
	spec.add_development_dependency "aruba", "~>0.14.0"
end
