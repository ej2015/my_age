# MyAge

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'my_age'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install my_age

## Usage

Mixin the `Age` module and call `age` method. 

```
class User
  attr_accessor :dob
  include MyAge
end

user = User.new
## by default, age is calculated as of today
user.age
## but you can supply a specific date
user.age(date)
## there is a host of helpers starting with 'age_as_of_' to specify the date too 
user.age_as_of_tomorrow
```

If your date-of-birth attribute is not called `dob`, you can assign it with `my_dob` so the gem knows where to look for it.

``` 
class User
  attr_accessor :date_of_birth
  include MyAge
  my_dob :date_of_birthi  #my attribute name
end

##everything else is the same
```
## Use ActiveSupport Helpers
You can use the helpers in `DateAndTime::Calculations`. Methods are constructed like `age_as_of_helper`:

```
## with #end_of_month, you can all
user.age_as_of_end_of_month

## or with #months_since
user.age_as_of_months_since(9)

## to be explicit, you can call
user.age_as_of_today  ## same as user.age
```

## CLI

```
$ my_age is -d 1981-08-01 -a 1985-08-01
$ #=> 4

$ my_age is -d 1981-01-08
$ #=> age as of today

##ActiveSupport helpers work here too
$ my_age is -d 1981-01-03 -a tomorrow
$ my_age is -d 'years_ago(5)' -a tomorrow  ##=> 5

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/my_age.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

