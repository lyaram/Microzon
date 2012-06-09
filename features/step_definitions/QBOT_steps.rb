Given /^QBot is running$/ do
  visit BookingPage
end

When /^QBot is surfing a webpage$/ do
  on BookingPage do |page| 
    page.launch "http://www.tripadvisor.ru/Attraction_Review-g187497-d501696-Reviews-Magic_Fountain-Barcelona_Catalonia.html"
#    page.launch "http://www.booking.com/searchresults.es.html?order=name;rows=50;lang=es;selected_currency=EUR;city=-372490"
  end
end

Then /^QBot should get a snapshot$/ do

end
