# frozen_string_literal: true

require 'spec_helper'

describe MyAge do
  let(:user) { UserWithDob.new }
  let(:user_without_dob) { UserWithoutDob.new }

  describe '#age_as_of_today' do
    it 'works' do
      user.dob = Date.new(1988, 0o2, 0o4)
      expect(user.age_as_of_today).to be > 20
    end
  end
end
