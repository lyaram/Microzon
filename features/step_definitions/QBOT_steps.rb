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
    
    #idLaunch = page.getLaunch
    idLaunch = "00000058"
    page.launch idLaunch,'PRICELINE_HotelList.Panama', 'http://travela.priceline.com/cheap-hotels-panama-city-panama-panama-tk-c333911-hl.hotel-reviews-hotel-guides', '//*[@class="pagination"]//a[contains(./text(),">")]', '//*[@id="pclnfooterPH"]', ''
    page.launch idLaunch,'PRICELINE_HotelList.Punta del Este', 'http://travela.priceline.com/cheap-hotels-punta-del-este-maldonado-uruguay-tk-c327628-hl.hotel-reviews-hotel-guides', '//*[@class="pagination"]//a[contains(./text(),">")]', '//*[@id="pclnfooterPH"]', ''
    page.launch idLaunch,'PRICELINE_HotelList.Quito ', 'http://travela.priceline.com/cheap-hotels-quito-pichincha-ecuador-tk-c312170-hl.hotel-reviews-hotel-guides', '//*[@class="pagination"]//a[contains(./text(),">")]', '//*[@id="pclnfooterPH"]', ''
    page.launch idLaunch,'PRICELINE_HotelList.Sao Paulo', 'http://travela.priceline.com/cheap-hotels-sao-paulo-sao-paulo-brazil-tk-c328148-hl.hotel-reviews-hotel-guides', '//*[@class="pagination"]//a[contains(./text(),">")]', '//*[@id="pclnfooterPH"]', ''
    page.launch idLaunch,'PRICELINE_HotelList.San Jose (Costa Rica)', 'http://travela.priceline.com/cheap-hotels-san-jose-lim%C3%B3n-tk-c346660-hl.hotel-reviews-hotel-guides', '//*[@class="pagination"]//a[contains(./text(),">")]', '//*[@id="pclnfooterPH"]', ''
    page.launch idLaunch,'PRICELINE_HotelList.San Juan de Puerto Rico', 'http://travela.priceline.com/cheap-hotels-san-juan-puerto-rico-PR-tk-c328754-hl.hotel-reviews-hotel-guides', '//*[@class="pagination"]//a[contains(./text(),">")]', '//*[@id="pclnfooterPH"]', ''
    page.launch idLaunch,'PRICELINE_HotelList.Santo Domingo (Rep Dominicana)', 'http://travela.priceline.com/cheap-hotels-santo-domingo-distrito-nacional-dominican-republic-tk-c328060-hl.hotel-reviews-hotel-guides', '//*[@class="pagination"]//a[contains(./text(),">")]', '//*[@id="pclnfooterPH"]', ''
    page.launch idLaunch,'PRICELINE_HotelList.San Salvador', 'http://travela.priceline.com/cheap-hotels-san-salvador-san-salvador-el-salvador-tk-c327465-hl.hotel-reviews-hotel-guides', '//*[@class="pagination"]//a[contains(./text(),">")]', '//*[@id="pclnfooterPH"]', ''
    page.launch idLaunch,'PRICELINE_HotelList.Santiago de Chile', 'http://travela.priceline.com/cheap-hotels-santiago-region-metropolitana-chile-tk-c313740-hl.hotel-reviews-hotel-guides', '//*[@class="pagination"]//a[contains(./text(),">")]', '//*[@id="pclnfooterPH"]', ''
    page.launch idLaunch,'PRICELINE_HotelList.Tegucigalpa', 'http://travela.priceline.com/cheap-hotels-tegucigalpa-francisco-morazan-honduras-tk-c327709-hl.hotel-reviews-hotel-guides', '//*[@class="pagination"]//a[contains(./text(),">")]', '//*[@id="pclnfooterPH"]', ''

  end
  
end

Then /^QBot should get a snapshot$/ do

end
