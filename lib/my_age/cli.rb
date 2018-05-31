require 'thor'
require 'my_age'
module MyAge
	class CLI < Thor
		attr_accessor :dob
		include MyAge::Calculator

		desc "is AGE", "-d date_of_birth -a as_of_date, Dates are in yyyy-mm-dd format"
		method_option :dob, aliases: "d", desc: "date of birth in yyyy-mm-dd", required: true
		method_option :as_of, aliases: "a", desc: "as of date in yyyy-mm-dd", required: false
		def is
			self.dob = get_date(options[:dob])
			date = options[:as_of].present? ? get_date(options[:as_of]) : Date.today
			puts self.age(date)
		end

		private
		def get_date(date)
			if date =~ /^\d{4}-\d{2}-\d{2}$/
				DateTime.strptime(date, "%Y-%m-%d")
			else
				date_from_active_support_core_ext_helper(date)
			end
		rescue NoMethodError
			Date.send(date)
		end

		def date_from_active_support_core_ext_helper(date)
			dates = date.delete(")").split("(")
			method = dates[0].to_sym
			arg = dates[1]
			arg.nil? ? Date.today.send(method) :
				         Date.today.send(method, arg.to_i)
		end

	end
end
