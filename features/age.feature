Feature: Age
  A CLI to calculate age

	Scenario: Use --dob
		When I run `my_age is --dob 1981-03-08 --as_of 1989-03-07`
		Then the output should contain "7"

  Scenario: Use active_support date_time helper
		When I run `my_age is -d today -a next_year`
		Then the output should contain "1"

	Scenario: Use -d and -a
		When I run `my_age is -d 1981-01-02 -a 1991-01-02`
		Then the output should contain "10"


