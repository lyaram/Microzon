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
    
    #idLaunch = "000000040"
    idLaunch = page.getLaunch
    
    page.launch idLaunch, 'ATRAPALO_HotelList.Lleida', 'http://www.atrapalo.com/hoteles/europa/espana/lleida/' , '//*[@id="paginator"]/ul/li[text()=">"]', '//*[@id="content"]//div[@class="box box-paginacion clear"]', ''
    page.launch idLaunch, 'BOOKING_HotelList.Lleida', 'http://www.booking.com/searchresults.es.html?order=name&rows=50&region=763', '//*[@id="ajaxsrwrap"]/div/a[starts-with(@class,"paging-next")]', '//*[@id="footernote"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelList.EST1.Lleida', 'http://www.tripadvisor.es/Hotels-g2431169-Province_of_Lleida_Catalonia-Hotels.html', '//*[@id="pager_bottom"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelList.EST2.Lleida', 'http://www.tripadvisor.es/Hotels-g2431169-c2-Province_of_Lleida_Catalonia-Hotels.html', '//*[@id="pager_bottom"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelList.EST3.Lleida', 'http://www.tripadvisor.es/Hotels-g2431169-c3-Province_of_Lleida_Catalonia-Hotels.html', '//*[@id="pager_bottom"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelList.EST4.Lleida', 'http://www.tripadvisor.es/VacationRentals-g2431169-Reviews-Province_of_Lleida_Catalonia-Vacation_Rentals.html', '//*[@id="pager_bottom"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'ATRAPALO_HotelList.Huesca', 'http://www.atrapalo.com/hoteles/europa/espana/huesca/', '//*[@id="paginator"]/ul/li[text()=">"]', '//*[@id="content"]//div[@class="box box-paginacion clear"]', ''
    page.launch idLaunch, 'BOOKING_HotelList.Huesca', 'http://www.booking.com/searchresults.es.html?order=name&rows=50&region=2078', '//*[@id="ajaxsrwrap"]/div/a[starts-with(@class,"paging-next")]', '//*[@id="footernote"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelList.EST1.Huesca', 'http://www.tripadvisor.es/Hotels-g1238673-Province_of_Huesca_Aragon-Hotels.html', '//*[@id="pager_bottom"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelList.EST2.Huesca', 'http://www.tripadvisor.es/Hotels-g1238673-c2-Province_of_Huesca_Aragon-Hotels.html', '//*[@id="pager_bottom"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelList.EST3.Huesca', 'http://www.tripadvisor.es/Hotels-g1238673-c3-Province_of_Huesca_Aragon-Hotels.html', '//*[@id="pager_bottom"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelList.EST4.Huesca', 'http://www.tripadvisor.es/VacationRentals-g1238673-Reviews-Province_of_Huesca_Aragon-Vacation_Rentals.html', '//*[@id="pager_bottom"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''

     
  end
  
end

Then /^QBot should get a snapshot$/ do

end
