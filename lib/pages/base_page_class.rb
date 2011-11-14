class BasePageClass
  include WatirPageHelper

  def initialize browser, page_metrics, visit = false
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
    @browser = browser
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
    goto if visit
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
    expected_element if respond_to? :expected_element
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
#    has_expected_title? if respond_to? :has_expected_title?
#puts ".FROM:BasePageClass. self=" + self.to_s
#puts ".FROM:BasePageClass. probando=" + caller.to_s
    @browser.with_performance {|performance| page_metrics.add_page self.class, performance } unless visit
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
  end

  def method_missing sym, *args, &block
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
    @browser.send sym, *args, &block
  end
end
