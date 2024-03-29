# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.3.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.3", ">= 7.1.3.2"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Authentication framework for Rails [https://github.com/heartcombo/devise]
gem "devise"

# Localization devise [https://github.com/tigrish/devise-i18n]
gem "devise-i18n"

# Syntax sugar for initialize objects [https://dry-rb.org/gems/dry-initializer]
gem "dry-initializer"

# Localization rails [https://github.com/svenfuchs/rails-i18n]
gem "rails-i18n"

# Simple and beautiful form [https://github.com/heartcombo/simple_form]
gem "simple_form"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri windows]

  # Testing fixtures [https://github.com/thoughtbot/factory_bot_rails]
  gem "factory_bot_rails"

  # Main test framework [https://github.com/rspec/rspec-rails]
  gem "rspec-rails"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Ruby linter/formatter [https://github.com/rubocop/rubocop]
  gem "rubocop", require: false

  # Rubocop plugin for supports factory_bot gem [https://github.com/rubocop/rubocop-factory_bot]
  gem "rubocop-factory_bot", require: false

  # Rubocop plugin for supports rails [https://github.com/rubocop/rubocop-rails]
  gem "rubocop-rails", require: false

  # Rubocop plugin for supports rspec [https://github.com/rubocop/rubocop-rspec]
  gem "rubocop-rspec", require: false

  # Rubocop plugin for support capybara [https://github.com/rubocop/rubocop-capybara]
  gem "rubocop-capybara", require: false

  # Testing web application by simulating a real user behavior [https://github.com/teamcapybara/capybara]
  gem "capybara", require: false

  # W3C WebDriver protocol to automate popular browsers [https://rubygems.org/gems/selenium-webdriver/versions/4.4.0]
  # (capybara dependency)
  gem "selenium-webdriver", require: false

  # Ruby-lsp - Ruby language server protocol
  gem "ruby-lsp", require: false

  # Ruby-lps plugin for rspec
  gem "ruby-lsp-rspec", require: false

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  # Deploying
  # See https://kamal-deploy.org/
  gem "kamal"
end

group :test do
  # Provides one-liners to test common Rails functionality [https://github.com/thoughtbot/shoulda-matchers]
  gem "shoulda-matchers"
end
