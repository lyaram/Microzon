Given /^QBot is running$/ do
  visit BookingPage
end

When /^QBot is surfing a webpage$/ do
  on NextLinkPage do |page| 

#para subir modificaciones por ftp a amazon, utilizar la carpeta /tmp
#una vez alli, reubicar a la carpeta que sea necesaria
#si ha de ser manipulada, es posible que se necesiten cambios de permisos
#utilizar por ejemplo: sudo chmod ugo+rw launcheslog.xml
#
#
#para ver espacio de disco en uso 
#df -h
#
#para crear estructura de directorios de golpe (ojo con no dejar espacios entre las llaves):
#mkdir -p a/{b1,b2} 
#
#contar ficheros dentro de una carpeta y subcarpetas:
#find . -type f | wc -l
#
#crear un fichero tipo bat:
# - crear un fichero con cualquier extension
# - añadirle los comandos
# - guardarlo y cambiarlo a tipo ejecutable con: chmod 755 <nombrefichero>
# - lanzar ejecucion con bash <nombrefichero>

    #idLaunch = page.getLaunch
    #idLaunch='00000006'

    #idLaunch = page.getLaunch
    #page.launch idLaunch,'VENERE_HotelList.Buenos Aires', 'http://www.venere.com/esff/argentina/buenos-aires/#p|1;f:o|venere_ranking-t|C-z|all_areas-r|r6-c|all_rate', '//*[@id="next" and @class="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    #page.launch idLaunch,'VENERE_HotelList.Tegucigalpa', 'http://www.venere.com/es/honduras/tegucigalpa/#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next" and @class="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'

    #idLaunchTRIVAGO = page.getLaunch
    #idLaunchEXPEDIA = page.getLaunch
    #idLaunchVENERE = page.getLaunch
    
    #idLaunch = "00000058"
    idLaunch = page.getLaunch
    
    page.launch idLaunch,'TRIVAGO_RestList.TERUEL', 'http://www.trivago.es/teruel-31622/hotel#price_region:%22request_ident=&url_hash=3cb20ace224bf520bd3c34adf8f521ed&path=31622&date_range::from=1344117600&date_range::to=1344204000&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=relevance%20desc&view_type=0&geo_use_distance=1&geo_distance_limit=5000&f_161=0&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-1.106910&geo_code::latitude=40.344109&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'VENERE_RestList.TERUEL', 'http://www.venere.com/es/espana/teruel/?ref=11685#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next" and @class="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'TRIVAGO_RestList.TOLEDO', 'http://www.trivago.es/toledo-31961/hotel#price_region:%22request_ident=&url_hash=70ffacdb5f56fcc6d1783c5255941b82&path=31961&date_range::from=1344117600&date_range::to=1344204000&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=relevance%20desc&view_type=0&geo_use_distance=1&geo_distance_limit=5000&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-4.030006&geo_code::latitude=39.860012&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'VENERE_RestList.TOLEDO', 'http://www.venere.com/es/espana/toledo/?ref=11685#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next" and @class="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'TRIVAGO_RestList.VALENCIA', 'http://www.trivago.es/valencia-73129/hotel#price_region:%22request_ident=&url_hash=e1a8f8877e35e412e2b44b35e3ffa335&path=73129&date_range::from=1344117600&date_range::to=1344204000&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=relevance%20desc&view_type=0&geo_use_distance=1&geo_distance_limit=5000&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-0.378974&geo_code::latitude=39.474049&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'VENERE_RestList.VALENCIA', 'http://www.venere.com/es/espana/valencia/?ref=11685', '//*[@id="next" and @class="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'TRIVAGO_RestList.VALLADOLID', 'http://www.trivago.es/valladolid-31953/hotel#price_region:%22request_ident=&url_hash=b8a7904d45878560931301ae26df651b&path=31953&date_range::from=1344117600&date_range::to=1344204000&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=relevance%20desc&view_type=0&geo_use_distance=1&geo_distance_limit=5000&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-4.728388&geo_code::latitude=41.652946&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'VENERE_RestList.VALLADOLID', 'http://www.venere.com/es/espana/valladolid/?ref=11685#p|1;f:o|venere_ranking-t|all-z|-r|r6-c|all_rate', '//*[@id="next" and @class="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'TRIVAGO_RestList.VIGO', 'http://www.trivago.es/vigo-73268/hotel#price_region:%22request_ident=&url_hash=cacaf309116c382f2c02efd953127122&path=73268&date_range::from=1344117600&date_range::to=1344204000&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=relevance%20desc&view_type=0&geo_use_distance=1&geo_distance_limit=5000&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-8.712447&geo_code::latitude=42.231358&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'VENERE_RestList.VIGO', 'http://www.venere.com/es/espana/vigo/?ref=11685#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next" and @class="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'TRIVAGO_RestList.VITORIA', 'http://www.trivago.es/vitoria-31765/hotel#price_region:%22request_ident=&url_hash=4b730c7f5f2f1e9e4ac6e4bd34e0e65e&path=31765&date_range::from=1344117600&date_range::to=1344204000&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=relevance%20desc&view_type=0&geo_use_distance=1&geo_distance_limit=5000&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-2.671600&geo_code::latitude=42.846699&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'VENERE_RestList.VITORIA', 'http://www.venere.com/es/espana/vitoria-gasteiz/?ref=11685#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next" and @class="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'TRIVAGO_RestList.ZAMORA', 'http://www.trivago.es/zamora-31954/hotel#price_region:%22request_ident=&url_hash=0c20bf26277182586b53cf4d313ffd03&path=31954&date_range::from=1344117600&date_range::to=1344204000&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=distance%20asc&view_type=0&geo_use_distance=1&geo_distance_limit=5000&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-5.746279&geo_code::latitude=41.503345&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'VENERE_RestList.ZAMORA', 'http://www.venere.com/es/espana/zamora/?ref=11685#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next" and @class="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'TRIVAGO_RestList.ZARAGOZA', 'http://www.trivago.es/zaragoza-31623/hotel#price_region:%22request_ident=&url_hash=26b19eaea43c43814c85c2ddf46d45de&path=31623&date_range::from=1344117600&date_range::to=1344204000&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=relevance%20desc&view_type=0&geo_use_distance=1&geo_distance_limit=5000&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-0.885600&geo_code::latitude=41.647099&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'VENERE_RestList.ZARAGOZA', 'http://www.venere.com/es/espana/zaragoza/?ref=11685#p|1;f:o|venere_ranking-t|all-z|-r|r6-c|all_rate', '//*[@id="next" and @class="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'

  end
  
end

Then /^QBot should get a snapshot$/ do

end
