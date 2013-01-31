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
    
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.ORENSE', 'http://www.holidaycheck.com/city-travel+information_Orense-oid_2409.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="ivw"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.ORENSE', 'http://www.hotelopia.es/espana/ourense/ourense-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.ORENSE', 'http://www.laterooms.com/es/r30048_hoteles-orense.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.A_CORUNA', 'http://www.holidaycheck.com/city-travel+information_A+Coruna-oid_2361.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="ivw"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.A_CORUNA', 'http://www.hotelopia.es/espana/a-coruna-provincia/a-coruna-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.A_CORUNA', 'http://www.laterooms.com/es/k16865584_hoteles-a-coruna.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''


  end
  
end

Then /^QBot should get a snapshot$/ do

end
