BASE_URL = "http://www.yahoo.es/"

require 'watir-webdriver'
require 'watir-webdriver-performance'
require 'watir-page-helper'

$: << File.dirname(__FILE__)+'/../../lib'

module Watir
  class Element
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
    alias_method :shown?, :exists?
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
  end
end

if ENV['HEADLESS']
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
  FileUtils.rm 'results.html' if File.exists? 'results.html'
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
  FileUtils.rm_rf 'screenshots' if File.exists? 'screenshots'
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
  FileUtils.rm_rf 'junit' if File.exists? 'junit'
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
  Dir::mkdir 'junit'
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")

  require 'headless'
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
  headless = Headless.new
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
  headless.start
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
  at_exit do
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
    headless.destroy
  end
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
end

require 'pages.rb'
require 'page_metrics.rb'

module Metrics
  def self.page_metrics
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
    @page_metrics ||= PageMetrics.new
  end
end

module Browser
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
  DRIVER = (ENV['WEB_DRIVER'] || :firefox).to_sym
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
  client = Selenium::WebDriver::Remote::Http::Default.new
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
  client.timeout = 180
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
  
  BROWSER = Watir::Browser.new DRIVER, :http_client => client
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
  
  def visit page_class, &block
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
    on page_class, true, &block
  end

  def on page_class, visit=false, &block
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
    page = page_class.new BROWSER, Metrics.page_metrics, visit
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
    block.call page if block
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
    page
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
  end

end

include Browser
World Browser

After do |scenario|
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
  Dir::mkdir('screenshots') if not File.directory?('screenshots')
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
  screenshot = "./screenshots/WEBIMG_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
  Browser::BROWSER.driver.save_screenshot(screenshot)
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
  embed screenshot, 'image/png'
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
end

at_exit do
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
  puts Metrics.page_metrics.summary
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
  File.open('pagemetrics.yml', 'w') { |file| file.puts Metrics.page_metrics.summary }
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
  Browser::BROWSER.close
puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
end
