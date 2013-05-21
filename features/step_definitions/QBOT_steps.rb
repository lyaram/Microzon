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
    
    page.launch idLaunch, 'TAAtraccionesFicha.Dipu#2096', 'http://www.tripadvisor.es/Attraction_Review-g642221-d1999399-Reviews-Denilo_SL-Mataro_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TAAtraccionesFicha.Dipu#2241', 'http://www.tripadvisor.es/Attraction_Review-g1063735-d3264887-Reviews-Oller_del_Mas-Manresa_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TAAtraccionesFicha.Dipu#2263', 'http://www.tripadvisor.es/Attraction_Review-g1969684-d2041750-Reviews-Parque_Natural_de_Sant_Llorenc_del_Munt_i_l_Obac-Province_of_Barcelona_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TAAtraccionesFicha.Dipu#2287', 'http://www.tripadvisor.es/Attraction_Review-g187501-d646065-Reviews-Rabbies_to_Montserrat-Montserrat_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TAAtraccionesFicha.Dipu#2308', 'http://www.tripadvisor.es/Attraction_Review-g187502-d4228142-Reviews-Sitges_Fitness-Sitges_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''

     
  end
  
end

Then /^QBot should get a snapshot$/ do

end
