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
    
    page.launch idLaunch,'HOTELS_HotelList.ORENSE', 'http://www.hoteles.com/de1644709/hoteles-orense-area-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.BARCELONA', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Catalunya/Barcelona/Barcelona/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.BARCELONA', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=68021', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.BARCELONA', 'http://www.hoteles.com/de444495/hoteles-barcelona-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''

  end
  
end

Then /^QBot should get a snapshot$/ do

end
