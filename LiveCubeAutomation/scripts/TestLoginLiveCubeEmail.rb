path = File.expand_path(File.dirname(File.dirname(__FILE__))).split("Scripts").first
require path+"/driver_helper.rb"
require "json"
require "selenium-webdriver"
require "rspec"

describe "Login with Email Account at very first time" do

  before(:each) do
    cc = ReadConfig.new()
    browserType = cc.getApplication('BrowseType')
    if browserType.eql?("ff")
      @driver = Selenium::WebDriver.for :firefox
    end
    #@base_url = cc.getApplication('URLApp')
    @liveEmail=cc.getApplication('liveCubeEmail')
    @liveDesiredPass=cc.getApplication('liveCubePass')
    #@liveFullName=cc.getApplication('liveCubeFullName')
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
    @driver.manage.window.maximize
    CreateLog.new().LogStartExecution("execution started of scenario login with email at very first time")
  end

  after(:each) do
    lcHeader = LCubeHeader.new(@driver)
    #lcHeader.liveCubeLogout()
    @driver.quit
    CreateLog.new().LogEndExecution("execution end of scenario login with email at very first time")
  end

  it "Verify that user login into livecube application at very first time with email account" do

    begin
      #open url
      login = LoginLiveCube.new(@driver)
      driverhelper=DriverHelper.new(@driver)
      url= driverhelper.readAttendeesUrl()
      @driver.get(url)
      CreateLog.new().Log("open application url")

      #object creation
      loginEmail = LoginLiveCubeEmail.new(@driver)

      #Login to the application
      loginEmail.loginToApplication(@liveEmail,@liveDesiredPass)



    end
  end
 end
