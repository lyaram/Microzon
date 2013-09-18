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

    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#001', 'http://www.tripadvisor.es/Hotel_Review-g562814-d613386-Reviews-Golden_Avenida_Suites-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#002', 'http://www.tripadvisor.es/Hotel_Review-g562814-d487067-Reviews-H10_Salauris_Palace-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#003', 'http://www.tripadvisor.es/Hotel_Review-g562814-d291023-Reviews-H10_Mediterranean_Village-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#004', 'http://www.tripadvisor.es/Hotel_Review-g562814-d291933-Reviews-H10_Vintage_Salou-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#005', 'http://www.tripadvisor.es/Hotel_Review-g562814-d566637-Reviews-Hotel_Vil_la_Romana-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#006', 'http://www.tripadvisor.es/Hotel_Review-g562814-d291024-Reviews-Aparthotel_CYE_Holiday_Centre-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#007', 'http://www.tripadvisor.es/Hotel_Review-g562814-d502185-Reviews-Las_Vegas_Hotel-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#008', 'http://www.tripadvisor.es/Hotel_Review-g562814-d566628-Reviews-Hotel_Golden_Port_Salou-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#009', 'http://www.tripadvisor.es/Hotel_Review-g562814-d566641-Reviews-Hotel_Villamarina_Club-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#010', 'http://www.tripadvisor.es/Hotel_Review-g562814-d500271-Reviews-Festival_Village-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#011', 'http://www.tripadvisor.es/Hotel_Review-g562814-d611893-Reviews-Ona_Jardines_Paraisol-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#012', 'http://www.tripadvisor.es/Hotel_Review-g562814-d446832-Reviews-H10_Salou_Princess-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#013', 'http://www.tripadvisor.es/Hotel_Review-g562814-d569448-Reviews-Hotel_El_Paso_PortAventura-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#014', 'http://www.tripadvisor.es/Hotel_Review-g562814-d1310704-Reviews-PortAventura_Gold_River-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#015', 'http://www.tripadvisor.es/Hotel_Review-g562814-d572801-Reviews-Magnolia_Hotel-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#016', 'http://www.tripadvisor.es/Hotel_Review-g562814-d291032-Reviews-Hotel_Aparthotel_Dorada_Palace-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#017', 'http://www.tripadvisor.es/Hotel_Review-g562814-d291897-Reviews-4R_Playa_Park_Hotel-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#018', 'http://www.tripadvisor.es/Hotel_Review-g562814-d259482-Reviews-Blaumar_Hotel_Salou-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#019', 'http://www.tripadvisor.es/Hotel_Review-g562814-d506847-Reviews-Hotel_Caribe_PortAventura-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#020', 'http://www.tripadvisor.es/Hotel_Review-g562814-d234583-Reviews-Regente_Aragon-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#021', 'http://www.tripadvisor.es/Hotel_Review-g562814-d260671-Reviews-Sol_Costa_Daurada-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#022', 'http://www.tripadvisor.es/Hotel_Review-g562814-d566636-Reviews-California_Palace-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#023', 'http://www.tripadvisor.es/Hotel_Review-g562814-d264146-Reviews-Belvedere_Hotel-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#024', 'http://www.tripadvisor.es/Hotel_Review-g562814-d260668-Reviews-Hotel_PortAventura-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#025', 'http://www.tripadvisor.es/Hotel_Review-g562814-d499999-Reviews-Aparthotel_SunClub_Salou-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#026', 'http://www.tripadvisor.es/Hotel_Review-g562814-d498773-Reviews-H10_Delfin_Park-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#027', 'http://www.tripadvisor.es/Hotel_Review-g562814-d566712-Reviews-Hotel_Calypso-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#028', 'http://www.tripadvisor.es/Hotel_Review-g562814-d291838-Reviews-Cala_Font_Hotel-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#029', 'http://www.tripadvisor.es/Hotel_Review-g562814-d263744-Reviews-Best_Da_Vinci_Royal-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#030', 'http://www.tripadvisor.es/Hotel_Review-g562814-d287668-Reviews-Complejo_Best_Negresco-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#031', 'http://www.tripadvisor.es/Hotel_Review-g562814-d566699-Reviews-Eurosalou_Hotel-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#032', 'http://www.tripadvisor.es/Hotel_Review-g562814-d951120-Reviews-Hotel_Casablanca_Playa-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#033', 'http://www.tripadvisor.es/Hotel_Review-g562814-d291030-Reviews-Hotel_Playa_de_Oro_Park-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#034', 'http://www.tripadvisor.es/Hotel_Review-g562814-d1228228-Reviews-Marinada_Apts-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#035', 'http://www.tripadvisor.es/Hotel_Review-g562814-d260596-Reviews-Med_Playa_Piramide_Salou-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#036', 'http://www.tripadvisor.es/Hotel_Review-g562814-d291033-Reviews-Hotel_Marinada-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#037', 'http://www.tripadvisor.es/Hotel_Review-g562814-d566683-Reviews-Olympus_Palace-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#038', 'http://www.tripadvisor.es/Hotel_Review-g562814-d289891-Reviews-Hotel_Villa_Dorada-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#039', 'http://www.tripadvisor.es/Hotel_Review-g562814-d1177469-Reviews-Best_San_Diego-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#040', 'http://www.tripadvisor.es/Hotel_Review-g562814-d292303-Reviews-4R_Regina_Gran_Hotel-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#041', 'http://www.tripadvisor.es/Hotel_Review-g562814-d291930-Reviews-4R_Playa_Margarita_Hotel-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#042', 'http://www.tripadvisor.es/Hotel_Review-g562814-d573362-Reviews-Les_Dalies_Apartments-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#043', 'http://www.tripadvisor.es/Hotel_Review-g562814-d291931-Reviews-Best_Cap_Salou-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#044', 'http://www.tripadvisor.es/Hotel_Review-g562814-d577188-Reviews-President_Hotel_Salou-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#045', 'http://www.tripadvisor.es/Hotel_Review-g562814-d502131-Reviews-Best_Oasis_Park-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#046', 'http://www.tripadvisor.es/Hotel_Review-g562814-d620554-Reviews-Mariposa_Apartments-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#047', 'http://www.tripadvisor.es/Hotel_Review-g562814-d567908-Reviews-Hotel_Planas-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#048', 'http://www.tripadvisor.es/Hotel_Review-g562814-d566643-Reviews-4R_Salou_Park-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#049', 'http://www.tripadvisor.es/Hotel_Review-g562814-d566686-Reviews-H_TOP_Molinos_Park-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#050', 'http://www.tripadvisor.es/Hotel_Review-g562814-d498661-Reviews-Best_Sol_Dor-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#051', 'http://www.tripadvisor.es/Hotel_Review-g562814-d500305-Reviews-California_Garden-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#052', 'http://www.tripadvisor.es/Hotel_Review-g562814-d502197-Reviews-Best_Los_Angeles-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#053', 'http://www.tripadvisor.es/Hotel_Review-g562814-d500568-Reviews-Best_San_Francisco-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#054', 'http://www.tripadvisor.es/Hotel_Review-g562814-d502153-Reviews-Best_Mediterraneo-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#055', 'http://www.tripadvisor.es/Hotel_Review-g562814-d1187138-Reviews-Ona_Club_Novelty-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#056', 'http://www.tripadvisor.es/Hotel_Review-g562814-d500482-Reviews-Santa_Monica_Playa-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#057', 'http://www.tripadvisor.es/Hotel_Review-g562814-d292300-Reviews-Jaime_I_Hotel-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#058', 'http://www.tripadvisor.es/Hotel_Review-g562814-d1449634-Reviews-Hotel_Tolosa-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#059', 'http://www.tripadvisor.es/Hotel_Review-g562814-d1144123-Reviews-Complejo_Riviera-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#060', 'http://www.tripadvisor.es/Hotel_Review-g562814-d1210788-Reviews-Express_Tarragona_Hotel_Salou-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#061', 'http://www.tripadvisor.es/Hotel_Review-g562814-d1228673-Reviews-Cordoba_Sevilla_Apartments-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#062', 'http://www.tripadvisor.es/Hotel_Review-g562814-d1151801-Reviews-Apartamentos_Priorat-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#063', 'http://www.tripadvisor.es/Hotel_Review-g562814-d566674-Reviews-Punta_Dorada_Princess-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#064', 'http://www.tripadvisor.es/Hotel_Review-g562814-d566645-Reviews-Residencial_Vancouver-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#065', 'http://www.tripadvisor.es/Hotel_Review-g562814-d566705-Reviews-Cancun-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#066', 'http://www.tripadvisor.es/Hotel_Review-g562814-d191134-Reviews-Hotel_Caspel-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#067', 'http://www.tripadvisor.es/Hotel_Review-g562814-d573361-Reviews-Cala_Dorada-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#068', 'http://www.tripadvisor.es/Hotel_Review-g562814-d566710-Reviews-Cordoba_Apartments-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#069', 'http://www.tripadvisor.es/Hotel_Review-g562814-d500857-Reviews-Montblanc_Apartments-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
    page.launch idLaunch, 'TRIPADVISOR_HotelFicha.RussianSalou#070', 'http://www.tripadvisor.es/Hotel_Review-g562814-d566715-Reviews-California_III_IV-Salou_Costa_Dorada_Province_of_Tarragona_Catalonia.html', '', '//*[@id="FOOT"]', ''
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
