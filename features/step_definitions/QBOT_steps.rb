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
    
    launchTAReviews idLaunch, 'TA_GC_030', 'http://www.tripadvisor.es/Hotel_Review-g562819-d1055177-Reviews-Sunprime_Atlantic_View_Suites_Spa-Playa_del_Ingles_Gran_Canaria_Canary_Islands.html'
    launchTAReviews idLaunch, 'TA_GC_060', 'http://www.tripadvisor.es/Hotel_Review-g562819-d578159-Reviews-Bungalows_Miraflor_Park-Playa_del_Ingles_Gran_Canaria_Canary_Islands.html'
    launchTAReviews idLaunch, 'TA_GC_090', 'http://www.tripadvisor.es/Hotel_Review-g1064363-d569914-Reviews-Puerto_De_Las_Nieves-Agaete_Gran_Canaria_Canary_Islands.html'
    launchTAReviews idLaunch, 'TA_GC_120', 'http://www.tripadvisor.es/Hotel_Review-g230095-d530793-Reviews-DunaGolf_Bungalows-Maspalomas_Gran_Canaria_Canary_Islands.html'
    launchTAReviews idLaunch, 'TA_GC_150', 'http://www.tripadvisor.es/Hotel_Review-g230095-d508163-Reviews-Suite_Hotel_Jardin_Dorado-Maspalomas_Gran_Canaria_Canary_Islands.html'
    launchTAReviews idLaunch, 'TA_GC_180', 'http://www.tripadvisor.es/Hotel_Review-g635887-d530861-Reviews-Palmera_Mar-Puerto_Rico_Gran_Canaria_Canary_Islands.html'
    launchTAReviews idLaunch, 'TA_GC_210', 'http://www.tripadvisor.es/Hotel_Review-g562819-d577752-Reviews-Apartments_Fayna-Playa_del_Ingles_Gran_Canaria_Canary_Islands.html'
    launchTAReviews idLaunch, 'TA_GC_240', 'http://www.tripadvisor.es/Hotel_Review-g230095-d792770-Reviews-Chiripa-Maspalomas_Gran_Canaria_Canary_Islands.html'
    launchTAReviews idLaunch, 'TA_GC_270', 'http://www.tripadvisor.es/Hotel_Review-g635887-d1172991-Reviews-Laguna_Apartments-Puerto_Rico_Gran_Canaria_Canary_Islands.html'
    launchTAReviews idLaunch, 'TA_GC_300', 'http://www.tripadvisor.es/Hotel_Review-g1177808-d2636836-Reviews-Marina_Elite_Resort-Mogan_Gran_Canaria_Canary_Islands.html'
    launchTAReviews idLaunch, 'TA_GC_330', 'http://www.tripadvisor.es/Hotel_Review-g562819-d287535-Reviews-Orinoco_Apartments-Playa_del_Ingles_Gran_Canaria_Canary_Islands.html'
    launchTAReviews idLaunch, 'TA_GC_360', 'http://www.tripadvisor.es/Hotel_Review-g187471-d1183250-Reviews-Villa_de_Tauro-Gran_Canaria_Canary_Islands.html'
    launchTAReviews idLaunch, 'TA_GC_390', 'http://www.tripadvisor.es/Hotel_Review-g1189157-d1193629-Reviews-Casa_Tinamar-Pino_Santo_Gran_Canaria_Canary_Islands.html'
    launchTAReviews idLaunch, 'TA_GC_420', 'http://www.tripadvisor.es/Hotel_Review-g230095-d264620-Reviews-Palm_Gardens_Residencia_Apartamentos-Maspalomas_Gran_Canaria_Canary_Islands.html'
 
  end
  
end

Then /^QBot should get a snapshot$/ do

end
