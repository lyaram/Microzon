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
    
    page.launch idLaunch,'HOTELSCOMBINED_HotelList.BARCELONA', 'http://www.hotelscombined.com/ES/City/Barcelona_1.htm#languageCode=ES&currencyCode=EUR&destination=city:Barcelona&radius=0km&Rooms=1&adults_1=1&pageSize=25&pageIndex=0&sort=Popularity-desc&showSoldOut=true&propertyType=0&view=hc_sr_summary&scroll=1368&open=3,2,1,4,7,6&mapstate=contracted', '//*[@id="pagination"]//a[@class="hc_sr_paging_next" and not(.././preceding-sibling::li[1]/@class)]', '//*[@id="hc_r_ft"]', ''
    page.launch idLaunch,'HOTELSEARCH_HotelList.BARCELONA', 'http://www.hotelsearch.com/hotels/europa/espana/cataluna/barcelona/753692.es.html#listView', '//a[@class="next_page"]', '//*[@id="footer"]', ''
    page.launch idLaunch,'QUEHOTELES_HotelList.BARCELONA', 'http://www.quehoteles.com/hoteles-en-barcelona-4C15P116D210Z.htm', '(//a[@class="sig"])[1]', '//span[@class="bottom"]', ''

  end
  
end

Then /^QBot should get a snapshot$/ do

end
