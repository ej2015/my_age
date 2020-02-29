# frozen_string_literal: true

require 'my_age/helper'

module MyAge
  module Calculator
    unless respond_to?(:dob)
      def self.included(base)
        def base.my_dob(col)
          define_method(:dob) { send col }
        end
      end
    end

    def age(date = Date.today)
      return 0 if dob.blank? || date.blank? || date <= dob

      (date_to_int(date) - date_to_int(dob)) / 10_000
    end

    def method_missing(name, *args)
      if name.to_s =~ /_as_of_/
        date_method = name.to_s.split('_as_of_')[-1]
        age today.send(date_method.to_sym, *args)
      else
        super
      end
    end

    private

    def date_to_int(date)
      date.strftime('%Y%m%d').to_i
    end

    def today
      Date.today
    end
  end
end
