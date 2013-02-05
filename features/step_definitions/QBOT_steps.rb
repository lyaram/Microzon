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
    
page.launch idLaunch,'MUCHOVIAJE_HotelList.ORENSE', 'http://hoteles.muchoviaje.com/hoteles/hoteles_en_/OURENSE/ESORE_2_3_4_5_6_7.html', '(//*[@class="filtros-der"])[2]/ul/li[./span/@class="selected"]/following-sibling::li[starts-with(./span/a/@id,"pag") and position()=1]/span/a', '//*[@id="footer"]', ''
page.launch idLaunch,'LOGITRAVEL_HotelList.ORENSE', 'http://www.logitravel.com/hoteles/ourense-1007046.html', '(//*[@id="pagSig"]/a[text()=">"])[2]', '//*[@id="divPieVerif"]', '//*[@id="sPaginadoSuperior"]'
page.launch idLaunch,'MUCHOVIAJE_HotelList.BARCELONA', 'http://hoteles.muchoviaje.com/hoteles/hoteles_en_/BARCELONA/-TR213_2_3_4_5_6_7.html', '(//*[@class="filtros-der"])[2]/ul/li[./span/@class="selected"]/following-sibling::li[starts-with(./span/a/@id,"pag") and position()=1]/span/a', '//*[@id="footer"]', ''
page.launch idLaunch,'LOGITRAVEL_HotelList.BARCELONA', 'http://www.logitravel.com/hoteles/barcelona-1025880.html', '(//*[@id="pagSig"]/a[text()=">"])[2]', '//*[@id="divPieVerif"]', '//*[@id="sPaginadoSuperior"]'


  end
  
end

Then /^QBot should get a snapshot$/ do

end
