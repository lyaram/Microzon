class BasePageClass
  include WatirPageHelper

  def initialize browser, page_metrics, visit = false
puts("CODETRACE >> #{__FILE__}:#{__LINE__} ----> PASO 07")
    @browser = browser

puts("CODETRACE >> #{__FILE__}:#{__LINE__} ----> PASO A")
  screenshot = "./WEBIMG_pic0005.png"
puts("CODETRACE >> #{__FILE__}:#{__LINE__} ----> PASO B")
#  Browser::BROWSER.driver.save_screenshot(screenshot)
  @browser.driver.save_screenshot(screenshot)
puts("CODETRACE >> #{__FILE__}:#{__LINE__} ----> PASO C")

	
    goto if visit
 
    expected_element if respond_to? :expected_element
 
#    has_expected_title? if respond_to? :has_expected_title?
#puts ".FROM:BasePageClass. self=" + self.to_s
#puts ".FROM:BasePageClass. probando=" + caller.to_s
    @browser.with_performance {|performance| page_metrics.add_page self.class, performance } unless visit
puts("CODETRACE >> #{__FILE__}:#{__LINE__} ----> FIN PASO 07")
  end

  def method_missing sym, *args, &block
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
    @browser.send sym, *args, &block
  end
end
