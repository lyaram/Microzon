Given /^QBot is running$/ do

end

When /^QBot is surfing a webpage$/ do
  visit EtsyHomePage
end

Then /^QBot should get a snapshot$/ do
  on EtsyTreasuryPage do |page|
#    #page.list_treasury_div.should be_exists
#    page.list_treasury_div.should be_shown
#    page.item_treasury_li.should be_shown
#    page.item_hotness_div.should be_shown
#    #page.item_info_div.exists?.should be_true
#    page.item_info_div.should be_shown
#    page.item_stats_div.should be_shown
#    page.item_preview_div.should be_shown
  end
end
