Given /^QBot is running$/ do
  visit BookingPage
end

When /^QBot is surfing a webpage$/ do
  on NextLinkPage do |page| 
    page.launch 'iRON_SIM-LATAM_BOOKING_Buenos Aires', 'http://www.booking.com/searchresults.en-gb.html?sid=17055a451915e9872449d95075e8dd5b;dcid=1;city=-979186;class_interval=1;inac=0;redirected_from_city=0;redirected_from_landmark=0;review_score_group=empty;score_min=0;ss_all=0;ssb=empty;radius=1;;nflt=ht_id%3D14%3B;track_ajax_filters=1;rows=50', '//td[@class="next"]/a', '//*[@id="footernote"]'
    page.launch 'iRON_SIM-LATAM_BOOKING_Tegucigalpa', 'http://www.booking.com/searchresults.html?src=searchresults&city=-1130280&order=popularity&ssne=Tegucigalpa&ssne_untouched=Tegucigalpa&error_url=http%3A%2F%2Fwww.booking.com%2Fsearchresults.en-gb.html%3Fsid%3D76ee9c624b55bfb6db32d711f5cc8db9%3Bdcid%3D1%3Bcity%3D-1130280%3Bclass_interval%3D1%3Bidf%3D1%3Boffset%3D0%3Border%3Dpopularity%3Breview_score_group%3Dempty%3Bscore_min%3D0%3Bsi%3Dai%252Cco%252Cci%252Cre%252Cdi%3Bsrc%3Dsearchresults%3Bssb%3Dempty%3Bssne_untouched%3DSantiago%3Bradius%3D70%3B&dcid=1&lang=en-gb&sid=76ee9c624b55bfb6db32d711f5cc8db9&si=ai%2Cco%2Cci%2Cre%2Cdi&ss=Tegucigalpa&radius=2&checkin_monthday=0&checkin_year_month=0&checkout_monthday=0&checkout_year_month=0&idf=on&dest_type=city&dest_id=-1130280', '//td[@class="next"]/a', '//*[@id="footernote"]'
    page.launch 'iRON_SIM-LATAM_TRIPADVISOR_C1_Buenos Aires', 'http://www.tripadvisor.es/Hotels-g312741-Buenos_Aires_Capital_Federal_District-Hotels.html', '//*[@id="pager_bottom"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]'
    page.launch 'iRON_SIM-LATAM_TRIPADVISOR_C1_Tegucigalpa', 'http://www.tripadvisor.es/Hotels-g292026-Tegucigalpa-Hotels.html', '//*[@id="pager_bottom"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]'
    page.launch 'iRON_SIM-LATAM_TRIPADVISOR_C2_Buenos Aires', 'http://www.tripadvisor.es/Hotels-g312741-c2-Buenos_Aires_Capital_Federal_District-Hotels.html', '//*[@id="pager_bottom"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]'
    page.launch 'iRON_SIM-LATAM_TRIPADVISOR_C2_Tegucigalpa', 'http://www.tripadvisor.es/Hotels-g292026-c2-Tegucigalpa-Hotels.html', '//*[@id="pager_bottom"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]'
    page.launch 'iRON_SIM-LATAM_TRIPADVISOR_C3_Buenos Aires', 'http://www.tripadvisor.es/Hotels-g312741-c3-Buenos_Aires_Capital_Federal_District-Hotels.html', '//*[@id="pager_bottom"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]'
    page.launch 'iRON_SIM-LATAM_TRIPADVISOR_C3_Tegucigalpa', 'http://www.tripadvisor.es/Hotels-g292026-c3-Tegucigalpa-Hotels.html', '//*[@id="pager_bottom"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]'
    page.launch 'iRON_SIM-LATAM_VIAJEROS_Buenos Aires', 'http://www.viajeros.com/destinos/buenos-aires/hoteles/hotel', '(//a[@class="pag_siguiente"])[1]', '//*[@id="wrap-footer"]'
    page.launch 'iRON_SIM-LATAM_VIAJEROS_Tegucigalpa', 'http://www.viajeros.com/destinos/tegucigalpa/hoteles/hotel', '', '//*[@id="wrap-footer"]'
    page.launch 'iRON_SIM-LATAM_PREVIAJE_Buenos Aires', 'http://www.previaje.com/resultado_busqueda.html?search=Buenos%20Aires&H&1', '//div[@class="main hotels"]//li[@class="enabled pagButton next pagByOne"]', '//div[@class="main hotels"]//div[@class="optCont"]'
    page.launch 'iRON_SIM-LATAM_PREVIAJE_Tegucigalpa', 'http://www.previaje.com/resultado_busqueda.html?search=Tegucigalpa&H&1', '//div[@class="main hotels"]//li[@class="enabled pagButton next pagByOne"]', '//div[@class="main hotels"]//div[@class="optCont"]'
    page.launch 'iRON_SIM-LATAM_EXPEDIA_Buenos Aires', 'http://www.expedia.com/Hotel-Search?action=secondSearch&regionId=6053581&searchString=&inpRegionType=CITY&inpStreet=&inpCityName=&inpState=&inpZip=&inpStartDate=&inpEndDate=&hotelRoomCountInput=1&adultCountInput=2&childCountInput=0&inpStarBuckets=0#c=search&A=HOT.SR.LodgingType.Hotel&d=&I=178242&P=178242|MULTICITYVICINITY|Buenos+Aires+%28and+vicinity%29%2C+Argentina&Q=0|INVALID|&R=&L=428&U=CITY&V=Buenos+Aires+%28and+vicinity%29%2C+Argentina&W=&X=&Y=1&a=2&b=0&D=&F=&Z=1&K=0&M=0&N=0&T=50&ts=1338550219707', '//*[@id="nextpage"]', '//li[@class="results-count"]'
    page.launch 'iRON_SIM-LATAM_EXPEDIA_Tegucigalpa', 'http://www.expedia.com/Hotel-Search?action=newSearch&inpRfrrId=-56564#A=HOT.SR.LodgingType.Hotel&inpRoomAvailsOpenedState=&D=&E=Tegucigalpa%2C+Honduras&d=&F=&Z=1&K=0&M=0&N=0&T=50&ts=1340019352571', '//*[@id="nextpage"]', '//li[@class="results-count"]'
    page.launch 'iRON_SIM-LATAM_VENERE_Buenos Aires', 'http://www.venere.com/es/argentina/buenos-aires/#p|1;f:o|venere_ranking-t|C-z|all_areas-r|r6-c|all_rate', '//*[@id="next"]', '//*[@id="paging_bottom"]'
    page.launch 'iRON_SIM-LATAM_VENERE_Tegucigalpa', 'http://www.venere.com/es/honduras/tegucigalpa/#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next"]', '//*[@id="paging_bottom"]'
    page.launch 'iRON_SIM-LATAM_TRIVAGO_Buenos Aires', 'http://www.trivago.es/region.php?query_path_name=Buenos%20Aires&dealform_hotel_from_date=Do%2C%2024%2F06%2F12&dealform_hotel_to_date=Lu%2C%2025%2F06%2F12&room_type=7&javascript=1&from_day=24&from_month=6&from_year=12&to_day=25&to_month=6&to_year=12&dealform_referer=2&timestamp=1338983253&path=93122&view_type=0&dealform_typelog=0Buenos%20Aires&item=0&pagetype=hotels#price_region:%22request_ident=&url_hash=b54911813618d5fa6561c7a04b076885&path=93122&date_range::from=1340488800&date_range::to=1340575200&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=relevance%20desc&view_type=0&geo_use_distance=0&f_160=1&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-58.417309&geo_code::latitude=-34.611782&timestamp=1338983253&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em', '//*[@id="hotellistbottom"]'
    page.launch 'iRON_SIM-LATAM_TRIVAGO_Tegucigalpa', 'http://www.trivago.es/region.php?query_path_name=Tegucigalpa%20%28Distrito%20Central%29&dealform_hotel_from_date=Do%2C%2024%2F06%2F12&dealform_hotel_to_date=Lu%2C%2025%2F06%2F12&room_type=7&javascript=1&from_day=24&from_month=6&from_year=12&to_day=25&to_month=6&to_year=12&dealform_referer=2&timestamp=1338995083&path=84541&view_type=0&dealform_typelog=0TEGUCIGALPA&item=0&pagetype=hotels#price_region:%22request_ident=&url_hash=a9d99b5e739b6dc0893b3e374c5ff53b&path=84541&date_range::from=1340488800&date_range::to=1340575200&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=distance%20asc&view_type=0&geo_use_distance=1&geo_distance_limit=20000&f_160=1&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-87.177284&geo_code::latitude=14.111230&timestamp=1338995083&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em', '//*[@id="hotellistbottom"]'
    page.launch 'iRON_SIM-LATAM_HOTELS_Buenos Aires', 'http://www.hoteles.com/search.do?destination=Buenos+Aires%2C+Argentina&searchParams.arrivalDate=&searchParams.departureDate=&rooms=1&searchParams.rooms[0].numberOfAdults=2&children[0]=0&asaReport=HomePage%3A%3ACity&destinationId=14534&searchParams.landmark=&hotelId=#vt=LIST&rl=destination%3A14534%3APROVIDED%3APROVIDED&pfm=1&dn=Buenos+Aires,+Argentina&nr=1&pn=1&so=BEST_SELLER&pfcc=EUR&ptid=1&r=2&cpr=0', '', ''
    page.launch 'iRON_SIM-LATAM_HOTELS_Tegucigalpa', 'http://www.hoteles.com/search.do?destination=Tegucigalpa%2C+Honduras&searchParams.arrivalDate=&searchParams.departureDate=&rooms=1&searchParams.rooms[0].numberOfAdults=2&children[0]=0&asaReport=HomePage%3A%3ACity&destinationId=614869&searchParams.landmark=&hotelId=#vt=LIST&rl=destination%3A614869%3APROVIDED%3APROVIDED&pfm=1&dn=Tegucigalpa,+Honduras&nr=1&pn=1&so=BEST_SELLER&pfcc=EUR&ptid=1&r=2&cpr=0', '', ''
    page.launch 'iRON_SIM-LATAM_TRAVELOCITY_Buenos Aires', 'http://www.travelocity.com/trips/hotellist/datelessList?ac_country=AR&city=Buenos+Aires&configId=S21949757&numRooms=1&path=hotels&pTxId=2278724&guestCodes=ADULT&guestCounts=1&hotelMaxReturnPerPage=25&startIndex=0', '(//a[@class="nextLink"])[1]', '//div[@class="products"]/div[starts-with(@class,"product")]'
    page.launch 'iRON_SIM-LATAM_TRAVELOCITY_Tegucigalpa', 'http://www.travelocity.com/trips/hotellist/datelessList?ac_country=HN&city=Tegucigalpa&configId=S21949757&numRooms=1&path=hotels&pTxId=3722180&guestCodes=ADULT&guestCounts=1&hotelMaxReturnPerPage=25&startIndex=0', '(//a[@class="nextLink"])[1]', '//div[@class="products"]/div[starts-with(@class,"product")]'
  end
end

Then /^QBot should get a snapshot$/ do

end
