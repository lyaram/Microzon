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
    
    page.launch idLaunch, 'TAForo.Dipu#001', 'http://www.tripadvisor.es/ShowTopic-g1-i1-k3728404-Ver_los_MENSAJES_MAS_RECIENTES_de_todos_los_destinos-World.html', '(//*[@id="pager_top2"]/a[contains(@class,"pageNext")])[1]', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TAForo.Dipu#002', 'http://www.tripadvisor.es/ShowTopic-g652129-i12583-k6488575-Casal_de_verano_para_ninos_a_partir_de_3_anos-Castelldefels_Catalonia.html', '(//*[@id="pager_top2"]/a[contains(@class,"pageNext")])[1]', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TAForo.Dipu#003', 'http://www.tripadvisor.es/ShowTopic-g187497-i44-k6454995-Lugares_de_comida_tipicos_de_barcelona_no_tan_turisticos-Barcelona_Catalonia.html', '(//*[@id="pager_top2"]/a[contains(@class,"pageNext")])[1]', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TAForo.Dipu#004', 'http://www.tripadvisor.es/ShowTopic-g187497-i44-k6488103-Hoteles_en_Sitges-Barcelona_Catalonia.html', '(//*[@id="pager_top2"]/a[contains(@class,"pageNext")])[1]', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TAForo.Dipu#005', 'http://www.tripadvisor.es/ShowTopic-g187497-i44-k6452479-Fiesta_en_Barcelona-Barcelona_Catalonia.html', '(//*[@id="pager_top2"]/a[contains(@class,"pageNext")])[1]', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TAForo.Dipu#006', 'http://www.tripadvisor.es/ShowTopic-g187497-i44-k6419095-Entrenamiento_del_barca-Barcelona_Catalonia.html', '(//*[@id="pager_top2"]/a[contains(@class,"pageNext")])[1]', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TAForo.Dipu#007', 'http://www.tripadvisor.es/ShowTopic-g187497-i44-k5736367-Conociendo_un_poco_de_Barcelona_Lugares_mas_significativos-Barcelona_Catalonia.html', '(//*[@id="pager_top2"]/a[contains(@class,"pageNext")])[1]', '//*[@id="FOOT"]', ''
     
  end
  
end

Then /^QBot should get a snapshot$/ do

end
