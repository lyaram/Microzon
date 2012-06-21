Given /^QBot is running$/ do
  visit BookingPage
end

When /^QBot is surfing a webpage$/ do
  on NextLinkPage do |page| 
    page.launch "testingBooking_KL", 
                "http://www.booking.com/searchresults.es.html?order=name;rows=50;lang=es;selected_currency=EUR;city=-2403010", 
                "//td[@class='next']/a",
                "//*[@id='footernote']"
#    page.launch "http://www.booking.com/searchresults.es.html?order=name;rows=50;lang=es;selected_currency=EUR;city=-372490"
  end
end

Then /^QBot should get a snapshot$/ do

end
