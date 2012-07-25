Given /^QBot is running$/ do
  visit BookingPage
end

When /^QBot is surfing a webpage$/ do
  on NextLinkPage do |page| 

    #idLaunch='00000004'

    idLaunch = page.getLaunch
    page.launch idLaunch,'PREVIAJE_HotelList.REPESCA01.Buenos Aires', 'http://www.previaje.com/resultado_busqueda.html?search=Buenos%20Aires&H&1', '//div[@class="main hotels"]//li[@class="enabled pagButton next pagByOne"]', '//div[@class="main hotels"]//div[@class="optCont"]', ''
    page.launch idLaunch,'TRAVELOCITY_HotelList.REPESCA01.Managua', 'http://www.travelocity.com/trips/hotellist/datelessList?ac_country=NI&city=Managua&configId=S21949757&numRooms=1&path=hotels&pTxId=3719499&guestCodes=ADULT&guestCounts=1&hotelMaxReturnPerPage=25&startIndex=0', '(//a[@class="nextLink"])[1]', '//div[@class="products"]/div[starts-with(@class,"product")]', ''
    page.launch idLaunch,'TRAVELOCITY_HotelList.REPESCA01.Montevideo', 'http://www.travelocity.com/trips/hotellist/datelessList?ac_country=UY&city=Montevideo&configId=S21949757&numRooms=1&path=hotels&pTxId=3719321&guestCodes=ADULT&guestCounts=1&hotelMaxReturnPerPage=25&startIndex=0', '(//a[@class="nextLink"])[1]', '//div[@class="products"]/div[starts-with(@class,"product")]', ''
    page.launch idLaunch,'TRAVELOCITY_HotelList.REPESCA01.Quito ', 'http://www.travelocity.com/trips/hotellist/datelessList?ac_country=EC&city=Quito&configId=S21949757&numRooms=1&path=hotels&pTxId=3724484&guestCodes=ADULT&guestCounts=1&hotelMaxReturnPerPage=25&startIndex=0', '(//a[@class="nextLink"])[1]', '//div[@class="products"]/div[starts-with(@class,"product")]', ''
    page.launch idLaunch,'TRAVELOCITY_HotelList.REPESCA01.Santiago de Chile', 'http://www.travelocity.com/trips/hotellist/datelessList?ac_country=CL&city=Santiago+De+Chile&configId=S21949757&numRooms=1&path=hotels&pTxId=3721977&guestCodes=ADULT&guestCounts=1&hotelMaxReturnPerPage=25&startIndex=0', '(//a[@class="nextLink"])[1]', '//div[@class="products"]/div[starts-with(@class,"product")]', ''
    page.launch idLaunch,'TRAVELOCITY_HotelList.REPESCA01.Santo Domingo (Rep Dominicana)', 'http://www.travelocity.com/trips/hotellist/datelessList?ac_country=DO&city=Santo+Domingo&configId=S21949757&numRooms=1&path=hotels&pTxId=3725463&guestCodes=ADULT&guestCounts=1&hotelMaxReturnPerPage=25&startIndex=0', '(//a[@class="nextLink"])[1]', '//div[@class="products"]/div[starts-with(@class,"product")]', ''

    idLaunch = page.getLaunch
    page.launch idLaunch,'EXPEDIA_HotelList.Buenos Aires', 'http://www.expedia.com/Hotel-Search?action=secondSearch&regionId=6053581&searchString=&inpRegionType=CITY&inpStreet=&inpCityName=&inpState=&inpZip=&inpStartDate=&inpEndDate=&hotelRoomCountInput=1&adultCountInput=2&childCountInput=0&inpStarBuckets=0#c=search&A=HOT.SR.LodgingType.Hotel&d=&I=178242&P=178242|MULTICITYVICINITY|Buenos+Aires+%28and+vicinity%29%2C+Argentina&Q=0|INVALID|&R=&L=428&U=CITY&V=Buenos+Aires+%28and+vicinity%29%2C+Argentina&W=&X=&Y=1&a=2&b=0&D=&F=&Z=1&K=0&M=0&N=0&T=50&ts=1338550219707', '//*[@id="nextpage"]', '//li[@class="results-count"]', ''
    page.launch idLaunch,'TRIVAGO_HotelList.Buenos Aires', 'http://www.trivago.es/region.php?query_path_name=Buenos%20Aires&dealform_hotel_from_date=Do%2C%2024%2F06%2F12&dealform_hotel_to_date=Lu%2C%2025%2F06%2F12&room_type=7&javascript=1&from_day=24&from_month=6&from_year=12&to_day=25&to_month=6&to_year=12&dealform_referer=2&timestamp=1338983253&path=93122&view_type=0&dealform_typelog=0Buenos%20Aires&item=0&pagetype=hotels#price_region:%22request_ident=&url_hash=b54911813618d5fa6561c7a04b076885&path=93122&date_range::from=1340488800&date_range::to=1340575200&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=relevance%20desc&view_type=0&geo_use_distance=0&f_160=1&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-58.417309&geo_code::latitude=-34.611782&timestamp=1338983253&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistbottom"]', ''
    page.launch idLaunch,'VENERE_HotelList.Buenos Aires', 'http://www.venere.com/es/argentina/buenos-aires/#p|1;f:o|venere_ranking-t|C-z|all_areas-r|r6-c|all_rate', '//*[@id="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'EXPEDIA_HotelList.Tegucigalpa', 'http://www.expedia.com/Hotel-Search?mcicid=&#c=search&A=HOT.SR.LodgingType.Hotel&d=&I=3421&P=3421|CITY|Tegucigalpa%2C+Honduras&Q=0|INVALID|&R=&L=9&U=CITY&V=Tegucigalpa%2C+Honduras&W=&X=&Y=1&a=2&b=0&D=&F=&Z=1&K=0&M=0&N=0&T=50&ts=1340705667182', '//*[@id="nextpage"]', '//li[@class="results-count"]', ''
    page.launch idLaunch,'TRIVAGO_HotelList.Tegucigalpa', 'http://www.trivago.es/region.php?query_path_name=Tegucigalpa%20%28Distrito%20Central%29&dealform_hotel_from_date=Do%2C%2024%2F06%2F12&dealform_hotel_to_date=Lu%2C%2025%2F06%2F12&room_type=7&javascript=1&from_day=24&from_month=6&from_year=12&to_day=25&to_month=6&to_year=12&dealform_referer=2&timestamp=1338995083&path=84541&view_type=0&dealform_typelog=0TEGUCIGALPA&item=0&pagetype=hotels#price_region:%22request_ident=&url_hash=a9d99b5e739b6dc0893b3e374c5ff53b&path=84541&date_range::from=1340488800&date_range::to=1340575200&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=distance%20asc&view_type=0&geo_use_distance=1&geo_distance_limit=20000&f_160=1&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-87.177284&geo_code::latitude=14.111230&timestamp=1338995083&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistbottom"]', ''
    page.launch idLaunch,'VENERE_HotelList.Tegucigalpa', 'http://www.venere.com/es/honduras/tegucigalpa/#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'

  end
  
end

Then /^QBot should get a snapshot$/ do

end
