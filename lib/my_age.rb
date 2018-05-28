require "active_support/core_ext/object"
require "active_support/core_ext/date_and_time/calculations"
require "my_age/version"
require "my_age/calculator"
require "my_age/helper"

module MyAge
	def self.included(base)
		base.include MyAge::Calculator
		base.include MyAge::Helper
	end

end
