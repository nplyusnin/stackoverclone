# frozen_string_literal: true

require "rails_helper"
require "capybara/rspec"
require "selenium/webdriver"

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :selenium_chrome_headless
  end

  config.include Devise::Test::IntegrationHelpers, type: :system
end
