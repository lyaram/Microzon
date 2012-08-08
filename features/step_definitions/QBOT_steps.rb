Given /^QBot is running$/ do
  visit BookingPage
end

When /^QBot is surfing a webpage$/ do
  on NextLinkPage do |page| 

#para subir modificaciones por ftp a amazon, utilizar la carpeta /tmp
#una vez alli, reubicar a la carpeta que sea necesaria
#si ha de ser manipulada, es posible que se necesiten cambios de permisos
#utilizar por ejemplo: sudo chmod ugo+rw launcheslog.xml


    #idLaunch = page.getLaunch
    #idLaunch='00000006'

    #idLaunch = page.getLaunch
    #page.launch idLaunch,'VENERE_HotelList.Buenos Aires', 'http://www.venere.com/es/argentina/buenos-aires/#p|1;f:o|venere_ranking-t|C-z|all_areas-r|r6-c|all_rate', '//*[@id="next" and @class="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    #page.launch idLaunch,'VENERE_HotelList.Tegucigalpa', 'http://www.venere.com/es/honduras/tegucigalpa/#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next" and @class="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'

    idLaunch = page.getLaunch
    page.launch idLaunch,'TRIVAGO_HotelList.REPESCA01.Santiago de Chile', 'http://www.trivago.es/region.php?query_path_name=Santiago%20de%20Chile&dealform_hotel_from_date=Do%2C%2024%2F06%2F12&dealform_hotel_to_date=Lu%2C%2025%2F06%2F12&room_type=7&javascript=1&from_day=24&from_month=6&from_year=12&to_day=25&to_month=6&to_year=12&dealform_referer=2&timestamp=1338995034&path=102067&view_type=0&dealform_typelog=0SANTIAGO%20DE%20CHILE&item=0&pagetype=hotels#price_region:%22request_ident=&url_hash=0c4ae5e98269b1cc075bb2ae4c53fd60&path=102067&date_range::from=1340488800&date_range::to=1340575200&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=relevance%20desc&view_type=0&geo_use_distance=0&f_160=1&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-70.642349&geo_code::latitude=-33.438709&timestamp=1338995034&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'EXPEDIA_HotelList.Santo Domingo (Rep Dominicana)', 'http://www.expedia.com/Hotel-Search?action=secondSearch&regionId=180024&searchString=&inpRegionType=CITY&inpStreet=&inpCityName=&inpState=&inpZip=&inpStartDate=&inpEndDate=&hotelRoomCountInput=1&adultCountInput=2&childCountInput=0#c=search&A=HOT.SR.LodgingType.Hotel&d=&I=180024&P=180024|MULTICITYVICINITY|Santo+Domingo+%28and+vicinity%29%2C+Dominican+Republic&Q=0|INVALID|&R=&L=51&U=CITY&V=Santo+Domingo+%28and+vicinity%29%2C+Dominican+Republic&W=&X=&Y=1&a=2&b=0&D=&F=&Z=1&K=0&M=0&N=0&T=50&ts=1340705478266', '//*[@id="nextpage"]', '//*[@id="paginationContainer"]', ''
    page.launch idLaunch,'VENERE_HotelList.Santo Domingo (Rep Dominicana)', 'http://www.venere.com/es/republica-dominicana/santo-domingo/#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next" and @class="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'TRIVAGO_HotelList.Santo Domingo (Rep Dominicana)', 'http://www.trivago.es/region.php?query_path_name=Santo%20Domingo&dealform_hotel_from_date=Do%2C%2024%2F06%2F12&dealform_hotel_to_date=Lu%2C%2025%2F06%2F12&room_type=7&javascript=1&from_day=24&from_month=6&from_year=12&to_day=25&to_month=6&to_year=12&dealform_referer=2&timestamp=1338994880&path=93572&view_type=0&dealform_typelog=0SANTO%20&item=0&pagetype=hotels#price_region:%22request_ident=&url_hash=e22bf0941c915edb8a2f9555ef1fb6cd&path=93572&date_range::from=1340488800&date_range::to=1340575200&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=relevance%20desc&view_type=0&geo_use_distance=0&f_160=1&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-69.910301&geo_code::latitude=18.474899&timestamp=1338994880&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'EXPEDIA_HotelList.Sao Paulo', 'http://www.expedia.com/Hotel-Search?action=newSearch&inpRfrrId=-56564#A=HOT.SR.LodgingType.Hotel&inpRoomAvailsOpenedState=&D=&E=Sao+Paulo+%28and+vicinity%29%2C+Brazil&d=&F=&hidRegionId=180023&Z=1&K=0&M=0&N=0&T=50&ts=1338892648278', '//*[@id="nextpage"]', '//*[@id="paginationContainer"]', ''
    page.launch idLaunch,'VENERE_HotelList.Sao Paulo', 'http://www.venere.com/es/brasil/san-pablo/#p|1;f:o|venere_ranking-t|C-z|all_areas-r|r6-c|all_rate', '//*[@id="next" and @class="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'TRIVAGO_HotelList.Sao Paulo', 'http://www.trivago.es/region.php?query_path_name=S%C3%A3o%20Paulo&dealform_hotel_from_date=Do%2C%2024%2F06%2F12&dealform_hotel_to_date=Lu%2C%2025%2F06%2F12&room_type=7&javascript=1&from_day=24&from_month=6&from_year=12&to_day=25&to_month=6&to_year=12&dealform_referer=2&timestamp=1338994585&path=79447&view_type=0&dealform_typelog=0SAO%20PAOLO&item=0&pagetype=hotels#price_region:%22request_ident=&url_hash=de7e10240cf3861c493ff68a9b803e13&path=79447&date_range::from=1340488800&date_range::to=1340575200&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=relevance%20desc&view_type=0&geo_use_distance=0&f_160=1&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-46.638714&geo_code::latitude=-23.546114&timestamp=1338994585&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'EXPEDIA_HotelList.Tegucigalpa', 'http://www.expedia.com/Hotel-Search?mcicid=&#c=search&A=HOT.SR.LodgingType.Hotel&d=&I=3421&P=3421|CITY|Tegucigalpa%2C+Honduras&Q=0|INVALID|&R=&L=9&U=CITY&V=Tegucigalpa%2C+Honduras&W=&X=&Y=1&a=2&b=0&D=&F=&Z=1&K=0&M=0&N=0&T=50&ts=1340705667182', '//*[@id="nextpage"]', '//*[@id="paginationContainer"]', ''
    page.launch idLaunch,'VENERE_HotelList.Tegucigalpa', 'http://www.venere.com/es/honduras/tegucigalpa/#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next" and @class="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'TRIVAGO_HotelList.Tegucigalpa', 'http://www.trivago.es/region.php?query_path_name=Tegucigalpa%20%28Distrito%20Central%29&dealform_hotel_from_date=Do%2C%2024%2F06%2F12&dealform_hotel_to_date=Lu%2C%2025%2F06%2F12&room_type=7&javascript=1&from_day=24&from_month=6&from_year=12&to_day=25&to_month=6&to_year=12&dealform_referer=2&timestamp=1338995083&path=84541&view_type=0&dealform_typelog=0TEGUCIGALPA&item=0&pagetype=hotels#price_region:%22request_ident=&url_hash=a9d99b5e739b6dc0893b3e374c5ff53b&path=84541&date_range::from=1340488800&date_range::to=1340575200&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=distance%20asc&view_type=0&geo_use_distance=1&geo_distance_limit=20000&f_160=1&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-87.177284&geo_code::latitude=14.111230&timestamp=1338995083&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''

  end
  
end

Then /^QBot should get a snapshot$/ do

end
