path = File.expand_path(File.dirname(File.dirname(__FILE__))).split("pages").first
require path+"/support_helper.rb"

 class PostMessage < SupportHelper

   def initialize(driver)
    @driver = driver
   end

   def enterComment(comment)
     e1=@driver.find_element(:css, "div.text-c.dIB > textarea.composer-text")
     e1.clear
     e1.send_keys comment
  end

   def clickPost()
     e1=@driver.find_element(:link, "Post")
     e1.click
   end

  def verifyPointsEarned
       el= @driver.find_element(:css, "img.top-avatar-img")
       el.click
       message=@driver.find_element(xpath:"//div[@class='bubble-bottom btcf']/div/span").text
       assert_equal message, true, "1"
  end
end




















