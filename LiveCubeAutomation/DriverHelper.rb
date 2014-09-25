require "json"
require "selenium-webdriver"
require "rspec"
require "test/unit"
#require "selenium-webdriver"
#include Test::Unit::Assertions

class DriverHelper

  def initialize(driver)
    @driver = driver
  end

  def readAttendeesUrl()
    url=""
    f = File.open("attendeesUrl.txt", "r")
    f.each_line do |line|

      puts line
      url=line
    end
    f.close
    url
  end


end
