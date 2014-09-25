path = File.expand_path(File.dirname(File.dirname(__FILE__))).split("Scripts").first
require path+"/driver_helper.rb"
require "json"
require "selenium-webdriver"
require "rspec"

describe "User can add and join the session" do


  before(:each) do
    cc = ReadConfig.new()
    browserType = cc.getApplication('BrowseType')

    if browserType.eql?("ff")
      @driver = Selenium::WebDriver.for :firefox
    end
    @base_url = cc.getApplication('URLApp')
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
   # @driver.manage.window.maximize
    CreateLog.new().LogStartExecution("execution started of Test Class user add and join session")
  end

    after(:each) do
  CreateLog.new().LogEndExecution("execution end of Test user add and join session")
  end

  it "Verify that user can add and join the session" do

    begin
      #open url
      @driver.get(@base_url + "/")
      CreateLog.new().Log("open application url")

      #object creation
      login = LoginTwitter.new(@driver)
      addjoinsession = AddJoinSessionPage.new(@driver)


      #Login to the application
      login.loginToApplication("General")
      CreateLog.new().Log("login to the application")

      #Add Session to the Application
      addjoinsession.addsession()
      CreateLog.new().Log("login to the application")
    end
  end
end
