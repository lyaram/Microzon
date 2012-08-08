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
    page.launch idLaunch,'EXPEDIA_HotelList.Asuncion', 'http://www.expedia.com/Hotel-Search?action=secondSearch&regionId=6053581&searchString=&inpRegionType=CITY&inpStreet=&inpCityName=&inpState=&inpZip=&inpStartDate=&inpEndDate=&hotelRoomCountInput=1&adultCountInput=2&childCountInput=0&inpStarBuckets=0#c=search&A=HOT.SR.LodgingType.Hotel&d=&I=432&P=432|CITY|Asuncion%2C+Paraguay&Q=0|INVALID|&R=&L=22&U=CITY&V=Asuncion%2C+Paraguay&W=&X=&Y=1&a=2&b=0&D=&F=&Z=1&K=0&M=0&N=0&T=50&ts=1338547343701', '//*[@id="nextpage"]', '//*[@id="paginationContainer"]', ''
    page.launch idLaunch,'VENERE_HotelList.Asuncion', 'http://www.venere.com/es/paraguay/asuncion/#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'TRIVAGO_HotelList.Asuncion', 'http://www.trivago.es/region.php?query_path_name=Distrito%20Capital%20%28Asunci%C3%B3n%29&dealform_hotel_from_date=Do%2C%2024%2F06%2F12&dealform_hotel_to_date=Lu%2C%2025%2F06%2F12&room_type=7&javascript=1&from_day=24&from_month=6&from_year=12&to_day=25&to_month=6&to_year=12&dealform_referer=2&timestamp=1338982003&path=86367&view_type=0&dealform_typelog=0Asunci%C3%B3&item=0&pagetype=hotels#price_region:%22request_ident=&url_hash=beef9d09ce15067a4a38c4d1199adfea&path=86367&date_range::from=1340488800&date_range::to=1340575200&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=relevance%20desc&view_type=0&geo_use_distance=0&f_160=1&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-57.636230&geo_code::latitude=-25.300493&timestamp=1338982003&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'EXPEDIA_HotelList.Bogota', 'http://www.expedia.com/Hotel-Search?action=secondSearch&regionId=6053581&searchString=&inpRegionType=CITY&inpStreet=&inpCityName=&inpState=&inpZip=&inpStartDate=&inpEndDate=&hotelRoomCountInput=1&adultCountInput=2&childCountInput=0&inpStarBuckets=0#c=search&A=HOT.SR.LodgingType.Hotel&d=&I=178238&P=178238|MULTICITYVICINITY|Bogota+%28and+vicinity%29%2C+Colombia&Q=0|INVALID|&R=&L=201&U=CITY&V=Bogota+%28and+vicinity%29%2C+Colombia&W=&X=&Y=1&a=2&b=0&D=&F=&Z=1&K=0&M=0&N=0&T=50&ts=1338547477095', '//*[@id="nextpage"]', '//*[@id="paginationContainer"]', ''
    page.launch idLaunch,'VENERE_HotelList.Bogota', 'http://www.venere.com/es/colombia/bogota/#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'TRIVAGO_HotelList.Bogota', 'http://www.trivago.es/region.php?query_path_name=Bogot%C3%A1&dealform_hotel_from_date=Do%2C%2024%2F06%2F12&dealform_hotel_to_date=Lu%2C%2025%2F06%2F12&room_type=7&javascript=1&from_day=24&from_month=6&from_year=12&to_day=25&to_month=6&to_year=12&dealform_referer=2&timestamp=1338982285&path=85327&view_type=0&dealform_typelog=0Bogo&item=0&pagetype=hotels#price_region:%22request_ident=&url_hash=3298f189fe70433a8482caa342e231f7&path=85327&date_range::from=1340488800&date_range::to=1340575200&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=relevance%20desc&view_type=0&geo_use_distance=0&f_160=1&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-74.082397&geo_code::latitude=4.611200&timestamp=1338982285&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'EXPEDIA_HotelList.Brasilia', 'http://www.expedia.com/Hotel-Search?action=secondSearch&regionId=6053581&searchString=&inpRegionType=CITY&inpStreet=&inpCityName=&inpState=&inpZip=&inpStartDate=&inpEndDate=&hotelRoomCountInput=1&adultCountInput=2&childCountInput=0&inpStarBuckets=0#c=search&A=HOT.SR.LodgingType.Hotel&d=&I=6053512&P=6053512|NEIGHBORHOOD|Brasilia%2C+Brazil&Q=6052627|MULTICITYVICINITY|Federal+District+%28state%29%2C+Brazil&R=&L=24&U=CITY&V=Brasilia%2C+Brazil&W=&X=&Y=1&a=2&b=0&D=&F=&Z=1&K=0&M=0&N=0&T=50&ts=1338549739013', '//*[@id="nextpage"]', '//*[@id="paginationContainer"]', ''
    page.launch idLaunch,'VENERE_HotelList.Brasilia', 'http://www.venere.com/es/brasil/brasilia/#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'TRIVAGO_HotelList.Brasilia', 'http://www.trivago.es/region.php?query_path_name=Brasilia&dealform_hotel_from_date=Do%2C%2024%2F06%2F12&dealform_hotel_to_date=Lu%2C%2025%2F06%2F12&room_type=7&javascript=1&from_day=24&from_month=6&from_year=12&to_day=25&to_month=6&to_year=12&dealform_referer=2&timestamp=1338982734&path=76508&view_type=0&dealform_typelog=0Brasilia&item=0&pagetype=hotels#price_region:%22request_ident=&url_hash=ca57e7cb3f74e2f293e92a6be60ae08a&path=76508&date_range::from=1340488800&date_range::to=1340575200&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=relevance%20desc&view_type=0&geo_use_distance=0&f_160=1&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-47.912102&geo_code::latitude=-15.784500&timestamp=1338982734&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'EXPEDIA_HotelList.Buenos Aires', 'http://www.expedia.com/Hotel-Search?action=secondSearch&regionId=6053581&searchString=&inpRegionType=CITY&inpStreet=&inpCityName=&inpState=&inpZip=&inpStartDate=&inpEndDate=&hotelRoomCountInput=1&adultCountInput=2&childCountInput=0&inpStarBuckets=0#c=search&A=HOT.SR.LodgingType.Hotel&d=&I=178242&P=178242|MULTICITYVICINITY|Buenos+Aires+%28and+vicinity%29%2C+Argentina&Q=0|INVALID|&R=&L=428&U=CITY&V=Buenos+Aires+%28and+vicinity%29%2C+Argentina&W=&X=&Y=1&a=2&b=0&D=&F=&Z=1&K=0&M=0&N=0&T=50&ts=1338550219707', '//*[@id="nextpage"]', '//*[@id="paginationContainer"]', ''
    page.launch idLaunch,'VENERE_HotelList.Buenos Aires', 'http://www.venere.com/es/argentina/buenos-aires/#p|1;f:o|venere_ranking-t|C-z|all_areas-r|r6-c|all_rate', '//*[@id="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'TRIVAGO_HotelList.Buenos Aires', 'http://www.trivago.es/region.php?query_path_name=Buenos%20Aires&dealform_hotel_from_date=Do%2C%2024%2F06%2F12&dealform_hotel_to_date=Lu%2C%2025%2F06%2F12&room_type=7&javascript=1&from_day=24&from_month=6&from_year=12&to_day=25&to_month=6&to_year=12&dealform_referer=2&timestamp=1338983253&path=93122&view_type=0&dealform_typelog=0Buenos%20Aires&item=0&pagetype=hotels#price_region:%22request_ident=&url_hash=b54911813618d5fa6561c7a04b076885&path=93122&date_range::from=1340488800&date_range::to=1340575200&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=relevance%20desc&view_type=0&geo_use_distance=0&f_160=1&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-58.417309&geo_code::latitude=-34.611782&timestamp=1338983253&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'EXPEDIA_HotelList.Caracas', 'http://www.expedia.com/Hotel-Search?action=secondSearch&regionId=6053581&searchString=&inpRegionType=CITY&inpStreet=&inpCityName=&inpState=&inpZip=&inpStartDate=&inpEndDate=&hotelRoomCountInput=1&adultCountInput=2&childCountInput=0&inpStarBuckets=0#c=search&A=HOT.SR.LodgingType.Hotel&d=&I=6053635&P=6053635|MULTICITYVICINITY|Caracas+%28and+vicinity%29%2C+Venezuela&Q=0|INVALID|&R=&L=17&U=CITY&V=Caracas+%28and+vicinity%29%2C+Venezuela&W=&X=&Y=1&a=2&b=0&D=&F=&Z=1&K=0&M=0&N=0&T=50&ts=1338550451003', '//*[@id="nextpage"]', '//*[@id="paginationContainer"]', ''
    page.launch idLaunch,'VENERE_HotelList.Caracas', 'http://www.venere.com/es/venezuela/caracas/#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'TRIVAGO_HotelList.Caracas', 'http://www.trivago.es/region.php?query_path_name=Caracas&dealform_hotel_from_date=Do%2C%2024%2F06%2F12&dealform_hotel_to_date=Lu%2C%2025%2F06%2F12&room_type=7&javascript=1&from_day=24&from_month=6&from_year=12&to_day=25&to_month=6&to_year=12&dealform_referer=2&timestamp=1338983423&path=87508&view_type=0&dealform_typelog=0Caracas&item=0&pagetype=hotels#price_region:%22request_ident=&url_hash=5e1913df96fb3f0d29b47b0faec9424c&path=87508&date_range::from=1340488800&date_range::to=1340575200&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=relevance%20desc&view_type=0&geo_use_distance=0&f_160=1&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-66.915337&geo_code::latitude=10.501967&timestamp=1338983423&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'EXPEDIA_HotelList.Ciudad de Mexico', 'http://www.expedia.com/Hotel-Search?action=secondSearch&regionId=6053581&searchString=&inpRegionType=CITY&inpStreet=&inpCityName=&inpState=&inpZip=&inpStartDate=&inpEndDate=&hotelRoomCountInput=1&adultCountInput=2&childCountInput=0&inpStarBuckets=0#c=search&A=HOT.SR.LodgingType.Hotel&d=&I=178285&P=178285|MULTICITYVICINITY|Mexico+City+%28and+vicinity%29%2C+Distrito+Federal%2C+Mexico&Q=0|INVALID|&R=&L=176&U=CITY&V=Mexico+City+%28and+vicinity%29%2C+Distrito+Federal%2C+Mexico&W=&X=&Y=1&a=2&b=0&D=&F=&Z=1&K=0&M=0&N=0&T=50&ts=1338550549939', '//*[@id="nextpage"]', '//*[@id="paginationContainer"]', ''
    page.launch idLaunch,'VENERE_HotelList.Ciudad de Mexico', 'http://www.venere.com/es/mexico/ciudad-de-mexico/#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'TRIVAGO_HotelList.Ciudad de Mexico', 'http://www.trivago.es/region.php?query_path_name=Ciudad%20de%20M%C3%A9xico&dealform_hotel_from_date=Do%2C%2024%2F06%2F12&dealform_hotel_to_date=Lu%2C%2025%2F06%2F12&room_type=7&javascript=1&from_day=24&from_month=6&from_year=12&to_day=25&to_month=6&to_year=12&dealform_referer=2&timestamp=1338993765&path=51247&view_type=0&dealform_typelog=0CIUDAD%20DE%20MEXIC&item=0&pagetype=hotels#price_region:%22request_ident=&url_hash=ebbb2663355f2aace9ef9ccc967b80aa&path=51247&date_range::from=1340488800&date_range::to=1340575200&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=relevance%20desc&view_type=0&geo_use_distance=0&f_160=1&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-99.133102&geo_code::latitude=19.432884&timestamp=1338993765&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'EXPEDIA_HotelList.Guatemala', 'http://www.expedia.com/Hotel-Search?action=secondSearch&regionId=6053581&searchString=&inpRegionType=CITY&inpStreet=&inpCityName=&inpState=&inpZip=&inpStartDate=&inpEndDate=&hotelRoomCountInput=1&adultCountInput=2&childCountInput=0&inpStarBuckets=0#c=search&A=HOT.SR.LodgingType.Hotel&d=&I=6053902&P=6053902|MULTICITYVICINITY|Guatemala+City+%28and+vicinity%29&Q=0|INVALID|&R=&L=69&U=CITY&V=Guatemala+City+%28and+vicinity%29&W=&X=&Y=1&a=2&b=0&D=&F=&Z=1&K=0&M=0&N=0&T=50&ts=1338550625261', '//*[@id="nextpage"]', '//*[@id="paginationContainer"]', ''
    page.launch idLaunch,'VENERE_HotelList.Guatemala', 'http://www.venere.com/es/guatemala/ciudad-de-guatemala/#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'TRIVAGO_HotelList.Guatemala', 'http://www.trivago.es/region.php?query_path_name=Guatemala-ciudad&dealform_hotel_from_date=Do%2C%2024%2F06%2F12&dealform_hotel_to_date=Lu%2C%2025%2F06%2F12&room_type=7&javascript=1&from_day=24&from_month=6&from_year=12&to_day=25&to_month=6&to_year=12&dealform_referer=2&timestamp=1338993847&path=84187&view_type=0&pagetype=hotels#price_region:%22request_ident=&url_hash=9e3217478d71f6e7fdc72bf64cc07fee&path=84187&date_range::from=1340488800&date_range::to=1340575200&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=relevance%20desc&view_type=0&geo_use_distance=0&f_160=1&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-90.532822&geo_code::latitude=14.624795&timestamp=1338993847&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'TRIVAGO_HotelList.Havana', 'http://www.trivago.es/region.php?query_path_name=La%20Habana&dealform_hotel_from_date=Do%2C%2024%2F06%2F12&dealform_hotel_to_date=Lu%2C%2025%2F06%2F12&room_type=7&javascript=1&from_day=24&from_month=6&from_year=12&to_day=25&to_month=6&to_year=12&dealform_referer=2&timestamp=1338994035&path=33570&view_type=0&dealform_typelog=0habana&item=0&pagetype=hotels#price_region:%22request_ident=&url_hash=09f21b241fb04e97e1b7632bd778b286&path=33570&date_range::from=1340488800&date_range::to=1340575200&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=relevance%20desc&view_type=0&geo_use_distance=0&f_160=1&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-82.364098&geo_code::latitude=23.132000&timestamp=1338994035&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'EXPEDIA_HotelList.La Paz', 'http://www.expedia.com/Hotel-Search?mcicid=&#c=search&A=HOT.SR.LodgingType.Hotel&d=&I=6053938&P=6053938|MULTICITYVICINITY|La+Paz+%28and+vicinity%29%2C+Bolivia&Q=0|INVALID|&R=&L=20&U=CITY&V=La+Paz+%28and+vicinity%29%2C+Bolivia&W=&X=&Y=1&a=2&b=0&D=&F=&Z=1&K=0&M=0&N=0&T=50&ts=1340705190999', '//*[@id="nextpage"]', '//*[@id="paginationContainer"]', ''
    page.launch idLaunch,'VENERE_HotelList.La Paz', 'http://www.venere.com/es/bolivia/la-paz/#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'TRIVAGO_HotelList.La Paz', 'http://www.trivago.es/region.php?query_path_name=La%20Paz&dealform_hotel_from_date=Do%2C%2024%2F06%2F12&dealform_hotel_to_date=Lu%2C%2025%2F06%2F12&room_type=7&javascript=1&from_day=24&from_month=6&from_year=12&to_day=25&to_month=6&to_year=12&dealform_referer=2&timestamp=1338994085&path=83667&view_type=0&dealform_typelog=0la%20paz&item=0&pagetype=hotels#price_region:%22request_ident=&url_hash=ed1675867227336e95fecd14407eb190&path=83667&date_range::from=1340488800&date_range::to=1340575200&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=relevance%20desc&view_type=0&geo_use_distance=0&f_160=1&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-68.135178&geo_code::latitude=-16.498686&timestamp=1338994085&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'EXPEDIA_HotelList.Lima', 'http://www.expedia.com/Hotel-Search?action=secondSearch&regionId=178277&searchString=&inpRegionType=CITY&inpStreet=&inpCityName=&inpState=&inpZip=&inpStartDate=&inpEndDate=&hotelRoomCountInput=1&adultCountInput=2&childCountInput=0#c=search&A=HOT.SR.LodgingType.Hotel&d=&I=178277&P=178277|MULTICITYVICINITY|Lima+%28and+vicinity%29%2C+Peru&Q=0|INVALID|&R=&L=134&U=CITY&V=Lima+%28and+vicinity%29%2C+Peru&W=&X=&Y=1&a=2&b=0&D=&F=&Z=1&K=0&M=0&N=0&T=50&ts=1340705290545', '//*[@id="nextpage"]', '//*[@id="paginationContainer"]', ''
    page.launch idLaunch,'VENERE_HotelList.Lima', 'http://www.venere.com/es/peru/lima/#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'TRIVAGO_HotelList.Lima', 'http://www.trivago.es/region.php?query_path_name=Lima&dealform_hotel_from_date=Do%2C%2024%2F06%2F12&dealform_hotel_to_date=Lu%2C%2025%2F06%2F12&room_type=7&javascript=1&from_day=24&from_month=6&from_year=12&to_day=25&to_month=6&to_year=12&dealform_referer=2&timestamp=1338994217&path=86439&view_type=0&pagetype=hotels#price_region:%22request_ident=&url_hash=4d9d96a0b1c029b04785f2e32fa0aeec&path=86439&date_range::from=1340488800&date_range::to=1340575200&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=relevance%20desc&view_type=0&geo_use_distance=0&f_160=1&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-77.043129&geo_code::latitude=-12.051725&timestamp=1338994180&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'EXPEDIA_HotelList.Managua', 'http://www.expedia.com/Hotel-Search?action=newSearch&inpRfrrId=-56564#A=HOT.SR.LodgingType.Hotel&inpRoomAvailsOpenedState=&D=&E=Managua+%28and+vicinity%29%2C+Nicaragua&d=&F=&hidRegionId=6053704&Z=1&K=0&M=0&N=0&T=50&ts=1338892162701', '//*[@id="nextpage"]', '//*[@id="paginationContainer"]', ''
    page.launch idLaunch,'VENERE_HotelList.Managua', 'http://www.venere.com/es/nicaragua/managua/#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'TRIVAGO_HotelList.Managua', 'http://www.trivago.es/region.php?query_path_name=Managua&dealform_hotel_from_date=Do%2C%2024%2F06%2F12&dealform_hotel_to_date=Lu%2C%2025%2F06%2F12&room_type=7&javascript=1&from_day=24&from_month=6&from_year=12&to_day=25&to_month=6&to_year=12&dealform_referer=2&timestamp=1338994221&path=86045&view_type=0&dealform_typelog=0managua&item=0&pagetype=hotels#price_region:%22request_ident=&url_hash=d933d0bf1e1ff332cd71b36fd76a1957&path=86045&date_range::from=1340488800&date_range::to=1340575200&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=distance%20asc&view_type=0&geo_use_distance=1&geo_distance_limit=20000&f_160=1&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-86.271912&geo_code::latitude=12.147749&timestamp=1338994221&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'EXPEDIA_HotelList.Montevideo', 'http://www.expedia.com/Hotel-Search?action=secondSearch&regionId=6053581&searchString=&inpRegionType=CITY&inpStreet=&inpCityName=&inpState=&inpZip=&inpStartDate=&inpEndDate=&hotelRoomCountInput=1&adultCountInput=2&childCountInput=0&inpStarBuckets=0#c=search&A=HOT.SR.LodgingType.Hotel&d=&I=6053581&P=6053581|NEIGHBORHOOD|Montevideo%2C+Uruguay&Q=6053579|MULTICITYVICINITY|Uruguay+%28all%29%2C+Uruguay&R=&L=49&U=CITY&V=Montevideo%2C+Uruguay&W=&X=&Y=1&a=2&b=0&D=&F=&Z=1&K=0&M=0&N=0&T=50&ts=1338547053240', '//*[@id="nextpage"]', '//*[@id="paginationContainer"]', ''
    page.launch idLaunch,'VENERE_HotelList.Montevideo', 'http://www.venere.com/es/uruguay/montevideo/#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'TRIVAGO_HotelList.Montevideo', 'http://www.trivago.es/region.php?query_path_name=Montevideo&dealform_hotel_from_date=Do%2C%2024%2F06%2F12&dealform_hotel_to_date=Lu%2C%2025%2F06%2F12&room_type=7&javascript=1&from_day=24&from_month=6&from_year=12&to_day=25&to_month=6&to_year=12&dealform_referer=2&timestamp=1338994269&path=87248&view_type=0&dealform_typelog=1Montevideo&item=0&pagetype=hotels#price_region:%22request_ident=&url_hash=c3de3f5c3504861f436082a70aae5405&path=87248&date_range::from=1340488800&date_range::to=1340575200&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=relevance%20desc&view_type=0&geo_use_distance=0&f_160=1&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-56.155998&geo_code::latitude=-34.894299&timestamp=1338994269&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'EXPEDIA_HotelList.Panama', 'http://www.expedia.com/Hotel-Search?mcicid=&#c=search&A=HOT.SR.LodgingType.Hotel&d=&I=6053252&P=6053252|NEIGHBORHOOD|Panama+City%2C+Panama&Q=6049962|MULTICITYVICINITY|Panama+%28all%29%2C+Panama&R=&L=85&U=CITY&V=Panama+City%2C+Panama&W=&X=&Y=1&a=2&b=0&D=&F=&Z=1&K=0&M=0&N=0&T=50&ts=1340705859088', '//*[@id="nextpage"]', '//*[@id="paginationContainer"]', ''
    page.launch idLaunch,'VENERE_HotelList.Panama', 'http://www.venere.com/es/panama/ciudad-de-panama/#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'TRIVAGO_HotelList.Panama', 'http://www.trivago.es/region.php?query_path_name=Ciudad%20de%20Panam%C3%A1&dealform_hotel_from_date=Do%2C%2024%2F06%2F12&dealform_hotel_to_date=Lu%2C%2025%2F06%2F12&room_type=7&javascript=1&from_day=24&from_month=6&from_year=12&to_day=25&to_month=6&to_year=12&dealform_referer=2&timestamp=1338994311&path=86285&view_type=0&dealform_typelog=0Ciudad%20de%20pana&item=0&pagetype=hotels#price_region:%22request_ident=&url_hash=2970723458ea2e073a8b7f392128e4a7&path=86285&date_range::from=1340488800&date_range::to=1340575200&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=relevance%20desc&view_type=0&geo_use_distance=0&f_160=1&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-79.518791&geo_code::latitude=8.994269&timestamp=1338994311&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'EXPEDIA_HotelList.Punta del Este', 'http://www.expedia.com/Hotel-Search?#A=HOT.SR.LodgingType.Hotel&inpRoomAvailsOpenedState=&D=&E=punta+del+este%2C+uruguay&d=&F=&hidRegionId=6053582&Z=1&K=0&M=0&N=0&T=50&ts=1338892534136', '//*[@id="nextpage"]', '//*[@id="paginationContainer"]', ''
    page.launch idLaunch,'VENERE_HotelList.Punta del Este', 'http://www.venere.com/es/uruguay/punta-del-este/#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'TRIVAGO_HotelList.Punta del Este', 'http://www.trivago.es/region.php?query_path_name=Punta%20del%20Este&dealform_hotel_from_date=Do%2C%2024%2F06%2F12&dealform_hotel_to_date=Lu%2C%2025%2F06%2F12&room_type=7&javascript=1&from_day=24&from_month=6&from_year=12&to_day=25&to_month=6&to_year=12&dealform_referer=2&timestamp=1338994515&path=202951&view_type=0&dealform_typelog=0punta%20del%20este&item=0&pagetype=hotels#price_region:%22request_ident=&url_hash=51d500ac593174d2d8a7a0c0c01b0dab&path=202951&date_range::from=1340488800&date_range::to=1340575200&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=relevance%20desc&view_type=0&geo_use_distance=0&f_160=1&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-54.943008&geo_code::latitude=-34.975140&timestamp=1338994515&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'EXPEDIA_HotelList.Quito ', 'http://www.expedia.com/Hotel-Search?action=newSearch&inpRfrrId=-56564#A=HOT.SR.LodgingType.Hotel&inpRoomAvailsOpenedState=&D=&E=Quito+%28and+vicinity%29%2C+Ecuador&d=&F=&Z=1&K=0&M=0&N=0&T=50&ts=1338892582380', '//*[@id="nextpage"]', '//*[@id="paginationContainer"]', ''
    page.launch idLaunch,'VENERE_HotelList.Quito ', 'http://www.venere.com/es/ecuador/quito/#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'TRIVAGO_HotelList.Quito ', 'http://www.trivago.es/region.php?query_path_name=Quito&dealform_hotel_from_date=Do%2C%2024%2F06%2F12&dealform_hotel_to_date=Lu%2C%2025%2F06%2F12&room_type=7&javascript=1&from_day=24&from_month=6&from_year=12&to_day=25&to_month=6&to_year=12&dealform_referer=2&timestamp=1338994553&path=443275&view_type=0&dealform_typelog=0quito&item=0&pagetype=hotels#price_region:%22request_ident=&url_hash=c950771efcf0a02db994d8e59955a4cd&path=443275&date_range::from=1340488800&date_range::to=1340575200&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=relevance%20desc&view_type=0&geo_use_distance=0&f_160=1&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-78.494560&geo_code::latitude=-0.194980&timestamp=1338994553&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'EXPEDIA_HotelList.San Jose (Costa Rica)', 'http://www.expedia.com/Hotel-Search?action=newSearch&inpRfrrId=-56564#A=HOT.SR.LodgingType.Hotel&inpRoomAvailsOpenedState=&D=&E=San+Jose+%28and+vicinity%29%2C+Costa+Rica&d=&F=&hidRegionId=603085&Z=1&K=0&M=0&N=0&T=50&ts=1338892769639', '//*[@id="nextpage"]', '//*[@id="paginationContainer"]', ''
    page.launch idLaunch,'VENERE_HotelList.San Jose (Costa Rica)', 'http://www.venere.com/es/costa-rica/san-jose/#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'TRIVAGO_HotelList.San Jose (Costa Rica)', 'http://www.trivago.es/region.php?query_path_name=San%20Jos%C3%A9&dealform_hotel_from_date=Do%2C%2024%2F06%2F12&dealform_hotel_to_date=Lu%2C%2025%2F06%2F12&room_type=7&javascript=1&from_day=24&from_month=6&from_year=12&to_day=25&to_month=6&to_year=12&dealform_referer=2&timestamp=1338994737&path=89058&view_type=0&dealform_typelog=0SAN%20JOSE&item=0&pagetype=hotels#price_region:%22request_ident=&url_hash=0b13260bae1803e6e4e8750e90bc2e9f&path=89058&date_range::from=1340488800&date_range::to=1340575200&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=relevance%20desc&view_type=0&geo_use_distance=0&f_160=1&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-84.100189&geo_code::latitude=9.940202&timestamp=1338994737&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'EXPEDIA_HotelList.San Juan de Puerto Rico', 'http://www.expedia.com/Hotel-Search?action=newSearch&inpRfrrId=-56564#A=HOT.SR.LodgingType.Hotel&inpRoomAvailsOpenedState=&D=&E=San+Juan%2C+Puerto+Rico&d=&F=&hidRegionId=800114&Z=1&K=0&M=0&N=0&T=50&ts=1340019187589', '//*[@id="nextpage"]', '//*[@id="paginationContainer"]', ''
    page.launch idLaunch,'VENERE_HotelList.San Juan de Puerto Rico', 'http://www.venere.com/es/puerto-rico/san-juan-puerto-rico/#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'TRIVAGO_HotelList.San Juan de Puerto Rico', 'http://www.trivago.es/region.php?query_path_name=San%20Juan&dealform_hotel_from_date=Do%2C%2024%2F06%2F12&dealform_hotel_to_date=Lu%2C%2025%2F06%2F12&room_type=7&javascript=1&from_day=24&from_month=6&from_year=12&to_day=25&to_month=6&to_year=12&dealform_referer=2&timestamp=1338994776&path=33685&view_type=0&dealform_typelog=0SAN%20JUAN&item=0&pagetype=hotels#price_region:%22request_ident=&url_hash=afe29fcde152711990cf858a07fbb564&path=33685&date_range::from=1340488800&date_range::to=1340575200&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=relevance%20desc&view_type=0&geo_use_distance=0&f_160=1&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-66.067596&geo_code::latitude=18.449301&timestamp=1338994776&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'EXPEDIA_HotelList.San Salvador', 'http://www.expedia.com/Hotel-Search?action=newSearch&inpRfrrId=-56564#A=HOT.SR.LodgingType.Hotel&inpRoomAvailsOpenedState=&D=&E=San+Salvador+%28and+vicinity%29%2C+El+Salvador&d=&F=&hidRegionId=6053734&Z=1&K=0&M=0&N=0&T=50&ts=1338893116288', '//*[@id="nextpage"]', '//*[@id="paginationContainer"]', ''
    page.launch idLaunch,'VENERE_HotelList.San Salvador', 'http://www.venere.com/es/el-salvador/san-salvador/#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'TRIVAGO_HotelList.San Salvador', 'http://www.trivago.es/region.php?query_path_name=San%20Salvador&dealform_hotel_from_date=Do%2C%2024%2F06%2F12&dealform_hotel_to_date=Lu%2C%2025%2F06%2F12&room_type=7&javascript=1&from_day=24&from_month=6&from_year=12&to_day=25&to_month=6&to_year=12&dealform_referer=2&timestamp=1338994949&path=83732&view_type=0&dealform_typelog=0SAN%20SALVADOR&item=0&pagetype=hotels#price_region:%22request_ident=&url_hash=a4a3db2be18354b0dede0997a5b52197&path=83732&date_range::from=1340488800&date_range::to=1340575200&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=distance%20asc&view_type=0&geo_use_distance=1&geo_distance_limit=20000&f_160=1&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-89.203331&geo_code::latitude=13.706944&timestamp=1338994949&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'EXPEDIA_HotelList.Santiago de Chile', 'http://www.expedia.com/Hotel-Search?action=newSearch&inpRfrrId=-56564#A=HOT.SR.LodgingType.Hotel&inpRoomAvailsOpenedState=&D=&E=Santiago+%28and+vicinity%29%2C+Chile&d=&F=&hidRegionId=178306&Z=1&K=0&M=0&N=0&T=50&ts=1338893184143', '//*[@id="nextpage"]', '//*[@id="paginationContainer"]', ''
    page.launch idLaunch,'VENERE_HotelList.Santiago de Chile', 'http://www.venere.com/es/chile/santiago/#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'TRIVAGO_HotelList.Santiago de Chile', 'http://www.trivago.es/region.php?query_path_name=Santiago%20de%20Chile&dealform_hotel_from_date=Do%2C%2024%2F06%2F12&dealform_hotel_to_date=Lu%2C%2025%2F06%2F12&room_type=7&javascript=1&from_day=24&from_month=6&from_year=12&to_day=25&to_month=6&to_year=12&dealform_referer=2&timestamp=1338995034&path=102067&view_type=0&dealform_typelog=0SANTIAGO%20DE%20CHILE&item=0&pagetype=hotels#price_region:%22request_ident=&url_hash=0c4ae5e98269b1cc075bb2ae4c53fd60&path=102067&date_range::from=1340488800&date_range::to=1340575200&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=relevance%20desc&view_type=0&geo_use_distance=0&f_160=1&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-70.642349&geo_code::latitude=-33.438709&timestamp=1338995034&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'EXPEDIA_HotelList.Santo Domingo (Rep Dominicana)', 'http://www.expedia.com/Hotel-Search?action=secondSearch&regionId=180024&searchString=&inpRegionType=CITY&inpStreet=&inpCityName=&inpState=&inpZip=&inpStartDate=&inpEndDate=&hotelRoomCountInput=1&adultCountInput=2&childCountInput=0#c=search&A=HOT.SR.LodgingType.Hotel&d=&I=180024&P=180024|MULTICITYVICINITY|Santo+Domingo+%28and+vicinity%29%2C+Dominican+Republic&Q=0|INVALID|&R=&L=51&U=CITY&V=Santo+Domingo+%28and+vicinity%29%2C+Dominican+Republic&W=&X=&Y=1&a=2&b=0&D=&F=&Z=1&K=0&M=0&N=0&T=50&ts=1340705478266', '//*[@id="nextpage"]', '//*[@id="paginationContainer"]', ''
    page.launch idLaunch,'VENERE_HotelList.Santo Domingo (Rep Dominicana)', 'http://www.venere.com/es/republica-dominicana/santo-domingo/#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'TRIVAGO_HotelList.Santo Domingo (Rep Dominicana)', 'http://www.trivago.es/region.php?query_path_name=Santo%20Domingo&dealform_hotel_from_date=Do%2C%2024%2F06%2F12&dealform_hotel_to_date=Lu%2C%2025%2F06%2F12&room_type=7&javascript=1&from_day=24&from_month=6&from_year=12&to_day=25&to_month=6&to_year=12&dealform_referer=2&timestamp=1338994880&path=93572&view_type=0&dealform_typelog=0SANTO%20&item=0&pagetype=hotels#price_region:%22request_ident=&url_hash=e22bf0941c915edb8a2f9555ef1fb6cd&path=93572&date_range::from=1340488800&date_range::to=1340575200&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=relevance%20desc&view_type=0&geo_use_distance=0&f_160=1&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-69.910301&geo_code::latitude=18.474899&timestamp=1338994880&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'EXPEDIA_HotelList.Sao Paulo', 'http://www.expedia.com/Hotel-Search?action=newSearch&inpRfrrId=-56564#A=HOT.SR.LodgingType.Hotel&inpRoomAvailsOpenedState=&D=&E=Sao+Paulo+%28and+vicinity%29%2C+Brazil&d=&F=&hidRegionId=180023&Z=1&K=0&M=0&N=0&T=50&ts=1338892648278', '//*[@id="nextpage"]', '//*[@id="paginationContainer"]', ''
    page.launch idLaunch,'VENERE_HotelList.Sao Paulo', 'http://www.venere.com/es/brasil/san-pablo/#p|1;f:o|venere_ranking-t|C-z|all_areas-r|r6-c|all_rate', '//*[@id="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'TRIVAGO_HotelList.Sao Paulo', 'http://www.trivago.es/region.php?query_path_name=S%C3%A3o%20Paulo&dealform_hotel_from_date=Do%2C%2024%2F06%2F12&dealform_hotel_to_date=Lu%2C%2025%2F06%2F12&room_type=7&javascript=1&from_day=24&from_month=6&from_year=12&to_day=25&to_month=6&to_year=12&dealform_referer=2&timestamp=1338994585&path=79447&view_type=0&dealform_typelog=0SAO%20PAOLO&item=0&pagetype=hotels#price_region:%22request_ident=&url_hash=de7e10240cf3861c493ff68a9b803e13&path=79447&date_range::from=1340488800&date_range::to=1340575200&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=relevance%20desc&view_type=0&geo_use_distance=0&f_160=1&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-46.638714&geo_code::latitude=-23.546114&timestamp=1338994585&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'EXPEDIA_HotelList.Tegucigalpa', 'http://www.expedia.com/Hotel-Search?mcicid=&#c=search&A=HOT.SR.LodgingType.Hotel&d=&I=3421&P=3421|CITY|Tegucigalpa%2C+Honduras&Q=0|INVALID|&R=&L=9&U=CITY&V=Tegucigalpa%2C+Honduras&W=&X=&Y=1&a=2&b=0&D=&F=&Z=1&K=0&M=0&N=0&T=50&ts=1340705667182', '//*[@id="nextpage"]', '//*[@id="paginationContainer"]', ''
    page.launch idLaunch,'VENERE_HotelList.Tegucigalpa', 'http://www.venere.com/es/honduras/tegucigalpa/#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'TRIVAGO_HotelList.Tegucigalpa', 'http://www.trivago.es/region.php?query_path_name=Tegucigalpa%20%28Distrito%20Central%29&dealform_hotel_from_date=Do%2C%2024%2F06%2F12&dealform_hotel_to_date=Lu%2C%2025%2F06%2F12&room_type=7&javascript=1&from_day=24&from_month=6&from_year=12&to_day=25&to_month=6&to_year=12&dealform_referer=2&timestamp=1338995083&path=84541&view_type=0&dealform_typelog=0TEGUCIGALPA&item=0&pagetype=hotels#price_region:%22request_ident=&url_hash=a9d99b5e739b6dc0893b3e374c5ff53b&path=84541&date_range::from=1340488800&date_range::to=1340575200&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=distance%20asc&view_type=0&geo_use_distance=1&geo_distance_limit=20000&f_160=1&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-87.177284&geo_code::latitude=14.111230&timestamp=1338995083&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''

  end
  
end

Then /^QBot should get a snapshot$/ do

end
