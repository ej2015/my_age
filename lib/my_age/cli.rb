require 'thor'
require 'my_age'

module MyAge
	class CLI < Thor
    attr_accessor :dob
    include MyAge::Calculator

    desc "is AGE", "-d date_of_birth -a as_of_date, Dates are in yyyy-mm-dd format"
		method_option :dob, aliases: "d", desc: "date of birth in yyyy-mm-dd", required: true
		method_option :as_of, aliases: "a", desc: "as of date in yyyy-mm-dd", required: true
		def is
			self.dob = DateTime.strptime(options[:dob], "%Y-%m-%d")
			date = DateTime.strptime(options[:as_of], "%Y-%m-%d")
			puts self.age(date)
		end

	end
end
