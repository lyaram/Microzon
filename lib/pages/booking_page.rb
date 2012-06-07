class BookingPage

  include WatirPageHelper
  
    
  link :next_page do |browser|
    browser.element_by_xpath("//*[@class='next']/a").link
  end
 
 
  div :checkout_complete, :id => "footernote"
  def ensure_complete
    checkout_foot_div.wait_until_present
  end
    
  def launch url
    @browser.goto url #"http://www.booking.com/searchresults.es.html?order=name;rows=50;lang=es;selected_currency=EUR;city=-372490"
    
    loop do 
      ensure_complete
      break if !next_page_link.exits?
      next_page
      break
    end 
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
