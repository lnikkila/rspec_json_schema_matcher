RSpec JSON schema matcher
=========================

[![Build status][circleci-badge]][circleci]

Validate JSON in your specs using [JSON schema](http://json-schema.org/):

```ruby
it "returns a valid user resource" do
  expect(response.body).to match_schema "user"
end
```

Handy for testing JSON-based web APIs!

### Installation ###

Add this to your application's Gemfile:

```ruby
group :test do
  gem "rspec_json_schema_matcher"
end
```

Then install the gem:

```sh-session
$ bundle
```

### Usage ###

> You might want to read my [blog post](https://lnikki.la/articles/rails-api-integration-tests-3/).

Provides a single RSpec matcher called `match_schema` that accepts a relative
path to a JSON schema without the .json extension.

The matcher assumes that your schemas are stored in `./spec/support/schemas` or
in its subdirectories.

For example, if you want to use `./spec/support/schemas/users/instance.json`,
write `match_schema "users/instance"`.

### Development ###

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake rspec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

### Contributing ###

Bug reports and pull requests are welcome!

### Licence ###

The gem is available as open source under the terms of the
[ISC License](http://opensource.org/licenses/ISC).

[circleci]: https://circleci.com/gh/lnikkila/rspec_json_schema_matcher
[circleci-badge]: https://img.shields.io/circleci/project/lnikkila/rspec_json_schema_matcher.svg
