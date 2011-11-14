class EtsyHomePage < BasePageClass

#  expected_title "Etsy - Your place to buy and sell all things handmade, vintage, and supplies"
#  direct_url BASE_URL
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
  direct_url "http://www.turismepropbarcelona.cat/ca/"
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
  #link :buy, :text => "Buy"
  #screenshot = "./screenshots/WEBIMG_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
  #@screenshot = "./screenshots/WEBIMG_www_turismepropbarcelona_cat.png"
  #puts @screenshot
  #Browser::BROWSER.driver.save_screenshot(@screenshot)
  #embed @screenshot, 'image/png'
#
#  direct_url "http://www.diba.es/parcsn/parcs/home.asp"
#  @screenshot = "./screenshots/WEBIMG_www_diba_es_parcsn.png"
#  Browser::BROWSER.driver.save_screenshot(@screenshot)
#  embed @screenshot, 'image/png'
  
#  def click_buy
#    self.buy
#  end
end
