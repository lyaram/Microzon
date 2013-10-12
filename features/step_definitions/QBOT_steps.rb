# coding: utf-8

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

 #$DEBUG = true
 
    page.launch idLaunch,'BOOKING_HotelList.ALICANTE', 'http://www.booking.com/searchresults.html?order=name;rows=50;dest_type=region&dest_id=742', '//*[starts-with(@class,"results-paging")]/*[starts-with(@class,"paging-next")]', '//*[@id="footernote"]', ''
    page.launch idLaunch,'TRIPADVISOR_HotelList.C1.ALICANTE', 'http://www.tripadvisor.es/Hotels-g187524-Alicante_Province_Valencian_Country-Hotels.html?sortOrder=distLow', '//*[@id="pager_bottom"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
    page.launch idLaunch,'TRIPADVISOR_HotelList.C2.ALICANTE', 'http://www.tripadvisor.es/Hotels-g187524-c2-Alicante_Province_Valencian_Country-Hotels.html?sortOrder=distLow', '//*[@id="pager_bottom"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
    page.launch idLaunch,'TRIPADVISOR_HotelList.C3.ALICANTE', 'http://www.tripadvisor.es/Hotels-g187524-c3-Alicante_Province_Valencian_Country-Hotels.html?sortOrder=distLow', '//*[@id="pager_bottom"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
    page.launch idLaunch,'BOOKING_HotelList.CASTELLON', 'https://www.booking.com/searchresults.html?order=name;rows=50;dest_type=region&dest_id=1520', '//*[starts-with(@class,"results-paging")]/*[starts-with(@class,"paging-next")]', '//*[@id="footernote"]', ''
    page.launch idLaunch,'TRIPADVISOR_HotelList.C1.CASTELLON', 'http://www.tripadvisor.es/Hotels-g1064289-Castellon_Province_Valencian_Country-Hotels.html?sortOrder=distLow', '//*[@id="pager_bottom"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
    page.launch idLaunch,'TRIPADVISOR_HotelList.C2.CASTELLON', 'http://www.tripadvisor.es/Hotels-g1064289-c2-Castellon_Province_Valencian_Country-Hotels.html?sortOrder=distLow', '//*[@id="pager_bottom"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
    page.launch idLaunch,'TRIPADVISOR_HotelList.C3.CASTELLON', 'http://www.tripadvisor.es/Hotels-g1064289-c3-Castellon_Province_Valencian_Country-Hotels.html?sortOrder=distLow', '//*[@id="pager_bottom"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
    page.launch idLaunch,'BOOKING_HotelList.VALENCIA', 'http://www.booking.com/searchresults.html?order=name;rows=50;dest_type=region&dest_id=779', '//*[starts-with(@class,"results-paging")]/*[starts-with(@class,"paging-next")]', '//*[@id="footernote"]', ''
    page.launch idLaunch,'TRIPADVISOR_HotelList.C1.VALENCIA', 'http://www.tripadvisor.es/Hotels-g1117466-Valencia_Province_Valencian_Country-Hotels.html?sortOrder=distLow', '//*[@id="pager_bottom"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
    page.launch idLaunch,'TRIPADVISOR_HotelList.C2.VALENCIA', 'http://www.tripadvisor.es/Hotels-g1117466-c2-Valencia_Province_Valencian_Country-Hotels.html?sortOrder=distLow', '//*[@id="pager_bottom"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
    page.launch idLaunch,'TRIPADVISOR_HotelList.C3.VALENCIA', 'http://www.tripadvisor.es/Hotels-g1117466-c3-Valencia_Province_Valencian_Country-Hotels.html?sortOrder=distLow', '//*[@id="pager_bottom"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''

     
  end
  
end

Then /^QBot should get a snapshot$/ do

end
