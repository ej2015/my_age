require "spec_helper"
require 'pry'

describe MyAge do

	let(:user) { UserWithDob.new  }
	let(:user_without_dob) { UserWithoutDob.new }

	context "uses activesupport date_and_time calculations" do
		describe "#age" do

			it "is 1 on the first birthday" do
				user.dob = Date.today
				expect(user.age_as_of_next_year).to eq 1
			end

			it "is 4 on the fourth birthday" do
				user.dob = Date.today
				expect(user.age_as_of_years_since(4)).to eq 4
			end


		end
  end


end
