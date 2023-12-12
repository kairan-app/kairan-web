require "selenium-webdriver"

options = Selenium::WebDriver::Chrome::Options.new(args: ["headless"])
driver = Selenium::WebDriver.for(
  :remote,
  url: "http://chrome:4444/wd/hub",
  options: options
)
driver.get("https://twitter.com/aimyonGtter/status/1671866598712553472")
puts driver.title

driver.quit
