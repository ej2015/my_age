# frozen_string_literal: true

require 'active_support'
require 'active_support/core_ext/object/blank'
require 'active_support/core_ext/date/calculations'
require 'my_age/version'
require 'my_age/calculator'
require 'my_age/helper'

module MyAge
  def self.included(base)
    base.include MyAge::Calculator
    base.include MyAge::Helper
  end
end
