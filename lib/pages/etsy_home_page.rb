class EtsyHomePage < BasePageClass

#  expected_title "Etsy - Your place to buy and sell all things handmade, vintage, and supplies"
  direct_url BASE_URL
puts "before_link"
  link :buy, :text => "Buy"
puts "after_link"
  
  def click_buy
    self.buy
  end
end
