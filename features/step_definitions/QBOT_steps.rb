Given /^QBot is running$/ do
  visit BookingPage
end

When /^QBot is surfing a webpage$/ do
  on BookingPage do |page| 
    page.search_box = "Booking"
    page.search 
  end
end

Then /^QBot should get a snapshot$/ do

end
