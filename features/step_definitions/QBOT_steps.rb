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
    
    page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0599', 'http://www.tripadvisor.es/ShowUserReviews-g187497-d2218949-r150969819-Barcelona_Turisme_Montserrat_Sitges_Day_Tour-Barcelona_Catalonia.html#REVIEWS', '(//*[@id="pager_top2"]/a[contains(@class,"pageNext")])[1]', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0600', 'http://www.tripadvisor.es/Attraction_Review-g187497-d2235353-Reviews-Barcelona_Turisme_Sitges_Cavas_Freixenet_Tour-Barcelona_Catalonia.html', '(//*[@id="pager_top2"]/a[contains(@class,"pageNext")])[1]', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0647', 'http://www.tripadvisor.es/Attraction_Review-g187497-d1602326-Reviews-Explore_Catalunya-Barcelona_Catalonia.html', '(//*[@id="pager_top2"]/a[contains(@class,"pageNext")])[1]', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0776', 'http://www.tripadvisor.es/Attraction_Review-g187497-d2402833-Reviews-Miguel_Torres_Winery-Barcelona_Catalonia.html', '(//*[@id="pager_top2"]/a[contains(@class,"pageNext")])[1]', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0778', 'http://www.tripadvisor.es/Attraction_Review-g187497-d1759052-Reviews-Sitges_and_Freixenet_s_Cava_Wine_Cellars_Day_Trip_from_Barcelona-Barcelona_Catalo.html', '(//*[@id="pager_top2"]/a[contains(@class,"pageNext")])[1]', '//*[@id="FOOT"]', ''

     
  end
  
end

Then /^QBot should get a snapshot$/ do

end
