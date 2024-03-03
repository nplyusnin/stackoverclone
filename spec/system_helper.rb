# frozen_string_literal: true

require "rails_helper"
require "capybara/rspec"
require "selenium/webdriver"

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :selenium_chrome_headless
  end

  # Includes devise helpers methods - sign_in, sign_out, etc...
  config.include Devise::Test::IntegrationHelpers, type: :system

  # Includes method - t
  config.include ActionView::Helpers::TranslationHelper

  # Include translation helper [spec/support/translation_helper.rb]
  config.include TranslationHelper
end
