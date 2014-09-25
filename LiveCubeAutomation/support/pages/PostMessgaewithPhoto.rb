path = File.expand_path(File.dirname(File.dirname(__FILE__))).split("pages").first
require path+"/support_helper.rb"

class PostMessage < SupportHelper

  def initialize(driver)
    @driver = driver
  end

  # login function
  def loginToApplication(username)
    clickSignIntoYourEvent()
    clickSignInWithTwitter()
    enterUserName(username)
    enterPassword(username)
    clickSignIn()
  end

  # clickSignIntoYourEvent
  def clickSignIntoYourEvent
    #waitElementDisplay('logintest')
    @driver.find_element(:css, "span.text").click
  end

  # clickSignInWithTwitter
  def clickSignInWithTwitter
    @driver.find_element(:css, "i.fui-twitter").click
  end

  # Enter UserName
  def enterUserName(userType)
    cc = ReadConfig.new()
    el = @driver.find_element(:id, "username_or_email")
    el.send_keys cc.getApplication(userType+'USER')
  end

  # Enter Password
  def enterPassword(userType)
    cc = ReadConfig.new()
    el = @driver.find_element(:id, "password")
    el.send_keys cc.getApplication(userType+'Pass')
  end

  # Click SigIn Button
  def clickSignIn
    @driver.find_element(:id,"allow").click
  end

  def enterComment(comment)
    # el = @driver.find_element(:css, "div.text-c.dIB > textarea.composer-text")
    @driver.find_element(:css, "div.text-c.dIB > textarea.composer-text").clear
    @driver.find_element(:css, "div.text-c.dIB > textarea.composer-text").send_keys comment
    # el.send_keys comment
  end


  def uploadPhoto()
    upload=@driver.find_element(:css, "div.photo-btn-c.x-btn-upload-photo > div.photo-btn-inner > span.icon-camera").sendKeys("C:\\Users\\Public\\Pictures\\Sample Pictures\\Koala.jpg")
    puts("enter")
   # upload.sendKeys("C:\\Users\Public\\Pictures\\Sample Pictures\\Koala.jpg")
    puts ("completed")

  end





  def clickPost()
    @driver.find_element(:xpath, "//*[@id='session']/section[2]/div/div[3]/a").click
    sleep(5)
    puts ("Post sucessfully done")
  end



end


















