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
    
    page.launch idLaunch, 'BOOKING_HotelList.Barcelona', 'http://www.booking.com/searchresults.es.html?order=name;rows=50;city=-372490', '//*[@id="ajaxsrwrap"]/div/a[starts-with(@class,"paging-next")]', '//*[@id="footernote"]', ''

     
  end
  
end

Then /^QBot should get a snapshot$/ do

end
