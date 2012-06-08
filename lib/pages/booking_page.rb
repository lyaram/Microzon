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
     return
     
    @browser.goto url 
    
    nextXpath = "//td[@class='next']/a"
    loop do
      ensure_complete
      break if !@browser.element_by_xpath(nextXpath).exists?
      @browser.element_by_xpath(nextXpath).click
    end 
  end
  
  def storePage
    
  end
  
  def initialize browser, page_metrics, visit = false
    @browser = browser
    goto if visit
    
    expected_element if respond_to? :expected_element
    has_expected_title? if respond_to? :has_expected_title?
 
    @browser.with_performance {|performance| page_metrics.add_page self.class, performance } unless visit
    
    #mirar si hay un mejor sitio para ubicar este fragmento de code#
    folderbase = Dir.home() + "/" + "BotStoring"
    Dir::mkdir(folderbase) if not File.directory?(folderbase)
    for i in 1..5 #99999
      #puts "Value of local variable is #{i}"
      folder = folderbase + "/" + "%05d" % i
      puts folder
      if not File.directory?(folder) 
        puts ' no existe'
        @indexStore = "%05d" % i
        Dir::mkdir(folder)
        Dir::mkdir(folder + "/" + "html")
        Dir::mkdir(folder + "/" + "png")
        break
      else 
        puts ' existe'
      end
    end
    ################################################################
  end
  
  def method_missing sym, *args, &block
    @browser.send sym, *args, &block
  end


end
