BASE_URL = "http://www.yahoo.es/"

require 'watir-webdriver'
require 'watir-webdriver-performance'
require 'watir-page-helper'
#require 'nokogiri'

$: << File.dirname(__FILE__)+'/../../lib'

module Watir
  class Element
 
#puts("CODETRACE >> #{__FILE__}:#{__LINE__} ----> PASO 01")
    alias_method :shown?, :exists?
 
  end
end

if ENV['HEADLESS']
#puts("CODETRACE >> #{__FILE__}:#{__LINE__} ----> PASO 02")
  FileUtils.rm 'results.html' if File.exists? 'results.html'
 
  FileUtils.rm_rf 'screenshots' if File.exists? 'screenshots'
 
  FileUtils.rm_rf 'junit' if File.exists? 'junit'

  Dir::mkdir 'junit'
 

  require 'headless'
 
  headless = Headless.new
 
  headless.start
#puts("CODETRACE >> #{__FILE__}:#{__LINE__} ----> FIN PASO 02")
  at_exit do
#puts("CODETRACE >> #{__FILE__}:#{__LINE__}")
    headless.destroy
  end
 
end

require 'pages.rb'
require 'page_metrics.rb'

module Metrics
  def self.page_metrics
#puts("CODETRACE >> #{__FILE__}:#{__LINE__} ----> PASO 11")
    @page_metrics ||= PageMetrics.new
  end
end

module Browser
#puts("CODETRACE >> #{__FILE__}:#{__LINE__} ----> PASO 04")
  DRIVER = (ENV['WEB_DRIVER'] || :firefox).to_sym
 
  client = Selenium::WebDriver::Remote::Http::Default.new
 
  client.timeout = 180
 
  
  BROWSER = Watir::Browser.new DRIVER, :http_client => client
#puts("CODETRACE >> #{__FILE__}:#{__LINE__} ----> FIN PASO 04")
  
  def visit page_class, &block
#puts("CODETRACE >> #{__FILE__}:#{__LINE__} ----> PASO 05")
    on page_class, true, &block
  end

  def on page_class, visit=false, &block
#puts("CODETRACE >> #{__FILE__}:#{__LINE__} ----> PASO 06")
    page = page_class.new BROWSER, Metrics.page_metrics, visit
#puts("CODETRACE >> #{__FILE__}:#{__LINE__} ----> PASO 08")
    block.call page if block
 
    page
 
  end

end

include Browser
World Browser

After do |scenario|
#puts("CODETRACE >> #{__FILE__}:#{__LINE__} ----> PASO 09")
  Dir::mkdir('screenshots') if not File.directory?('screenshots')
  screenshot = "./screenshots/WEBIMG_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
  Browser::BROWSER.driver.save_screenshot(screenshot)
  embed screenshot, 'image/png'
  
  htmlFile = "./screenshots/HTML_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.html"
    aFile = File.new(htmlFile, "w")
    aFile.write(Browser::BROWSER.html)
    aFile.close

#puts("CODETRACE >> #{__FILE__}:#{__LINE__} ----> FIN PASO 09")
end

at_exit do
#puts("CODETRACE >> #{__FILE__}:#{__LINE__} ----> PASO 10")
  puts Metrics.page_metrics.summary

  File.open('pagemetrics.yml', 'w') { |file| file.puts Metrics.page_metrics.summary }
 
  Browser::BROWSER.close
 
end
