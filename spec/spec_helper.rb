require 'capybara/dsl'
require 'selenium-webdriver'

ENV['RACK_ENV'] = 'test'
ENV['TESTED_HOST'] = 'https://ci.predix.io'

Capybara.app_host = ENV.fetch("TESTED_HOST")
Capybara.run_server = false
Capybara.default_driver = :selenium
Capybara.default_max_wait_time = 120

RSpec.configure do |config|
  config.include Capybara::DSL
  config.fail_fast = true
end
