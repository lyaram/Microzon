class BookingPage < BasePageClass

#puts("CODETRACE >> #{__FILE__}:#{__LINE__} ----> PASO 03")
  direct_url "http://www.booking.com/searchresults.en-gb.html?sid=17055a451915e9872449d95075e8dd5b;dcid=1;city=-1658079"

 # @browser.link(:xpath, "//td[@class='next']/a").click

  puts @browser.title
  
  
end
