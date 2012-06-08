class BookingPage

  include WatirPageHelper
  
    
  link :next_page do |browser|
    browser.element_by_xpath("(//a)[1]").link
  end
 
 
  div :checkout_complete, :id => "footernote"
  def ensure_complete
    checkout_complete_div.wait_until_present
  end
    
  def launch url
    @browser.goto url 
    
    nextXpath = "//td[@class='next']/a"
    
    prepararStore
    #loop do
    3.times do
      ensure_complete
      storePage
      break if !@browser.element_by_xpath(nextXpath).exists?
      @browser.element_by_xpath(nextXpath).click
    end 
  end
  
  def prepararStore
    folderbase = Dir.home() + "/" + "BotStoring"
    Dir::mkdir(folderbase) if not File.directory?(folderbase)
    for i in 1..99999
      #puts "Value of local variable is #{i}"
      folder = folderbase + "/" + "%05d" % i
      if not File.directory?(folder) 
        @folderStore = folder
        @indexStore = "%05d" % i
        Dir::mkdir(@folderStore)
        Dir::mkdir(@folderStore + "/html")
        Dir::mkdir(@folderStore + "/png")
        break
      end
    end
  end

  def storePage
    t = Time.now  
    strDT = t.strftime("%y%m%d%H%M%S%3N")
    screenshot = @folderStore + "/png/" + strDT + ".png"
    @browser.driver.save_screenshot(screenshot)
    embed screenshot, 'image/png'
  end
  
  def initialize browser, page_metrics, visit = false
    @browser = browser
    goto if visit
    
    expected_element if respond_to? :expected_element
    has_expected_title? if respond_to? :has_expected_title?
 
    @browser.with_performance {|performance| page_metrics.add_page self.class, performance } unless visit
  end
  
  def method_missing sym, *args, &block
    @browser.send sym, *args, &block
  end


end
