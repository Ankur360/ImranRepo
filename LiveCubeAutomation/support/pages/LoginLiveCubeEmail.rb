path = File.expand_path(File.dirname(File.dirname(__FILE__))).split("pages").first
require path+"/support_helper.rb"

class LoginLiveCubeEmail < SupportHelper

  def initialize(driver)
    @driver = driver
  end

  # login function
  def loginToApplication(emailAdd, desiredPass)
    clickOnSignIntoYourEvent()
    clickOnSignInWithEmail()
    enterEmailAddress(emailAdd)
    enterDesiredPassword(desiredPass)
    #enterFullName(fullName)
    clickSignIn()
    verifyUserLoggedIn()
  end


  # click Sign Into your Event button
  def clickOnSignIntoYourEvent()
    e1= @driver.find_element(:xpath, "//span[text()='Sign Into Your Event']")
    e1.click
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait.until { @driver.find_element(:id => "sign_in_user").displayed? }
   end

  # click Sign with Email Link
  def clickOnSignInWithEmail()
    e1= @driver.find_element(:xpath, "//span[text()='Sign In with Email']")
    e1.click
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait.until { @driver.find_element(:id => "input-security-email").displayed? }
  end

  # enter the User name
  def enterEmailAddress(emailAdd)
    el = @driver.find_element(:id, "input-security-email")
    el.send_keys emailAdd
  end

  # enter the Password
  def enterDesiredPassword(desiredPass)
    el = @driver.find_element(:id, "input-security-password")
    el.send_keys desiredPass
  end

=begin
      def enterFullName(fullName)
    el = @driver.find_element(:id, "input-security-password")
    el.send_keys desiredPass
  end
=end

  # click SigInWithEmail Link
  def clickSignIn
    e1 = @driver.find_element(:xpath, "//span[text()='Sign In with Email']")
    e1.click
   end

  # verify user logged into the live cube application
  def verifyUserLoggedIn
    el=@driver.find_element(:css, "a.x-btn-show-me").displayed?
    assert_equal el,true, "User should be logged in livecube application"

  end

  end


























