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
    
    page.launch idLaunch,'TRIPADVISOR_RestList.A CORUÑA', 'http://www.tripadvisor.es/Restaurants-g1768740-A_Coruna_Province_Galicia.html', '//*[@id="EATERY_LIST_CONTENTS"]//a[contains(@class,"sprite-pageNext")]', '//*[@id="EATERY_LIST_CONTENTS"]', ''
    page.launch idLaunch,'RESTALO_RestList.A CORUÑA', 'http://www.restalo.es/restaurantes-a-coruna', '//div[@id="pagerContainerList"]/ul[@id="pager"]/li[@class="last"]/a', '//div[@id="pagerContainerList"]', ''
    page.launch idLaunch,'ATRAPALO_RestList.A CORUÑA', 'http://www.atrapalo.com/restaurantes/a-coruna_d19.html', '//*[@id="resultados_restaurantes"]//a[@title="Siguiente"]', '//div[@id="resultados_restaurantes"]/div[@class="pagerResultsBox margintop10"]', ''
    page.launch idLaunch,'SALIR_RestList.A CORUÑA', 'http://www.salir.com/la_coruna_a_coruna/restaurantes', '//*[@id="itemList"]//a[@class="siguiente linkPaginador"]', '//div[@class="footer"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.A CORUÑA', 'http://www.buscorestaurantes.com/Restaurantes-en-A-Coruna-1-1-1/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.A CORUÑA', 'http://www.buscorestaurantes.com/Restaurantes-en-Santiago-Compostela-1-1-71/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.A CORUÑA', 'http://www.buscorestaurantes.com/Restaurantes-en-Ferrol-1-1-32/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.A CORUÑA', 'http://www.buscorestaurantes.com/Restaurantes-en-Oleiros-1-1-51/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.A CORUÑA', 'http://www.buscorestaurantes.com/Restaurantes-en-Carballo-1-1-17/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'TRIPADVISOR_RestList.ASTURIAS', 'http://www.tripadvisor.es/Restaurants-g187449-Asturias.html', '//*[@id="EATERY_LIST_CONTENTS"]//a[contains(@class,"sprite-pageNext")]', '//*[@id="EATERY_LIST_CONTENTS"]', ''
    page.launch idLaunch,'RESTALO_RestList.ASTURIAS', 'http://www.restalo.es/restaurantes-asturias', '//div[@id="pagerContainerList"]/ul[@id="pager"]/li[@class="last"]/a', '//div[@id="pagerContainerList"]', ''
    page.launch idLaunch,'ATRAPALO_RestList.ASTURIAS', 'http://www.atrapalo.com/restaurantes/asturias_d17.html', '//*[@id="resultados_restaurantes"]//a[@title="Siguiente"]', '//div[@id="resultados_restaurantes"]/div[@class="pagerResultsBox margintop10"]', ''
    page.launch idLaunch,'SALIR_RestList.ASTURIAS', 'http://www.salir.com/asturias/restaurantes', '//*[@id="itemList"]//a[@class="siguiente linkPaginador"]', '//div[@class="footer"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.ASTURIAS', 'http://www.buscorestaurantes.com/Restaurantes-en-Gijon-1-6-359/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.ASTURIAS', 'http://www.buscorestaurantes.com/Restaurantes-en-Oviedo-1-6-376/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.ASTURIAS', 'http://www.buscorestaurantes.com/Restaurantes-en-Llanes-1-6-368/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.ASTURIAS', 'http://www.buscorestaurantes.com/Restaurantes-en-Aviles-1-6-341/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.ASTURIAS', 'http://www.buscorestaurantes.com/Restaurantes-en-Siero-1-6-395/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'TRIPADVISOR_RestList.BARCELONA', 'http://www.tripadvisor.es/Restaurants-g1969684-Barcelona_Province_Catalonia.html', '//*[@id="EATERY_LIST_CONTENTS"]//a[contains(@class,"sprite-pageNext")]', '//*[@id="EATERY_LIST_CONTENTS"]', ''
    page.launch idLaunch,'RESTALO_RestList.BARCELONA', 'http://www.restalo.es/restaurantes-barcelona', '//div[@id="pagerContainerList"]/ul[@id="pager"]/li[@class="last"]/a', '//div[@id="pagerContainerList"]', ''
    page.launch idLaunch,'ATRAPALO_RestList.BARCELONA', 'http://www.atrapalo.com/restaurantes/barcelona_d6.html', '//*[@id="resultados_restaurantes"]//a[@title="Siguiente"]', '//div[@id="resultados_restaurantes"]/div[@class="pagerResultsBox margintop10"]', ''
    page.launch idLaunch,'SALIR_RestList.BARCELONA', 'http://www.salir.com/barcelona/restaurantes', '//*[@id="itemList"]//a[@class="siguiente linkPaginador"]', '//div[@class="footer"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.BARCELONA', 'http://www.buscorestaurantes.com/Restaurantes-en-Barcelona-1-9-511/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.BARCELONA', 'http://www.buscorestaurantes.com/Restaurantes-en-Sabadell-1-9-648/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.BARCELONA', 'http://www.buscorestaurantes.com/Restaurantes-en-Terrassa-1-9-719/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.BARCELONA', 'http://www.buscorestaurantes.com/Restaurantes-en-Sant-Cugat-del-Valles-1-9-660/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.BARCELONA', 'http://www.buscorestaurantes.com/Restaurantes-en-Sitges-1-9-712/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'TRIPADVISOR_RestList.CANTABRIA', 'http://www.tripadvisor.es/Restaurants-g187483-Cantabria.html', '//*[@id="EATERY_LIST_CONTENTS"]//a[contains(@class,"sprite-pageNext")]', '//*[@id="EATERY_LIST_CONTENTS"]', ''
    page.launch idLaunch,'RESTALO_RestList.CANTABRIA', 'http://www.restalo.es/restaurantes-cantabria', '//div[@id="pagerContainerList"]/ul[@id="pager"]/li[@class="last"]/a', '//div[@id="pagerContainerList"]', ''
    page.launch idLaunch,'ATRAPALO_RestList.CANTABRIA', 'http://www.atrapalo.com/restaurantes/cantabria_d16.html', '//*[@id="resultados_restaurantes"]//a[@title="Siguiente"]', '//div[@id="resultados_restaurantes"]/div[@class="pagerResultsBox margintop10"]', ''
    page.launch idLaunch,'SALIR_RestList.CANTABRIA', 'http://www.salir.com/cantabria/restaurantes', '//*[@id="itemList"]//a[@class="siguiente linkPaginador"]', '//div[@class="footer"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.CANTABRIA', 'http://www.buscorestaurantes.com/Restaurantes-en-Santander-1-13-1068/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.CANTABRIA', 'http://www.buscorestaurantes.com/Restaurantes-en-Castro-Urdiales-1-13-1019/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.CANTABRIA', 'http://www.buscorestaurantes.com/Restaurantes-en-Torrelavega-1-13-1076/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.CANTABRIA', 'http://www.buscorestaurantes.com/Restaurantes-en-Laredo-1-13-1033/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.CANTABRIA', 'http://www.buscorestaurantes.com/Restaurantes-en-Camargo-1-13-1013/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'TRIPADVISOR_RestList.LA RIOJA', 'http://www.tripadvisor.es/Restaurants-g187511-La_Rioja.html', '//*[@id="EATERY_LIST_CONTENTS"]//a[contains(@class,"sprite-pageNext")]', '//*[@id="EATERY_LIST_CONTENTS"]', ''
    page.launch idLaunch,'RESTALO_RestList.LA RIOJA', 'http://www.restalo.es/restaurantes-la-rioja', '//div[@id="pagerContainerList"]/ul[@id="pager"]/li[@class="last"]/a', '//div[@id="pagerContainerList"]', ''
    page.launch idLaunch,'ATRAPALO_RestList.LA RIOJA', 'http://www.atrapalo.com/restaurantes/la-rioja_d18.html', '//*[@id="resultados_restaurantes"]//a[@title="Siguiente"]', '//div[@id="resultados_restaurantes"]/div[@class="pagerResultsBox margintop10"]', ''
    page.launch idLaunch,'SALIR_RestList.LA RIOJA', 'http://www.salir.com/la_rioja/restaurantes', '//*[@id="itemList"]//a[@class="siguiente linkPaginador"]', '//div[@class="footer"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.LA RIOJA', 'http://www.buscorestaurantes.com/Restaurantes-en-Logrono-1-31-1902/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.LA RIOJA', 'http://www.buscorestaurantes.com/Restaurantes-en-Calahorra-1-31-1888/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.LA RIOJA', 'http://www.buscorestaurantes.com/Restaurantes-en-Haro-1-31-1898/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.LA RIOJA', 'http://www.buscorestaurantes.com/Restaurantes-en-Ezcaray-1-31-1896/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.LA RIOJA', 'http://www.buscorestaurantes.com/Restaurantes-en-Najera-1-31-1903/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'TRIPADVISOR_RestList.MALAGA', 'http://www.tripadvisor.es/Restaurants-g187435-Costa_del_Sol_Andalusia.html', '//*[@id="EATERY_LIST_CONTENTS"]//a[contains(@class,"sprite-pageNext")]', '//*[@id="EATERY_LIST_CONTENTS"]', ''
    page.launch idLaunch,'RESTALO_RestList.MALAGA', 'http://www.restalo.es/restaurantes-malaga', '//div[@id="pagerContainerList"]/ul[@id="pager"]/li[@class="last"]/a', '//div[@id="pagerContainerList"]', ''
    page.launch idLaunch,'ATRAPALO_RestList.MALAGA', 'http://www.atrapalo.com/restaurantes/malaga_d43.html', '//*[@id="resultados_restaurantes"]//a[@title="Siguiente"]', '//div[@id="resultados_restaurantes"]/div[@class="pagerResultsBox margintop10"]', ''
    page.launch idLaunch,'SALIR_RestList.MALAGA', 'http://www.salir.com/malaga/restaurantes', '//*[@id="itemList"]//a[@class="siguiente linkPaginador"]', '//div[@class="footer"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.MALAGA', 'http://www.buscorestaurantes.com/Restaurantes-en-Malaga-1-36-2382/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.MALAGA', 'http://www.buscorestaurantes.com/Restaurantes-en-Marbella-1-36-2384/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.MALAGA', 'http://www.buscorestaurantes.com/Restaurantes-en-Torremolinos-1-36-2401/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.MALAGA', 'http://www.buscorestaurantes.com/Restaurantes-en-Fuengirola-1-36-2375/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.MALAGA', 'http://www.buscorestaurantes.com/Restaurantes-en-Estepona-1-36-2373/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'TRIPADVISOR_RestList.MALLORCA', 'http://www.tripadvisor.es/Restaurants-g187462-Majorca_Balearic_Islands.html', '//*[@id="EATERY_LIST_CONTENTS"]//a[contains(@class,"sprite-pageNext")]', '//*[@id="EATERY_LIST_CONTENTS"]', ''
    page.launch idLaunch,'RESTALO_RestList.MALLORCA', 'http://www.restalo.es/restaurantes-islas-baleares/ciudad-palma-de-mallorca/', '//div[@id="pagerContainerList"]/ul[@id="pager"]/li[@class="last"]/a', '//div[@id="pagerContainerList"]', ''
    page.launch idLaunch,'ATRAPALO_RestList.MALLORCA', 'http://www.atrapalo.com/restaurantes/mallorca_d55.html', '//*[@id="resultados_restaurantes"]//a[@title="Siguiente"]', '//div[@id="resultados_restaurantes"]/div[@class="pagerResultsBox margintop10"]', ''
    page.launch idLaunch,'SALIR_RestList.MALLORCA', 'http://www.salir.com/islas_baleares/restaurantes', '//*[@id="itemList"]//a[@class="siguiente linkPaginador"]', '//div[@class="footer"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.MALLORCA', 'http://www.buscorestaurantes.com/Restaurantes-en-Palma-Mallorca-101889-0-0/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.MALLORCA', 'http://www.buscorestaurantes.com/Restaurantes-en-Calvia-101862-0-0/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.MALLORCA', 'http://www.buscorestaurantes.com/Restaurantes-en-Pollenca-101891-0-0/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.MALLORCA', 'http://www.buscorestaurantes.com/Restaurantes-en-Alcudia-101853-0-0/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.MALLORCA', 'http://www.buscorestaurantes.com/Restaurantes-en-Capdepera-101864-0-0/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'TRIPADVISOR_RestList.MURCIA', 'http://www.tripadvisor.es/Restaurants-g187516-Region_of_Murcia.html', '//*[@id="EATERY_LIST_CONTENTS"]//a[contains(@class,"sprite-pageNext")]', '//*[@id="EATERY_LIST_CONTENTS"]', ''
    page.launch idLaunch,'RESTALO_RestList.MURCIA', 'http://www.restalo.es/restaurantes-murcia', '//div[@id="pagerContainerList"]/ul[@id="pager"]/li[@class="last"]/a', '//div[@id="pagerContainerList"]', ''
    page.launch idLaunch,'ATRAPALO_RestList.MURCIA', 'http://www.atrapalo.com/restaurantes/murcia_d39.html', '//*[@id="resultados_restaurantes"]//a[@title="Siguiente"]', '//div[@id="resultados_restaurantes"]/div[@class="pagerResultsBox margintop10"]', ''
    page.launch idLaunch,'SALIR_RestList.MURCIA', 'http://www.salir.com/murcia/restaurantes', '//*[@id="itemList"]//a[@class="siguiente linkPaginador"]', '//div[@class="footer"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.MURCIA', 'http://www.buscorestaurantes.com/Restaurantes-en-Murcia-1-38-2437/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.MURCIA', 'http://www.buscorestaurantes.com/Restaurantes-en-Cartagena-1-38-2422/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.MURCIA', 'http://www.buscorestaurantes.com/Restaurantes-en-Lorca-1-38-2431/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.MURCIA', 'http://www.buscorestaurantes.com/Restaurantes-en-Molina-Segura-1-38-2434/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.MURCIA', 'http://www.buscorestaurantes.com/Restaurantes-en-aguilas-1-38-2412/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'TRIPADVISOR_RestList.NAVARRA', 'http://www.tripadvisor.es/Restaurants-g187519-Navarra.html', '//*[@id="EATERY_LIST_CONTENTS"]//a[contains(@class,"sprite-pageNext")]', '//*[@id="EATERY_LIST_CONTENTS"]', ''
    page.launch idLaunch,'RESTALO_RestList.NAVARRA', 'http://www.restalo.es/restaurantes-navarra', '//div[@id="pagerContainerList"]/ul[@id="pager"]/li[@class="last"]/a', '//div[@id="pagerContainerList"]', ''
    page.launch idLaunch,'ATRAPALO_RestList.NAVARRA', 'http://www.atrapalo.com/restaurantes/navarra_d15.html', '//*[@id="resultados_restaurantes"]//a[@title="Siguiente"]', '//div[@id="resultados_restaurantes"]/div[@class="pagerResultsBox margintop10"]', ''
    page.launch idLaunch,'SALIR_RestList.NAVARRA', 'http://www.salir.com/navarra/restaurantes', '//*[@id="itemList"]//a[@class="siguiente linkPaginador"]', '//div[@class="footer"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.NAVARRA', 'http://www.buscorestaurantes.com/Restaurantes-en-Pamplona--Iruna-1-39-2563/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.NAVARRA', 'http://www.buscorestaurantes.com/Restaurantes-en-Tudela-1-39-2577/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.NAVARRA', 'http://www.buscorestaurantes.com/Restaurantes-en-Estella--Lizarra-1-39-2505/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.NAVARRA', 'http://www.buscorestaurantes.com/Restaurantes-en-Baztan-1-39-2476/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.NAVARRA', 'http://www.buscorestaurantes.com/Restaurantes-en-Bera--Vera-Bidasoa-1-39-2477/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'TRIPADVISOR_RestList.PONTEVEDRA', 'http://www.tripadvisor.es/Restaurants-g1768743-Pontevedra_Province_Galicia.html', '//*[@id="EATERY_LIST_CONTENTS"]//a[contains(@class,"sprite-pageNext")]', '//*[@id="EATERY_LIST_CONTENTS"]', ''
    page.launch idLaunch,'RESTALO_RestList.PONTEVEDRA', 'http://www.restalo.es/restaurantes-pontevedra', '//div[@id="pagerContainerList"]/ul[@id="pager"]/li[@class="last"]/a', '//div[@id="pagerContainerList"]', ''
    page.launch idLaunch,'ATRAPALO_RestList.PONTEVEDRA', 'http://www.atrapalo.com/restaurantes/pontevedra_d21.html', '//*[@id="resultados_restaurantes"]//a[@title="Siguiente"]', '//div[@id="resultados_restaurantes"]/div[@class="pagerResultsBox margintop10"]', ''
    page.launch idLaunch,'SALIR_RestList.PONTEVEDRA', 'http://www.salir.com/pontevedra/restaurantes', '//*[@id="itemList"]//a[@class="siguiente linkPaginador"]', '//div[@class="footer"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.PONTEVEDRA', 'http://www.buscorestaurantes.com/Restaurantes-en-Vigo-1-42-2729/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.PONTEVEDRA', 'http://www.buscorestaurantes.com/Restaurantes-en-Pontevedra-1-42-2715/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.PONTEVEDRA', 'http://www.buscorestaurantes.com/Restaurantes-en-O-Grove-1-42-2693/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.PONTEVEDRA', 'http://www.buscorestaurantes.com/Restaurantes-en-Sanxenxo-1-42-2723/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.PONTEVEDRA', 'http://www.buscorestaurantes.com/Restaurantes-en-Vilagarcia-Arousa-1-42-2732/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'TRIPADVISOR_RestList.SALAMANCA', 'http://www.tripadvisor.es/Restaurants-g2374662-Province_of_Salamanca_Castile_and_Leon.html', '//*[@id="EATERY_LIST_CONTENTS"]//a[contains(@class,"sprite-pageNext")]', '//*[@id="EATERY_LIST_CONTENTS"]', ''
    page.launch idLaunch,'RESTALO_RestList.SALAMANCA', 'http://www.restalo.es/restaurantes-salamanca', '//div[@id="pagerContainerList"]/ul[@id="pager"]/li[@class="last"]/a', '//div[@id="pagerContainerList"]', ''
    page.launch idLaunch,'ATRAPALO_RestList.SALAMANCA', 'http://www.atrapalo.com/restaurantes/salamanca_d27.html', '//*[@id="resultados_restaurantes"]//a[@title="Siguiente"]', '//div[@id="resultados_restaurantes"]/div[@class="pagerResultsBox margintop10"]', ''
    page.launch idLaunch,'SALIR_RestList.SALAMANCA', 'http://www.salir.com/salamanca/restaurantes', '//*[@id="itemList"]//a[@class="siguiente linkPaginador"]', '//div[@class="footer"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.SALAMANCA', 'http://www.buscorestaurantes.com/Restaurantes-en-Salamanca-1-43-2765/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.SALAMANCA', 'http://www.buscorestaurantes.com/Restaurantes-en-Ciudad-Rodrigo-1-43-2748/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.SALAMANCA', 'http://www.buscorestaurantes.com/Restaurantes-en-Santa-Marta-Tormes-1-43-2768/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.SALAMANCA', 'http://www.buscorestaurantes.com/Restaurantes-en-Penaranda-Bracamonte-1-43-2763/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.SALAMANCA', 'http://www.buscorestaurantes.com/Restaurantes-en-Bejar-1-43-2738/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'TRIPADVISOR_RestList.SEGOVIA', 'http://www.tripadvisor.es/Restaurants-g1934720-Segovia_Province_Castile_and_Leon.html', '//*[@id="EATERY_LIST_CONTENTS"]//a[contains(@class,"sprite-pageNext")]', '//*[@id="EATERY_LIST_CONTENTS"]', ''
    page.launch idLaunch,'RESTALO_RestList.SEGOVIA', 'http://www.restalo.es/restaurantes-segovia', '//div[@id="pagerContainerList"]/ul[@id="pager"]/li[@class="last"]/a', '//div[@id="pagerContainerList"]', ''
    page.launch idLaunch,'ATRAPALO_RestList.SEGOVIA', 'http://www.atrapalo.com/restaurantes/segovia_d30.html', '//*[@id="resultados_restaurantes"]//a[@title="Siguiente"]', '//div[@id="resultados_restaurantes"]/div[@class="pagerResultsBox margintop10"]', ''
    page.launch idLaunch,'SALIR_RestList.SEGOVIA', 'http://www.salir.com/segovia/restaurantes', '//*[@id="itemList"]//a[@class="siguiente linkPaginador"]', '//div[@class="footer"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.SEGOVIA', 'http://www.buscorestaurantes.com/Restaurantes-en-Segovia-1-44-2868/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.SEGOVIA', 'http://www.buscorestaurantes.com/Restaurantes-en-Pedraza-1-44-2861/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.SEGOVIA', 'http://www.buscorestaurantes.com/Restaurantes-en-Sepulveda-1-44-2869/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.SEGOVIA', 'http://www.buscorestaurantes.com/Restaurantes-en-San-Ildefonso-1-44-2865/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.SEGOVIA', 'http://www.buscorestaurantes.com/Restaurantes-en-Riaza-1-44-2863/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'TRIPADVISOR_RestList.SEVILLA', 'http://www.tripadvisor.es/Restaurants-g2361626-Province_of_Seville_Andalucia.html', '//*[@id="EATERY_LIST_CONTENTS"]//a[contains(@class,"sprite-pageNext")]', '//*[@id="EATERY_LIST_CONTENTS"]', ''
    page.launch idLaunch,'RESTALO_RestList.SEVILLA', 'http://www.restalo.es/restaurantes-sevilla', '//div[@id="pagerContainerList"]/ul[@id="pager"]/li[@class="last"]/a', '//div[@id="pagerContainerList"]', ''
    page.launch idLaunch,'ATRAPALO_RestList.SEVILLA', 'http://www.atrapalo.com/restaurantes/sevilla_d46.html', '//*[@id="resultados_restaurantes"]//a[@title="Siguiente"]', '//div[@id="resultados_restaurantes"]/div[@class="pagerResultsBox margintop10"]', ''
    page.launch idLaunch,'SALIR_RestList.SEVILLA', 'http://www.salir.com/sevilla/restaurantes', '//*[@id="itemList"]//a[@class="siguiente linkPaginador"]', '//div[@class="footer"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.SEVILLA', 'http://www.buscorestaurantes.com/Restaurantes-en-Sevilla-1-45-2944/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.SEVILLA', 'http://www.buscorestaurantes.com/Restaurantes-en-Dos-Hermanas-1-45-2904/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.SEVILLA', 'http://www.buscorestaurantes.com/Restaurantes-en-Alcala-Guadaira-1-45-2878/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.SEVILLA', 'http://www.buscorestaurantes.com/Restaurantes-en-Utrera-1-45-2948/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.SEVILLA', 'http://www.buscorestaurantes.com/Restaurantes-en-ecija-1-45-2905/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'TRIPADVISOR_RestList.TENERIFE', 'http://www.tripadvisor.es/Restaurants-g187479-Tenerife_Canary_Islands.html', '//*[@id="EATERY_LIST_CONTENTS"]//a[contains(@class,"sprite-pageNext")]', '//*[@id="EATERY_LIST_CONTENTS"]', ''
    page.launch idLaunch,'RESTALO_RestList.TENERIFE', 'http://www.restalo.es/restaurantes-santa-cruz-de-tenerife', '//div[@id="pagerContainerList"]/ul[@id="pager"]/li[@class="last"]/a', '//div[@id="pagerContainerList"]', ''
    page.launch idLaunch,'ATRAPALO_RestList.TENERIFE', 'http://www.atrapalo.com/restaurantes/tenerife_d67.html', '//*[@id="resultados_restaurantes"]//a[@title="Siguiente"]', '//div[@id="resultados_restaurantes"]/div[@class="pagerResultsBox margintop10"]', ''
    page.launch idLaunch,'SALIR_RestList.TENERIFE', 'http://www.salir.com/tenerife/restaurantes', '//*[@id="itemList"]//a[@class="siguiente linkPaginador"]', '//div[@class="footer"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.TENERIFE', 'http://www.buscorestaurantes.com/Restaurantes-en-Santa-Cruz-Tenerife-1-48-2823/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.TENERIFE', 'http://www.buscorestaurantes.com/Restaurantes-en-Arona-1-48-2786/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.TENERIFE', 'http://www.buscorestaurantes.com/Restaurantes-en-San-Cristobal-Laguna-1-48-2297/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.TENERIFE', 'http://www.buscorestaurantes.com/Restaurantes-en-Puerto-Cruz-1-48-2815/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.TENERIFE', 'http://www.buscorestaurantes.com/Restaurantes-en-Adeje-1-48-2781/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'TRIPADVISOR_RestList.TOLEDO', 'http://www.tripadvisor.es/Restaurants-g2370231-Province_of_Toledo_Castile_La_Mancha.html', '//*[@id="EATERY_LIST_CONTENTS"]//a[contains(@class,"sprite-pageNext")]', '//*[@id="EATERY_LIST_CONTENTS"]', ''
    page.launch idLaunch,'RESTALO_RestList.TOLEDO', 'http://www.restalo.es/restaurantes-toledo', '//div[@id="pagerContainerList"]/ul[@id="pager"]/li[@class="last"]/a', '//div[@id="pagerContainerList"]', ''
    page.launch idLaunch,'ATRAPALO_RestList.TOLEDO', 'http://www.atrapalo.com/restaurantes/toledo_d38.html', '//*[@id="resultados_restaurantes"]//a[@title="Siguiente"]', '//div[@id="resultados_restaurantes"]/div[@class="pagerResultsBox margintop10"]', ''
    page.launch idLaunch,'SALIR_RestList.TOLEDO', 'http://www.salir.com/toledo/restaurantes', '//*[@id="itemList"]//a[@class="siguiente linkPaginador"]', '//div[@class="footer"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.TOLEDO', 'http://www.buscorestaurantes.com/Restaurantes-en-Toledo-1-50-3200/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.TOLEDO', 'http://www.buscorestaurantes.com/Restaurantes-en-Talavera-Reina-1-50-3197/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.TOLEDO', 'http://www.buscorestaurantes.com/Restaurantes-en-Illescas-1-50-3161/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.TOLEDO', 'http://www.buscorestaurantes.com/Restaurantes-en-Torrijos-1-50-3201/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.TOLEDO', 'http://www.buscorestaurantes.com/Restaurantes-en-Quintanar-Orden-1-50-3187/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'TRIPADVISOR_RestList.VALENCIA', 'http://www.tripadvisor.es/Restaurants-g1117466-Valencia_Province_Valencian_Country.html', '//*[@id="EATERY_LIST_CONTENTS"]//a[contains(@class,"sprite-pageNext")]', '//*[@id="EATERY_LIST_CONTENTS"]', ''
    page.launch idLaunch,'RESTALO_RestList.VALENCIA', 'http://www.restalo.es/restaurantes-valencia', '//div[@id="pagerContainerList"]/ul[@id="pager"]/li[@class="last"]/a', '//div[@id="pagerContainerList"]', ''
    page.launch idLaunch,'ATRAPALO_RestList.VALENCIA', 'http://www.atrapalo.com/restaurantes/valencia_d41.html', '//*[@id="resultados_restaurantes"]//a[@title="Siguiente"]', '//div[@id="resultados_restaurantes"]/div[@class="pagerResultsBox margintop10"]', ''
    page.launch idLaunch,'SALIR_RestList.VALENCIA', 'http://www.salir.com/valencia/restaurantes', '//*[@id="itemList"]//a[@class="siguiente linkPaginador"]', '//div[@class="footer"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.VALENCIA', 'http://www.buscorestaurantes.com/Restaurantes-en-Valencia-Capital-103509-0-0/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.VALENCIA', 'http://www.buscorestaurantes.com/Restaurantes-en-Gandia-1-51-3294/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.VALENCIA', 'http://www.buscorestaurantes.com/Restaurantes-en-Cullera-1-51-3279/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.VALENCIA', 'http://www.buscorestaurantes.com/Restaurantes-en-Alzira-1-51-3241/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.VALENCIA', 'http://www.buscorestaurantes.com/Restaurantes-en-Sagunto--Sagunt-1-51-3352/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'TRIPADVISOR_RestList.VIZCAYA', 'http://www.tripadvisor.es/Restaurants-g227874-Vizcaya_Province_Basque_Country.html', '//*[@id="EATERY_LIST_CONTENTS"]//a[contains(@class,"sprite-pageNext")]', '//*[@id="EATERY_LIST_CONTENTS"]', ''
    page.launch idLaunch,'RESTALO_RestList.VIZCAYA', 'http://www.restalo.es/restaurantes-vizcaya', '//div[@id="pagerContainerList"]/ul[@id="pager"]/li[@class="last"]/a', '//div[@id="pagerContainerList"]', ''
    page.launch idLaunch,'ATRAPALO_RestList.VIZCAYA', 'http://www.atrapalo.com/restaurantes/vizcaya_d13.html', '//*[@id="resultados_restaurantes"]//a[@title="Siguiente"]', '//div[@id="resultados_restaurantes"]/div[@class="pagerResultsBox margintop10"]', ''
    page.launch idLaunch,'SALIR_RestList.VIZCAYA', 'http://www.salir.com/bizkaia/restaurantes', '//*[@id="itemList"]//a[@class="siguiente linkPaginador"]', '//div[@class="footer"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.VIZCAYA', 'http://www.buscorestaurantes.com/Restaurantes-en-Bilbao-1-53-763/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.VIZCAYA', 'http://www.buscorestaurantes.com/Restaurantes-en-Getxo-1-53-783/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.VIZCAYA', 'http://www.buscorestaurantes.com/Restaurantes-en-Barakaldo-1-53-756/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.VIZCAYA', 'http://www.buscorestaurantes.com/Restaurantes-en-Santurtzi-1-53-818/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.VIZCAYA', 'http://www.buscorestaurantes.com/Restaurantes-en-Gernika-Lumo-1-53-782/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'TRIPADVISOR_RestList.ZARAGOZA', 'http://www.tripadvisor.es/Restaurants-g2065096-Zaragoza_Province_Aragon.html', '//*[@id="EATERY_LIST_CONTENTS"]//a[contains(@class,"sprite-pageNext")]', '//*[@id="EATERY_LIST_CONTENTS"]', ''
    page.launch idLaunch,'RESTALO_RestList.ZARAGOZA', 'http://www.restalo.es/restaurantes-zaragoza', '//div[@id="pagerContainerList"]/ul[@id="pager"]/li[@class="last"]/a', '//div[@id="pagerContainerList"]', ''
    page.launch idLaunch,'ATRAPALO_RestList.ZARAGOZA', 'http://www.atrapalo.com/restaurantes/zaragoza_d8.html', '//*[@id="resultados_restaurantes"]//a[@title="Siguiente"]', '//div[@id="resultados_restaurantes"]/div[@class="pagerResultsBox margintop10"]', ''
    page.launch idLaunch,'SALIR_RestList.ZARAGOZA', 'http://www.salir.com/zaragoza/restaurantes', '//*[@id="itemList"]//a[@class="siguiente linkPaginador"]', '//div[@class="footer"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.ZARAGOZA', 'http://www.buscorestaurantes.com/Restaurantes-en-Zaragoza-1-55-3537/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.ZARAGOZA', 'http://www.buscorestaurantes.com/Restaurantes-en-Calatayud-1-55-3492/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.ZARAGOZA', 'http://www.buscorestaurantes.com/Restaurantes-en-Cuarte-Huerva-1-55-3496/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.ZARAGOZA', 'http://www.buscorestaurantes.com/Restaurantes-en-Utebo-1-55-3533/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''
    page.launch idLaunch,'BUSCORESTAURANTES_RestList.ZARAGOZA', 'http://www.buscorestaurantes.com/Restaurantes-en-La-Almunia-Dona-Godina-1-55-3481/1-1.html', '//div[@class="block-pagination"]/a[text()="Siguiente"]', '//div[@class="block-pagination"]', ''

  end
  
end

Then /^QBot should get a snapshot$/ do

end
