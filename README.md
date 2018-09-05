# MethodFallback

[![Build Status](https://travis-ci.org/f-mer/method_fallback.svg?branch=master)](https://travis-ci.org/f-mer/method_fallback)
[![Maintainability](https://api.codeclimate.com/v1/badges/6600af762b40e0c56192/maintainability)](https://codeclimate.com/github/f-mer/method_fallback/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/6600af762b40e0c56192/test_coverage)](https://codeclimate.com/github/f-mer/method_fallback/test_coverage)

`MethodFallback` offers an easy way of delegating to another method if the
original one returned nil.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'method_fallback'
```

And then execute:

```sh
$ bundle
```

Or install it yourself as:

```sh
$ gem install method_fallback
```

## Usage

```ruby
class Author
  def name
    'John Doe'
  end
end

class Article
  def author
    Author.new
  end

  def author_name
    nil
  end

  fallback author_name: :name, to: :author
end

article = Artile.new

article.author_name_without_fallback # => nil
article.author_name # => "Jane Doe"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/f-mer/method_fallback. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MethodFallback project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/f-mer/method_fallback/blob/master/CODE_OF_CONDUCT.md).
