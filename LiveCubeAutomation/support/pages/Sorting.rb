path = File.expand_path(File.dirname(File.dirname(__FILE__))).split("pages").first
require path+"/support_helper.rb"

 class Sorting < SupportHelper

   def initialize(driver)
     @driver = driver
   end

   #verify that Recent sorting done correctly
   def verifySorting()
     assert element_present?(:xpath, "//*[@id='session-messages']/section/section[1]/a[1]/span[2][contains(text(),\"recent\")]")
   end

  #click Dropdown button
  def clickDropdown()
    @driver.find_element(:xpath, "//div[@id='session-messages']/section/section/a").click
  end

  #select Popular sorting option
  def selectPopular()
    @driver.find_element(:xpath, "//*[@id='session-messages']/section/section[1]/div[2]/div/a[2]/span[1]").click
  end

  #verify that Popular sorting done correctly
  def verifyPopularSorting()
   assert element_present?(:xpath, "//*[@id='session-messages']/section/section[1]/a[1]/span[2][contains(text(),\"popular\")]")
  end
end




















