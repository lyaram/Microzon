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
    
    page.launch idLaunch,'EDREAMS_RestList.BARCELONA', 'http://hotels.edreams.es/searchresults.es.html?order=name;rows=50;city=-372490', '//td[@class="next"]/a', '//*[@id="footernote"]', ''
    page.launch idLaunch,'ATRAPALO_RestList.BARCELONA', 'http://www.atrapalo.com/hoteles/europa/espana/barcelona/barcelona/', '//*[@id='paginator']/ul/li[text()='>']', '//div[@class="pagerResultsBox margintop10"]', ''
    page.launch idLaunch,'BOOKING_RestList.BARCELONA', 'http://www.booking.com/searchresults.es.html?order=name;rows=50;city=-372490', '//td[@class="next"]/a', '//*[@id="footernote"]', ''
    page.launch idLaunch,'TRIPADVISOR_RestList.BARCELONA', 'http://www.tripadvisor.es/Hotels-g187497-Barcelona_Catalonia-Hotels.html', '//*[@id="pager_bottom"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
    page.launch idLaunch,'EDREAMS_RestList.ORENSE', 'http://hotels.edreams.es/searchresults.es.html?order=name;rows=50;city=-394670', '//td[@class="next"]/a', '//*[@id="footernote"]', ''
    page.launch idLaunch,'ATRAPALO_RestList.ORENSE', 'http://www.atrapalo.com/hoteles/europa/espana/orense/orense/', '//*[@id='paginator']/ul/li[text()='>']', '//div[@class="pagerResultsBox margintop10"]', ''
    page.launch idLaunch,'BOOKING_RestList.ORENSE', 'http://www.booking.com/searchresults.es.html?order=name;rows=50;city=-394670', '//td[@class="next"]/a', '//*[@id="footernote"]', ''
    page.launch idLaunch,'TRIPADVISOR_RestList.ORENSE', 'http://www.tripadvisor.es/Hotels-g644337-Ourense_Ourense_Province_Galicia-Hotels.html', '//*[@id="pager_bottom"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''

  end
  
end

Then /^QBot should get a snapshot$/ do

end
