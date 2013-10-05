class BasePageClass
  #include WatirPageHelper

  def initialize browser, page_metrics, visit = false
#puts("CODETRACE >> #{__FILE__}:#{__LINE__} ----> PASO 07")
    @browser = browser

    goto if visit
 
    expected_element if respond_to? :expected_element
 
    @browser.with_performance {|performance| page_metrics.add_page self.class, performance } unless visit
#puts("CODETRACE >> #{__FILE__}:#{__LINE__} ----> FIN PASO 07")
  end

  def method_missing sym, *args, &block
#puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
    @browser.send sym, *args, &block
  end
  
end
