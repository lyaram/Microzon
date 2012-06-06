class BookingPage 
  include WatirPageHelper

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

#puts("CODETRACE >> #{__FILE__}:#{__LINE__} ----> PASO 03")
  direct_url "http://www.booking.com/searchresults.en-gb.html?sid=17055a451915e9872449d95075e8dd5b;dcid=1;city=-1658079"

visit MyPage do |page|
  page.search_box = "Watirmelon"
  page.search
end
  
end


class MyPage < BasePageClass
  direct_url "http://www.google.es"
  expected_element :text_field, :name => "q"
  expected_title "Google"
  text_field :search_box, :name => "q"
  button :search, :name => "btnG"
end
