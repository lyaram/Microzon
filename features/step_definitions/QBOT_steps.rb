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
    
    page.launch idLaunch,'HOTELS_RestList.ORENSE', 'http://www.hoteles.com/de-p1/hoteles/pagina-1/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'TRIVAGO_RestList.ORENSE', 'http://www.trivago.es/ourense-31775/hotel#price_region:%22request_ident=&url_hash=73d2595e2497fe985ade59ba83b3b07d&path=31775&date_range::from=1344117600&date_range::to=1344204000&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=distance%20asc&view_type=0&geo_use_distance=1&geo_distance_limit=5000&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=-7.864641&geo_code::latitude=42.340008&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'VENERE_RestList.ORENSE', 'http://www.venere.com/es/espana/ourense/?ref=11685#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next" and @class="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'HOTELS_RestList.BARCELONA', 'http://www.hoteles.com/de-p1/hoteles/pagina-1/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'TRIVAGO_RestList.BARCELONA', 'http://www.trivago.es/barcelona-31965/hotel#price_region:%22request_ident=&url_hash=148d003a61c640eed5ca7114795f9596&path=31965&date_range::from=1344117600&date_range::to=1344204000&room_type=7&offset=0&do_available_search=true&include_all=1&order_by=relevance%20desc&view_type=0&geo_use_distance=1&geo_distance_limit=5000&category_range=0,1,2,3,4,5&category_search_condition=0&limit=25&geo_code::longitude=2.170045&geo_code::latitude=41.387020&overall_liking=0,1,2,3,4&sem_headline=0%22', '//*[@id="hotellistbottom"]/em[./text()=">"]', '//*[@id="hotellistitems"]/div/div[@class="hotellistitem" and position()=last()]', ''
    page.launch idLaunch,'VENERE_RestList.BARCELONA', 'http://www.venere.com/es/espana/barcelona/?ref=11685#p|1;f:o|venere_ranking-t|all-z|all_areas-r|r6-c|all_rate', '//*[@id="next" and @class="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'

  end
  
end

Then /^QBot should get a snapshot$/ do

end
