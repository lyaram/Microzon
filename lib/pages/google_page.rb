class BookingPage

 # expected_title "Etsy - Your place to buy and sell all things handmade, vintage, and supplies"
 # direct_url "www.etsy.com"
 # link :buy, :text => "Buy"
 #
 # def click_buy
 #   self.buy
 # end




   #include WatirPageHelper
  
    direct_url "http://www.google.com/ncr"
    expected_element :text_field, :name => "q"
    expected_title "Google"
    text_field :search_box, :name => "q"
    button :search, :name => "btnG"
    
    #hay que separar este componente en una pagina google_results_page
    div :checkout_foot, :id => "foot" #/^checkout.*/

    def ensure_results_loaded
      checkout_foot_div.wait_until_present
    end
    ##################################################################
    
    def initialize browser, page_metrics, visit = false
      @browser = browser
      goto if visit
    
      expected_element if respond_to? :expected_element
      has_expected_title? if respond_to? :has_expected_title?
 
      @browser.with_performance {|performance| page_metrics.add_page self.class, performance } unless visit
   end
  
    def method_missing sym, *args, &block
      @browser.send sym, *args, &block
    end


end
