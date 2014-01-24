# Coverage and testing tools need to be started before code is 'required'
require "coveralls"
require "simplecov"

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start

require "rc_pilot"
