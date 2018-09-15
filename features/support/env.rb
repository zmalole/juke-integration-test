require 'watir'
require 'watir-scroll'
require 'rspec'

browser = Watir::Browser.new
INDEX_OFFSET = -1
WEBDRIVER = true

Before do
  @browser = browser
  browser.driver.manage.window.maximize
end

at_exit do
  browser.close
end
