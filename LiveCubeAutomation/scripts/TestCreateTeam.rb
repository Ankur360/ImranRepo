path = File.expand_path(File.dirname(File.dirname(__FILE__))).split("Scripts").first
require path+"/driver_helper.rb"

describe "Scenario test create team" do
	  
  before(:each) do
		cc = ReadConfig.new()
		browserType = cc.getApplication('BrowseType')
		if browserType.eql?("ie")
			@driver = Selenium::WebDriver.for :ie 
		end
		
		if browserType.eql?("ff")
			@driver = Selenium::WebDriver.for :firefox 
		end

      @base_url = cc.getApplication('ORZRURL')
      @OrgEmail=cc.getApplication('OrgAdminEmail')
      @OrgPass=cc.getApplication('OrgAdminPass')
      @driver.manage.timeouts.implicit_wait = 30
      @verification_errors = []
      @driver.manage.window.maximize
      CreateLog.new().LogStartExecution("execution started of Test Class Scenario test create team")
   end
  
    after(:each) do
      header = Header.new(@driver)
      header.logOut()
      @driver.quit
      CreateLog.new().LogEndExecution("execution end of Test Class Scenario test create team")
    end

  it "Test create team and verify that team created successfully" do
	
    begin
      #open url
      @driver.get(@base_url + "/")
      CreateLog.new().Log("open application url")
      #object creation
      login = Login.new(@driver)
      header = Header.new(@driver)
      dashboard = OrganizerDashboard.new(@driver)
      editLiveCube = EditLiveCubeMeeting.new(@driver)
      #Login to the application
      login.loginToOrganizerApp(@OrgEmail,@OrgPass)
      meetingName= "Automation Meeting"
      dashboard.clickOnMeeting(meetingName)
      editLiveCube.testCreateTeam()

     rescue
      #update and generate report for test
     raise
    end
  end    
  
end
