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
    #page.launch idLaunch,'VENERE_HotelList.Buenos Aires', 'http://www.venere.com/es/argentina/buenos-aires/#p|1;f:o|venere_ranking-t|C-z|all_areas-r|r6-c|all_rate', '//*[@id="next" and @class="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    #page.launch idLaunch,'VENERE_HotelList.Tegucigalpa', 'http://www.venere.com/es/honduras/tegucigalpa/#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next" and @class="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'

    #idLaunchTRIVAGO = page.getLaunch
    #idLaunchEXPEDIA = page.getLaunch
    #idLaunchVENERE = page.getLaunch
    
    #idLaunch = "00000058"
    idLaunch = page.getLaunch
    
    page.launch idLaunch,'HOTELS_HotelList.Repesca01-p1.Asuncion', 'http://www.hoteles.com/de1074006-p1/hoteles/pagina-1/', '', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'HOTELS_HotelList.Repesca01-p2.Asuncion', 'http://www.hoteles.com/de1074006-p2/hoteles/pagina-2/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'HOTELS_HotelList.Repesca01-p1.Brasilia', 'http://www.hoteles.com/de159541-p1/hoteles/pagina-1/', '', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'HOTELS_HotelList.Repesca01-p2.Brasilia', 'http://www.hoteles.com/de159541-p2/hoteles/pagina-2/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'HOTELS_HotelList.Repesca01-p1.Caracas', 'http://www.hoteles.com/de1544334-p1/hoteles/pagina-1/', '', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'HOTELS_HotelList.Repesca01-p2.Caracas', 'http://www.hoteles.com/de1544334-p2/hoteles/pagina-2/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'HOTELS_HotelList.Repesca01-p1.La Paz', 'http://www.hoteles.com/de132364-p1/hoteles/pagina-1/', '', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'HOTELS_HotelList.Repesca01-p2.La Paz', 'http://www.hoteles.com/de132364-p2/hoteles/pagina-2/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'HOTELS_HotelList.Repesca01.Montevideo', 'http://www.hoteles.com/de1399507-p1/hoteles/pagina-1/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''

  end
  
end

Then /^QBot should get a snapshot$/ do

end
