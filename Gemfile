source "https://rubygems.org"
ruby "2.1.0"

gem "rails", "4.0.2"

gem "coffee-rails"
gem "jbuilder"
gem "jquery-rails"
gem "haml"
gem "sass-rails"
gem "sqlite3"
gem "therubyracer", platforms: :ruby
gem "turbolinks"
gem "uglifier"
gem "foundation-rails"

group :doc do
  gem "sdoc", require: false
end

group :development, :test do
  gem "debugger"
end

group :test do
  gem "cucumber-rails", require: false
  gem "database_cleaner"
  gem "rspec-rails"
  gem "simplecov", "~> 0.7.1", require: false # see https://github.com/colszowka/simplecov/issues/281
end

group :production do
  gem "rails_12factor"
end
