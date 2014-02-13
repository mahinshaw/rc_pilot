# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rc_pilot/version'

Gem::Specification.new do |spec|
  spec.name          = "rc_pilot"
  spec.version       = RcPilot::VERSION
  spec.authors       = %w(Mark Hinshaw)
  spec.email         = %w(mahinshaw@gmail.com)
  spec.summary       = %q{This gem handles installing and unintalling of *rc files}
  spec.description   = ""
  spec.homepage      = "https://github.com/mahinshaw/rc_pilot"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'thor', '~> 0.18'
  spec.add_dependency 'rugged'

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 2.14.0"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "test_construct"
end
