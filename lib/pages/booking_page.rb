class MyPage < BasePageClass

  expected_title "Etsy - Your place to buy and sell all things handmade, vintage, and supplies"
  direct_url "www.etsy.com"
  link :buy, :text => "Buy"

  def click_buy
    self.buy
  end

  
end
