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
    
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.ALBACETE', 'http://www.holidaycheck.com/city-travel+information_Albacete-oid_10642.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.ALICANTE', 'http://www.holidaycheck.com/city-travel+information_Alicante-oid_2366.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.ALMERIA', 'http://www.holidaycheck.com/city-travel+information_Almer%C3%ADa-oid_2373.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.AVILA', 'http://www.holidaycheck.com/city-travel+information_Avila-oid_10554.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.BADAJOZ', 'http://www.holidaycheck.com/city-travel+information_Badajoz-oid_2375.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.BARCELONA', 'http://www.holidaycheck.com/city-travel+information_Barcelona-oid_2378.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.BILBAO', 'http://www.holidaycheck.com/city-travel+information_Bilbao-oid_2365.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.BURGOS', 'http://www.holidaycheck.com/city-travel+information_Burgos-oid_2380.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.CACERES', 'http://www.holidaycheck.com/city-travel+information_Caceres-oid_2381.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.CADIZ', 'http://www.holidaycheck.com/city-travel+information_Cadiz-oid_2382.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.CASTELLON_DE_LA_PLANA', 'http://www.holidaycheck.com/city-travel+information_Castellon+De+La+Plana-oid_11526.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.CIUDAD_REAL', 'http://www.holidaycheck.com/city-travel+information_Ciudad+Real-oid_2387.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.CORDOBA', 'http://www.holidaycheck.com/city-travel+information_Cordoba-oid_2388.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.CUENCA', 'http://www.holidaycheck.com/city-travel+information_Cuenca-oid_2389.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.ELCHE', 'http://www.holidaycheck.com/city-travel+information_Elche-oid_2544.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.GIJON', 'http://www.holidaycheck.com/city-travel+information_Gijon-oid_10645.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.GIRONA', 'http://www.holidaycheck.com/city-travel+information_Girona+Gerona-oid_12642.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.GRANADA', 'http://www.holidaycheck.com/city-travel+information_Granada-oid_2394.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.GUADALAJARA', 'http://www.holidaycheck.com/city-travel+information_Guadalajara-oid_11828.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.HOSPITALET', 'http://www.holidaycheck.es/city-Informacion_L+Hospitalet+de+Llobregat-oid_17006.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.HUELVA', 'http://www.holidaycheck.com/city-travel+information_Huelva-oid_2395.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.HUESCA', 'http://www.holidaycheck.com/city-travel+information_Huesca-oid_22973.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.JAEN', 'http://www.holidaycheck.com/city-travel+information_Ja%C3%A9n-oid_2396.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.JEREZ_DE_LA_FRONTERA', 'http://www.holidaycheck.com/city-travel+information_Jerez+de+la+Frontera-oid_2432.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.LEON', 'http://www.holidaycheck.com/city-travel+information_Leon-oid_2398.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.LERIDA', 'http://www.holidaycheck.com/city-travel+information_Lleida+Lerida-oid_15215.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.LOGRONO', 'http://www.holidaycheck.com/city-travel+information_Logrono-oid_2399.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.LUGO', 'http://www.holidaycheck.com/city-travel+information_Lugo-oid_2400.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.MADRID', 'http://www.holidaycheck.com/city-travel+information_Madrid-oid_2401.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.MALAGA', 'http://www.holidaycheck.com/city-travel+information_Malaga-oid_2402.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.MERIDA', 'http://www.holidaycheck.com/city-travel+information_Merida-oid_11833.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.MURCIA', 'http://www.holidaycheck.com/city-travel+information_Murcia-oid_2405.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.ORENSE', 'http://www.holidaycheck.com/city-travel+information_Orense-oid_2409.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.OVIEDO', 'http://www.holidaycheck.com/city-travel+information_Oviedo-oid_10593.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.PALENCIA', 'http://www.holidaycheck.com/city-travel+information_Palencia-oid_12651.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.PAMPLONA', 'http://www.holidaycheck.com/city-travel+information_Pamplona-oid_10598.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.PONTEVEDRA', 'http://www.holidaycheck.com/city-travel+information_Pontevedra-oid_2410.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.SALAMANCA', 'http://www.holidaycheck.com/city-travel+information_Salamanca-oid_2413.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.SAN_SEBASTIAN', 'http://www.holidaycheck.com/city-travel+information_San+Sebastian-oid_2531.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.SANTANDER', 'http://www.holidaycheck.com/city-travel+information_Santander-oid_2532.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.SANTIAGO_DE_COMPOSTELA', 'http://www.holidaycheck.com/city-travel+information_Santiago+de+Compostela-oid_2433.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.SEGOVIA', 'http://www.holidaycheck.com/city-travel+information_Segovia-oid_2415.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.SEVILLA', 'http://www.holidaycheck.com/city-travel+information_Seville-oid_2416.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.SORIA', 'http://www.holidaycheck.com/city-travel+information_Soria-oid_2417.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.TARRAGONA', 'http://www.holidaycheck.com/city-travel+information_Tarragona-oid_20411.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.TERUEL', 'http://www.holidaycheck.com/city-travel+information_Teruel-oid_2367.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.TOLEDO', 'http://www.holidaycheck.com/city-travel+information_Toledo-oid_2419.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.VALENCIA', 'http://www.holidaycheck.com/city-travel+information_Valencia-oid_2422.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.VALLADOLID', 'http://www.holidaycheck.com/city-travel+information_Valladolid-oid_2423.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.VIGO', 'http://www.holidaycheck.com/city-travel+information_Vigo-oid_12370.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.VITORIA', 'http://www.holidaycheck.com/city-travel+information_Vitoria-oid_12691.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.ZAMORA', 'http://www.holidaycheck.com/city-travel+information_Zamora-oid_2425.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''
    page.launch idLaunch,'HOLIDAYCHECK_HotelList.ZARAGOZA', 'http://www.holidaycheck.com/city-travel+information_Zaragoza-oid_2426.html', '//*[starts-with(@id,"City_index_Pagination")]/span/a[contains(@title,"More")]', '//*[@id="hcContent"]', ''


  end
  
end

Then /^QBot should get a snapshot$/ do

end
