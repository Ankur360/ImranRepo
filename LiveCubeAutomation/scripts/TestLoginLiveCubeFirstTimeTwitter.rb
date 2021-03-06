path = File.expand_path(File.dirname(File.dirname(__FILE__))).split("Scripts").first
require path+"/driver_helper.rb"
require "json"
require "selenium-webdriver"
require "rspec"

describe "Scenario test login with twitter account" do

  before(:each) do
    cc = ReadConfig.new()
    browserType = cc.getApplication('BrowseType')
    if browserType.eql?("ff")
      @driver = Selenium::WebDriver.for :firefox
    end
    #@base_url = cc.getApplication('URLApp')
    @liveTwitterEmail=cc.getApplication('liveCubeTwitterEmail')
    @liveTwitterPass=cc.getApplication('liveCubeTwitterPass')
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
    @driver.manage.window.maximize
    CreateLog.new().LogStartExecution("execution started of scenario login with twitter account")
  end

  after(:each) do
    lcHeader = LCubeHeader.new(@driver)
    lcHeader.liveCubeLogout()
    @driver.quit
    CreateLog.new().LogEndExecution("execution end of scenario login with twitter account")
  end

  it "Verify that user login into the application with twitter account" do

    begin
      #open url
      driverhelper=DriverHelper.new(@driver)
      url= driverhelper.readAttendeesUrl()
      @driver.get(url)
      CreateLog.new().Log("open application url")

      #object creation
      loginTwitter = LoginLiveCubeFirstTimeTwitter.new(@driver)
      #livecubelogout= LCubeHeader.new(@driver)

      #Login to the application
      loginTwitter.loginToApplication(@liveTwitterEmail,@liveTwitterPass)

    end
  end
end
