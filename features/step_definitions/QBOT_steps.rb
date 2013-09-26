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

    page.launch idLaunch,'ATRAPALO_RestList.CACERES', 'http://www.atrapalo.com/restaurantes/caceres_d23.html', '//*[@id="resultados_restaurantes"]//a[@title="Siguiente"]', '//div[@id="resultados_restaurantes"]//div[@id="paginator"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.CACERES', 'http://www.buscorestaurantes.com/Restaurantes-en-Caceres', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'RESTALO_RestList.CACERES', 'http://www.restalo.es/restaurantes-caceres', '//div[@id="pagerContainerList"]/ul[@id="pager"]/li[@class="next"]/a', '//div[@id="pagerContainerList"]', ''
    page.launch idLaunch,'SALIR_RestList.CACERES', 'http://www.salir.com/caceres/restaurantes', '//*[@id="itemList"]//a[@class="siguiente linkPaginador"]', '//div[@class="footer"]', ''
    page.launch idLaunch,'TRIPADVISOR_RestList.CACERES', 'http://www.tripadvisor.es/Restaurants-g2435893-Province_of_Caceres_Extremadura.html', '//*[@id="EATERY_LIST_CONTENTS"]//a[contains(@class,"sprite-pageNext")]', '//*[@id="EATERY_LIST_CONTENTS"]', ''
    page.launch idLaunch,'VEREMA_RestList.CACERES', 'http://www.verema.com/restaurantes/spain/caceres', '//*[@class="pagination"]/*[@class="next_page"]', '//*[@id="cuerpo_footer"]', ''


     
  end
  
end

Then /^QBot should get a snapshot$/ do

end
