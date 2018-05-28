$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "my_age"

class UserWithDob  
	include MyAge::Calculator

	attr_accessor :dob

end

class UserWithoutDob  
	include MyAge::Calculator

	attr_accessor :date_of_birth

	my_dob :date_of_birth
end
