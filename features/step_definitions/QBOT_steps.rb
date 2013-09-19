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

    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#071', 'http://www.tripadvisor.es/Hotel_Review-g562814-d566642-Reviews-Salou_Suite-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#072', 'http://www.tripadvisor.es/Hotel_Review-g562814-d573360-Reviews-Almonsa_Playa-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#073', 'http://www.tripadvisor.es/Hotel_Review-g562814-d566647-Reviews-Royal_Apartments-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#074', 'http://www.tripadvisor.es/Hotel_Review-g562814-d1214340-Reviews-Costa_Verde_Hotel_Salou-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#075', 'http://www.tripadvisor.es/Hotel_Review-g562814-d566701-Reviews-Cumbres_de_Salou-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#076', 'http://www.tripadvisor.es/Hotel_Review-g562814-d676463-Reviews-Hotel_Apartmentos_Priorat-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#077', 'http://www.tripadvisor.es/Hotel_Review-g562814-d500713-Reviews-Font_de_Mar-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#078', 'http://www.tripadvisor.es/Hotel_Review-g562814-d566672-Reviews-Mediterranean_Suites-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#079', 'http://www.tripadvisor.es/Hotel_Review-g562814-d566717-Reviews-Apartamentos_Arquus-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#080', 'http://www.tripadvisor.es/Hotel_Review-g562814-d566698-Reviews-Iris_Bahia_Dorada-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#081', 'http://www.tripadvisor.es/Hotel_Review-g562814-d1508551-Reviews-Apartamentos_La_Caleta-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#082', 'http://www.tripadvisor.es/Hotel_Review-g562814-d500569-Reviews-Apartments_San_Francisco-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#083', 'http://www.tripadvisor.es/Hotel_Review-g562814-d1211338-Reviews-Las_Brisas_Village_Hotel_Salou-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#084', 'http://www.tripadvisor.es/Hotel_Review-g562814-d1484082-Reviews-Cala_Vina-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#085', 'http://www.tripadvisor.es/Hotel_Review-g562814-d500399-Reviews-Catalunya-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#086', 'http://www.tripadvisor.es/Hotel_Review-g562814-d1217130-Reviews-Club_Siesta_Dorada-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#087', 'http://www.tripadvisor.es/Hotel_Review-g562814-d1221961-Reviews-Costamar_Hotel-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#088', 'http://www.tripadvisor.es/Hotel_Review-g562814-d1212106-Reviews-Eurostars_Tarraco_Hotel_Salou-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#089', 'http://www.tripadvisor.es/Hotel_Review-g562814-d1212107-Reviews-Flamingo_Hotel_Salou-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#090', 'http://www.tripadvisor.es/Hotel_Review-g562814-d1212108-Reviews-Gaudi_Hotel_Salou-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#091', 'http://www.tripadvisor.es/Hotel_Review-g562814-d3640502-Reviews-Hotel_Antermare-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#092', 'http://www.tripadvisor.es/Hotel_Review-g562814-d566719-Reviews-Hotel_Atalaya-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#093', 'http://www.tripadvisor.es/Hotel_Review-g562814-d1508810-Reviews-Hotel_Monaco-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#094', 'http://www.tripadvisor.es/Hotel_Review-g562814-d1224420-Reviews-Internacional_Playa_Hotel-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#095', 'http://www.tripadvisor.es/Hotel_Review-g562814-d487102-Reviews-Maeva_Holiday_Residence_Turquesa-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#096', 'http://www.tripadvisor.es/Hotel_Review-g562814-d566689-Reviews-Maraton-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#097', 'http://www.tripadvisor.es/Hotel_Review-g562814-d1210790-Reviews-Nova_Senia_Hotel_Salou-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#098', 'http://www.tripadvisor.es/Hotel_Review-g562814-d1212109-Reviews-Olympic_92_Golf_de_Sant_Jordi_Hotel_Salou-Salou_Costa_Dorada_Province_of_Tarragona_Cat.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#099', 'http://www.tripadvisor.es/Hotel_Review-g562814-d1221622-Reviews-Top_Secret_Ibersol_Apartments-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#100', 'http://www.tripadvisor.es/Hotel_Review-g562814-d566639-Reviews-Via_Aurelia-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
 

     
  end
  
end

Then /^QBot should get a snapshot$/ do

end
