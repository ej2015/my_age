# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'my_age'

class UserWithDob
  include MyAge

  attr_accessor :dob
end

class UserWithoutDob
  include MyAge

  attr_accessor :date_of_birth

  my_dob :date_of_birth
end
