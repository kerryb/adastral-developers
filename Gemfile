source "https://rubygems.org"
ruby "2.1.0"

gem "rails", "4.0.2"

gem "coffee-rails"
gem "foundation-icons-sass-rails"
gem "foundation-rails"
gem "haml"
gem "jbuilder"
gem "jquery-rails"
gem "omniauth"
gem "pg" # for heroku/production
gem "sass-rails"
gem "sqlite3"
gem "therubyracer", platforms: :ruby
gem "turbolinks"
gem "uglifier"

group :doc do
  gem "sdoc", require: false
end

group :development, :test do
  gem "debugger"
end

group :test do
  gem "cucumber-rails", require: false
  gem "database_cleaner"
  gem "factory_girl"
  gem "rspec-rails"
  gem "simplecov", "~> 0.7.1", require: false # see https://github.com/colszowka/simplecov/issues/281
end

group :production do
  gem "rails_12factor"
end
