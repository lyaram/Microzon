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

    page.launch idLaunch,'TRIPADVISOR_RestList.MALAGA', 'http://www.tripadvisor.es/Restaurants-g187435-Costa_del_Sol_Andalusia.html', '//*[@id="EATERY_LIST_CONTENTS"]//a[contains(@class,"sprite-pageNext")]', '//*[@id="EATERY_LIST_CONTENTS"]', ''
    page.launch idLaunch,'VEREMA_RestList.MALAGA', 'http://www.verema.com/restaurantes/spain/malaga', '//*[@class="pagination"]/*[@class="next_page"]', '//*[@id="cuerpo_footer"]', ''
    page.launch idLaunch,'ATRAPALO_RestList.MALLORCA', 'http://www.atrapalo.com/restaurantes/mallorca_d55.html', '//*[@id="resultados_restaurantes"]//a[@title="Siguiente"]', '//div[@id="resultados_restaurantes"]//div[@id="paginator"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.MALLORCA', 'http://www.buscorestaurantes.com/Restaurantes-en-mallorca-isla', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'RESTALO_RestList.MALLORCA', 'http://www.restalo.es/restaurantes-islas-baleares/ciudad-palma-de-mallorca/', '//div[@id="pagerContainerList"]/ul[@id="pager"]/li[@class="next"]/a', '//div[@id="pagerContainerList"]', ''
    page.launch idLaunch,'SALIR_RestList.MALLORCA', 'http://www.salir.com/islas_baleares/restaurantes', '//*[@id="itemList"]//a[@class="siguiente linkPaginador"]', '//div[@class="footer"]', ''
    page.launch idLaunch,'TRIPADVISOR_RestList.MALLORCA', 'http://www.tripadvisor.es/Restaurants-g187462-Majorca_Balearic_Islands.html', '//*[@id="EATERY_LIST_CONTENTS"]//a[contains(@class,"sprite-pageNext")]', '//*[@id="EATERY_LIST_CONTENTS"]', ''
    page.launch idLaunch,'VEREMA_RestList.MALLORCA', 'http://www.verema.com/restaurantes/spain/baleares', '//*[@class="pagination"]/*[@class="next_page"]', '//*[@id="cuerpo_footer"]', ''
    page.launch idLaunch,'ATRAPALO_RestList.MURCIA', 'http://www.atrapalo.com/restaurantes/murcia_d39.html', '//*[@id="resultados_restaurantes"]//a[@title="Siguiente"]', '//div[@id="resultados_restaurantes"]//div[@id="paginator"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.MURCIA', 'http://www.buscorestaurantes.com/Restaurantes-en-Murcia', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'RESTALO_RestList.MURCIA', 'http://www.restalo.es/restaurantes-murcia', '//div[@id="pagerContainerList"]/ul[@id="pager"]/li[@class="next"]/a', '//div[@id="pagerContainerList"]', ''
    page.launch idLaunch,'SALIR_RestList.MURCIA', 'http://www.salir.com/murcia/restaurantes', '//*[@id="itemList"]//a[@class="siguiente linkPaginador"]', '//div[@class="footer"]', ''
    page.launch idLaunch,'TRIPADVISOR_RestList.MURCIA', 'http://www.tripadvisor.es/Restaurants-g187516-Region_of_Murcia.html', '//*[@id="EATERY_LIST_CONTENTS"]//a[contains(@class,"sprite-pageNext")]', '//*[@id="EATERY_LIST_CONTENTS"]', ''
    page.launch idLaunch,'VEREMA_RestList.MURCIA', 'http://www.verema.com/restaurantes/spain/murcia', '//*[@class="pagination"]/*[@class="next_page"]', '//*[@id="cuerpo_footer"]', ''
    page.launch idLaunch,'ATRAPALO_RestList.NAVARRA', 'http://www.atrapalo.com/restaurantes/navarra_d15.html', '//*[@id="resultados_restaurantes"]//a[@title="Siguiente"]', '//div[@id="resultados_restaurantes"]//div[@id="paginator"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.NAVARRA', 'http://www.buscorestaurantes.com/Restaurantes-en-Navarra', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'RESTALO_RestList.NAVARRA', 'http://www.restalo.es/restaurantes-navarra', '//div[@id="pagerContainerList"]/ul[@id="pager"]/li[@class="next"]/a', '//div[@id="pagerContainerList"]', ''
    page.launch idLaunch,'SALIR_RestList.NAVARRA', 'http://www.salir.com/navarra/restaurantes', '//*[@id="itemList"]//a[@class="siguiente linkPaginador"]', '//div[@class="footer"]', ''
    page.launch idLaunch,'TRIPADVISOR_RestList.NAVARRA', 'http://www.tripadvisor.es/Restaurants-g187519-Navarra.html', '//*[@id="EATERY_LIST_CONTENTS"]//a[contains(@class,"sprite-pageNext")]', '//*[@id="EATERY_LIST_CONTENTS"]', ''
    page.launch idLaunch,'VEREMA_RestList.NAVARRA', 'http://www.verema.com/restaurantes/spain/navarra', '//*[@class="pagination"]/*[@class="next_page"]', '//*[@id="cuerpo_footer"]', ''
    page.launch idLaunch,'ATRAPALO_RestList.PONTEVEDRA', 'http://www.atrapalo.com/restaurantes/pontevedra_d21.html', '//*[@id="resultados_restaurantes"]//a[@title="Siguiente"]', '//div[@id="resultados_restaurantes"]//div[@id="paginator"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.PONTEVEDRA', 'http://www.buscorestaurantes.com/Restaurantes-en-Pontevedra', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'RESTALO_RestList.PONTEVEDRA', 'http://www.restalo.es/restaurantes-pontevedra', '//div[@id="pagerContainerList"]/ul[@id="pager"]/li[@class="next"]/a', '//div[@id="pagerContainerList"]', ''
    page.launch idLaunch,'SALIR_RestList.PONTEVEDRA', 'http://www.salir.com/pontevedra/restaurantes', '//*[@id="itemList"]//a[@class="siguiente linkPaginador"]', '//div[@class="footer"]', ''
    page.launch idLaunch,'TRIPADVISOR_RestList.PONTEVEDRA', 'http://www.tripadvisor.es/Restaurants-g1768743-Pontevedra_Province_Galicia.html', '//*[@id="EATERY_LIST_CONTENTS"]//a[contains(@class,"sprite-pageNext")]', '//*[@id="EATERY_LIST_CONTENTS"]', ''
    page.launch idLaunch,'VEREMA_RestList.PONTEVEDRA', 'http://www.verema.com/restaurantes/spain/pontevedra', '//*[@class="pagination"]/*[@class="next_page"]', '//*[@id="cuerpo_footer"]', ''
    page.launch idLaunch,'ATRAPALO_RestList.SALAMANCA', 'http://www.atrapalo.com/restaurantes/salamanca_d27.html', '//*[@id="resultados_restaurantes"]//a[@title="Siguiente"]', '//div[@id="resultados_restaurantes"]//div[@id="paginator"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.SALAMANCA', 'http://www.buscorestaurantes.com/Restaurantes-en-Salamanca', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'RESTALO_RestList.SALAMANCA', 'http://www.restalo.es/restaurantes-salamanca', '//div[@id="pagerContainerList"]/ul[@id="pager"]/li[@class="next"]/a', '//div[@id="pagerContainerList"]', ''
    page.launch idLaunch,'SALIR_RestList.SALAMANCA', 'http://www.salir.com/salamanca/restaurantes', '//*[@id="itemList"]//a[@class="siguiente linkPaginador"]', '//div[@class="footer"]', ''
    page.launch idLaunch,'TRIPADVISOR_RestList.SALAMANCA', 'http://www.tripadvisor.es/Restaurants-g2374662-Province_of_Salamanca_Castile_and_Leon.html', '//*[@id="EATERY_LIST_CONTENTS"]//a[contains(@class,"sprite-pageNext")]', '//*[@id="EATERY_LIST_CONTENTS"]', ''
    page.launch idLaunch,'VEREMA_RestList.SALAMANCA', 'http://www.verema.com/restaurantes/spain/salamanca', '//*[@class="pagination"]/*[@class="next_page"]', '//*[@id="cuerpo_footer"]', ''
    page.launch idLaunch,'ATRAPALO_RestList.SEGOVIA', 'http://www.atrapalo.com/restaurantes/segovia_d30.html', '//*[@id="resultados_restaurantes"]//a[@title="Siguiente"]', '//div[@id="resultados_restaurantes"]//div[@id="paginator"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.SEGOVIA', 'http://www.buscorestaurantes.com/Restaurantes-en-Segovia', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'RESTALO_RestList.SEGOVIA', 'http://www.restalo.es/restaurantes-segovia', '//div[@id="pagerContainerList"]/ul[@id="pager"]/li[@class="next"]/a', '//div[@id="pagerContainerList"]', ''
    page.launch idLaunch,'SALIR_RestList.SEGOVIA', 'http://www.salir.com/segovia/restaurantes', '//*[@id="itemList"]//a[@class="siguiente linkPaginador"]', '//div[@class="footer"]', ''
    page.launch idLaunch,'TRIPADVISOR_RestList.SEGOVIA', 'http://www.tripadvisor.es/Restaurants-g1934720-Segovia_Province_Castile_and_Leon.html', '//*[@id="EATERY_LIST_CONTENTS"]//a[contains(@class,"sprite-pageNext")]', '//*[@id="EATERY_LIST_CONTENTS"]', ''
    page.launch idLaunch,'VEREMA_RestList.SEGOVIA', 'http://www.verema.com/restaurantes/spain/segovia', '//*[@class="pagination"]/*[@class="next_page"]', '//*[@id="cuerpo_footer"]', ''
    page.launch idLaunch,'ATRAPALO_RestList.SEVILLA', 'http://www.atrapalo.com/restaurantes/sevilla_d46.html', '//*[@id="resultados_restaurantes"]//a[@title="Siguiente"]', '//div[@id="resultados_restaurantes"]//div[@id="paginator"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.SEVILLA', 'http://www.buscorestaurantes.com/Restaurantes-en-Sevilla', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'RESTALO_RestList.SEVILLA', 'http://www.restalo.es/restaurantes-sevilla', '//div[@id="pagerContainerList"]/ul[@id="pager"]/li[@class="next"]/a', '//div[@id="pagerContainerList"]', ''
    page.launch idLaunch,'SALIR_RestList.SEVILLA', 'http://www.salir.com/sevilla/restaurantes', '//*[@id="itemList"]//a[@class="siguiente linkPaginador"]', '//div[@class="footer"]', ''
    page.launch idLaunch,'TRIPADVISOR_RestList.SEVILLA', 'http://www.tripadvisor.es/Restaurants-g2361626-Province_of_Seville_Andalucia.html', '//*[@id="EATERY_LIST_CONTENTS"]//a[contains(@class,"sprite-pageNext")]', '//*[@id="EATERY_LIST_CONTENTS"]', ''
    page.launch idLaunch,'VEREMA_RestList.SEVILLA', 'http://www.verema.com/restaurantes/spain/sevilla', '//*[@class="pagination"]/*[@class="next_page"]', '//*[@id="cuerpo_footer"]', ''
    page.launch idLaunch,'ATRAPALO_RestList.TARRAGONA', 'http://www.atrapalo.com/restaurantes/tarragona_d462.html', '//*[@id="resultados_restaurantes"]//a[@title="Siguiente"]', '//div[@id="resultados_restaurantes"]//div[@id="paginator"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.TARRAGONA', 'http://www.buscorestaurantes.com/Restaurantes-en-Tarragona', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'RESTALO_RestList.TARRAGONA', 'http://www.restalo.es/restaurantes-tarragona', '//div[@id="pagerContainerList"]/ul[@id="pager"]/li[@class="next"]/a', '//div[@id="pagerContainerList"]', ''
    page.launch idLaunch,'SALIR_RestList.TARRAGONA', 'http://www.salir.com/tarragona/restaurantes', '//*[@id="itemList"]//a[@class="siguiente linkPaginador"]', '//div[@class="footer"]', ''
    page.launch idLaunch,'TRIPADVISOR_RestList.TARRAGONA', 'http://www.tripadvisor.es/Restaurants-g2431170-Province_of_Tarragona_Catalonia.html', '//*[@id="EATERY_LIST_CONTENTS"]//a[contains(@class,"sprite-pageNext")]', '//*[@id="EATERY_LIST_CONTENTS"]', ''
    page.launch idLaunch,'VEREMA_RestList.TARRAGONA', 'http://www.verema.com/restaurantes/spain/tarragona', '//*[@class="pagination"]/*[@class="next_page"]', '//*[@id="cuerpo_footer"]', ''
    page.launch idLaunch,'ATRAPALO_RestList.TENERIFE', 'http://www.atrapalo.com/restaurantes/tenerife_d67.html', '//*[@id="resultados_restaurantes"]//a[@title="Siguiente"]', '//div[@id="resultados_restaurantes"]//div[@id="paginator"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.TENERIFE', 'http://www.buscorestaurantes.com/Restaurantes-en-Tenerife-isla', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'RESTALO_RestList.TENERIFE', 'http://www.restalo.es/restaurantes-santa-cruz-de-tenerife', '//div[@id="pagerContainerList"]/ul[@id="pager"]/li[@class="next"]/a', '//div[@id="pagerContainerList"]', ''
    page.launch idLaunch,'SALIR_RestList.TENERIFE', 'http://www.salir.com/tenerife/restaurantes', '//*[@id="itemList"]//a[@class="siguiente linkPaginador"]', '//div[@class="footer"]', ''
    page.launch idLaunch,'TRIPADVISOR_RestList.TENERIFE', 'http://www.tripadvisor.es/Restaurants-g187479-Tenerife_Canary_Islands.html', '//*[@id="EATERY_LIST_CONTENTS"]//a[contains(@class,"sprite-pageNext")]', '//*[@id="EATERY_LIST_CONTENTS"]', ''
    page.launch idLaunch,'VEREMA_RestList.TENERIFE', 'http://www.verema.com/restaurantes/spain/tenerife', '//*[@class="pagination"]/*[@class="next_page"]', '//*[@id="cuerpo_footer"]', ''
    page.launch idLaunch,'ATRAPALO_RestList.TOLEDO', 'http://www.atrapalo.com/restaurantes/toledo_d38.html', '//*[@id="resultados_restaurantes"]//a[@title="Siguiente"]', '//div[@id="resultados_restaurantes"]//div[@id="paginator"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.TOLEDO', 'http://www.buscorestaurantes.com/Restaurantes-en-Toledo', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'RESTALO_RestList.TOLEDO', 'http://www.restalo.es/restaurantes-toledo', '//div[@id="pagerContainerList"]/ul[@id="pager"]/li[@class="next"]/a', '//div[@id="pagerContainerList"]', ''
    page.launch idLaunch,'SALIR_RestList.TOLEDO', 'http://www.salir.com/toledo/restaurantes', '//*[@id="itemList"]//a[@class="siguiente linkPaginador"]', '//div[@class="footer"]', ''
    page.launch idLaunch,'TRIPADVISOR_RestList.TOLEDO', 'http://www.tripadvisor.es/Restaurants-g2370231-Province_of_Toledo_Castile_La_Mancha.html', '//*[@id="EATERY_LIST_CONTENTS"]//a[contains(@class,"sprite-pageNext")]', '//*[@id="EATERY_LIST_CONTENTS"]', ''
    page.launch idLaunch,'VEREMA_RestList.TOLEDO', 'http://www.verema.com/restaurantes/spain/toledo', '//*[@class="pagination"]/*[@class="next_page"]', '//*[@id="cuerpo_footer"]', ''
    page.launch idLaunch,'ATRAPALO_RestList.VALENCIA', 'http://www.atrapalo.com/restaurantes/valencia_d41.html', '//*[@id="resultados_restaurantes"]//a[@title="Siguiente"]', '//div[@id="resultados_restaurantes"]//div[@id="paginator"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.VALENCIA', 'http://www.buscorestaurantes.com/Restaurantes-en-Valencia', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'RESTALO_RestList.VALENCIA', 'http://www.restalo.es/restaurantes-valencia', '//div[@id="pagerContainerList"]/ul[@id="pager"]/li[@class="next"]/a', '//div[@id="pagerContainerList"]', ''
    page.launch idLaunch,'SALIR_RestList.VALENCIA', 'http://www.salir.com/valencia/restaurantes', '//*[@id="itemList"]//a[@class="siguiente linkPaginador"]', '//div[@class="footer"]', ''
    page.launch idLaunch,'TRIPADVISOR_RestList.VALENCIA', 'http://www.tripadvisor.es/Restaurants-g1117466-Valencia_Province_Valencian_Country.html', '//*[@id="EATERY_LIST_CONTENTS"]//a[contains(@class,"sprite-pageNext")]', '//*[@id="EATERY_LIST_CONTENTS"]', ''
    page.launch idLaunch,'VEREMA_RestList.VALENCIA', 'http://www.verema.com/restaurantes/spain/valencia', '//*[@class="pagination"]/*[@class="next_page"]', '//*[@id="cuerpo_footer"]', ''
    page.launch idLaunch,'ATRAPALO_RestList.VIZCAYA', 'http://www.atrapalo.com/restaurantes/vizcaya_d13.html', '//*[@id="resultados_restaurantes"]//a[@title="Siguiente"]', '//div[@id="resultados_restaurantes"]//div[@id="paginator"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.VIZCAYA', 'http://www.buscorestaurantes.com/Restaurantes-en-Bizkaia', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'RESTALO_RestList.VIZCAYA', 'http://www.restalo.es/restaurantes-vizcaya', '//div[@id="pagerContainerList"]/ul[@id="pager"]/li[@class="next"]/a', '//div[@id="pagerContainerList"]', ''
    page.launch idLaunch,'SALIR_RestList.VIZCAYA', 'http://www.salir.com/bizkaia/restaurantes', '//*[@id="itemList"]//a[@class="siguiente linkPaginador"]', '//div[@class="footer"]', ''
    page.launch idLaunch,'TRIPADVISOR_RestList.VIZCAYA', 'http://www.tripadvisor.es/Restaurants-g227874-Vizcaya_Province_Basque_Country.html', '//*[@id="EATERY_LIST_CONTENTS"]//a[contains(@class,"sprite-pageNext")]', '//*[@id="EATERY_LIST_CONTENTS"]', ''
    page.launch idLaunch,'VEREMA_RestList.VIZCAYA', 'http://www.verema.com/restaurantes/spain/vizcaya-bizkaia', '//*[@class="pagination"]/*[@class="next_page"]', '//*[@id="cuerpo_footer"]', ''
    page.launch idLaunch,'ATRAPALO_RestList.ZARAGOZA', 'http://www.atrapalo.com/restaurantes/zaragoza_d8.html', '//*[@id="resultados_restaurantes"]//a[@title="Siguiente"]', '//div[@id="resultados_restaurantes"]//div[@id="paginator"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.ZARAGOZA', 'http://www.buscorestaurantes.com/Restaurantes-en-Zaragoza', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'RESTALO_RestList.ZARAGOZA', 'http://www.restalo.es/restaurantes-zaragoza', '//div[@id="pagerContainerList"]/ul[@id="pager"]/li[@class="next"]/a', '//div[@id="pagerContainerList"]', ''
    page.launch idLaunch,'SALIR_RestList.ZARAGOZA', 'http://www.salir.com/zaragoza/restaurantes', '//*[@id="itemList"]//a[@class="siguiente linkPaginador"]', '//div[@class="footer"]', ''
    page.launch idLaunch,'TRIPADVISOR_RestList.ZARAGOZA', 'http://www.tripadvisor.es/Restaurants-g2065096-Zaragoza_Province_Aragon.html', '//*[@id="EATERY_LIST_CONTENTS"]//a[contains(@class,"sprite-pageNext")]', '//*[@id="EATERY_LIST_CONTENTS"]', ''
    page.launch idLaunch,'VEREMA_RestList.ZARAGOZA', 'http://www.verema.com/restaurantes/spain/zaragoza', '//*[@class="pagination"]/*[@class="next_page"]', '//*[@id="cuerpo_footer"]', ''


     
  end
  
end

Then /^QBot should get a snapshot$/ do

end
