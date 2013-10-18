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

 ##$DEBUG = true
 #   puts "chimpon"
 #   return
 #   idLaunch = "zzzzz"
 #   puts "zzzz... sigue?"


page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID5405', 'http://www.tripadvisor.es/Restaurant_Review-g187529-d987456-Reviews-Seu_Xerea-Valencia_Valencia_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID2717', 'http://www.tripadvisor.es/Restaurant_Review-g187525-d1368544-Reviews-The_Vagabond-Benidorm_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID2880', 'http://www.tripadvisor.es/Restaurant_Review-g736284-d1889874-Reviews-Xambel_Tapas_Bar-Moraira_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID5137', 'http://www.tripadvisor.es/Restaurant_Review-g187529-d1901241-Reviews-48_Restaurante_Pub-Valencia_Valencia_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID2860', 'http://www.tripadvisor.es/Restaurant_Review-g1905496-d2716316-Reviews-White_Rose_Tea_Rooms-Cabo_Roig_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID5191', 'http://www.tripadvisor.es/Restaurant_Review-g1941177-d3923496-Reviews-Restaurante_Granja_Santa_Creu-San_Antonio_de_Benageber_Valencia_Province_Valenci.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID3742', 'http://www.tripadvisor.es/Restaurant_Review-g609036-d4311847-Reviews-El_Raconet_de_Ca_Deu-Peniscola_Castellon_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID2050', 'http://www.tripadvisor.es/Restaurant_Review-g187524-d1877319-Reviews-Restaurante_BB_Grill-Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID2718', 'http://www.tripadvisor.es/Restaurant_Review-g1899444-d2369365-Reviews-The_Vestry-Algorfa_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID1413', 'http://www.tripadvisor.es/Restaurant_Review-g652147-d3844751-Reviews-Mareng-Guardamar_del_Segura_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID5217', 'http://www.tripadvisor.es/Restaurant_Review-g1117466-d1929682-Reviews-Restaurante_La_Granadella-Valencia_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID4703', 'http://www.tripadvisor.es/Restaurant_Review-g187529-d3775159-Reviews-Kilim-Valencia_Valencia_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID0722', 'http://www.tripadvisor.es/Restaurant_Review-g1064230-d4350811-Reviews-Chapter_1-Alicante_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID2819', 'http://www.tripadvisor.es/Restaurant_Review-g1598533-d3859186-Reviews-Venta_de_la_Roja-Jalon_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID5240', 'http://www.tripadvisor.es/Restaurant_Review-g187529-d993189-Reviews-Restaurante_Lienzo_Cdad-Valencia_Valencia_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID0405', 'http://www.tripadvisor.es/Restaurant_Review-g187527-d3458692-Reviews-La_Bodeguilla_des_Mullins-Torrevieja_Costa_Blanca_Alicante_Province_Valencian_Cou.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID3700', 'http://www.tripadvisor.es/Restaurant_Review-g667782-d4552957-Reviews-Nuun-Benicasim_Castellon_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID4620', 'http://www.tripadvisor.es/Restaurant_Review-g652150-d4129767-Reviews-Heladeria_La_Caseta-La_Eliana_Valencia_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID2632', 'http://www.tripadvisor.es/Restaurant_Review-g1064230-d3525481-Reviews-Taverna_del_Raco_del_Pla-Alicante_Costa_Blanca_Alicante_Province_Valencian_Count.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID2026', 'http://www.tripadvisor.es/Restaurant_Review-g652147-d3522989-Reviews-Restaurante_Almanjar-Guardamar_del_Segura_Costa_Blanca_Alicante_Province_Valencia.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID3620', 'http://www.tripadvisor.es/Restaurant_Review-g580335-d3635328-Reviews-La_Hacienda_Del_Mexicano-Vinaros_Castellon_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID0943', 'http://www.tripadvisor.es/Restaurant_Review-g609043-d994213-Reviews-Drassanes-Denia_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID2355', 'http://www.tripadvisor.es/Restaurant_Review-g187525-d4082221-Reviews-El_Rincon_Perdido-Benidorm_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID5499', 'http://www.tripadvisor.es/Restaurant_Review-g187529-d4432573-Reviews-La_Tagliatella_CC_Aqua_El_Grau_Poblados_maritimos_Restaurante_italiano_en_Valenci.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID3650', 'http://www.tripadvisor.es/Restaurant_Review-g187522-d993744-Reviews-L_antiga_Valenciana_SL-Castellon_de_la_Plana_Castellon_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID0233', 'http://www.tripadvisor.es/Restaurant_Review-g673855-d3196137-Reviews-La_Bahia-Playa_de_Orihuela_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID0488', 'http://www.tripadvisor.es/Restaurant_Review-g736284-d4132406-Reviews-Cafe_Chic-Moraira_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID0190', 'http://www.tripadvisor.es/Restaurant_Review-g1064230-d4557324-Reviews-Arroseria_La_Foguera-Alicante_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID4927', 'http://www.tripadvisor.es/Restaurant_Review-g187529-d993266-Reviews-Navarro-Valencia_Valencia_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID1940', 'http://www.tripadvisor.es/Restaurant_Review-g661469-d1904012-Reviews-Raco_d_Anna-Elche_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID5611', 'http://www.tripadvisor.es/Restaurant_Review-g1028189-d1408611-Reviews-La_Vaca_Argentina_Paterna-Paterna_Valencia_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID2514', 'http://www.tripadvisor.es/Restaurant_Review-g187527-d4607819-Reviews-Spud_Murphy_s-Torrevieja_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID5219', 'http://www.tripadvisor.es/Restaurant_Review-g659600-d987508-Reviews-Restaurante_La_Llimera-Gandia_Valencia_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID4665', 'http://www.tripadvisor.es/Restaurant_Review-g1063729-d3580729-Reviews-Insigne-Chiva_Valencia_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID4716', 'http://www.tripadvisor.es/Restaurant_Review-g666526-d2308242-Reviews-L_Alegre-Cullera_Valencia_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID4522', 'http://www.tripadvisor.es/Restaurant_Review-g659600-d987496-Reviews-Emilio-Gandia_Valencia_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID1457', 'http://www.tripadvisor.es/Restaurant_Review-g609044-d987283-Reviews-Mcdonald_Javea-Javea_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID5043', 'http://www.tripadvisor.es/Restaurant_Review-g1888695-d3545341-Reviews-Pizzeria_El_Italiano-Lliria_Valencia_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID0429', 'http://www.tripadvisor.es/Restaurant_Review-g187526-d1978415-Reviews-Boomerang_Steakhouse-Calpe_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID1339', 'http://www.tripadvisor.es/Restaurant_Review-g187525-d2316079-Reviews-Little_Belfast_Bar_Benidorm-Benidorm_Costa_Blanca_Alicante_Province_Valencian_Cou.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID2066', 'http://www.tripadvisor.es/Restaurant_Review-g187526-d4323299-Reviews-Restaurante_Capri-Calpe_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID2859', 'http://www.tripadvisor.es/Restaurant_Review-g187525-d3258135-Reviews-Western_Saloon_benidorm-Benidorm_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID4783', 'http://www.tripadvisor.es/Restaurant_Review-g187529-d2648119-Reviews-Lluna_de_Bolseria-Valencia_Valencia_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID2064', 'http://www.tripadvisor.es/Restaurant_Review-g947010-d3545668-Reviews-Restaurante_Candela-Campello_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID4739', 'http://www.tripadvisor.es/Restaurant_Review-g187529-d1478322-Reviews-Lagrimas_Negras-Valencia_Valencia_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID5629', 'http://www.tripadvisor.es/Restaurant_Review-g672740-d4055345-Reviews-Victor_Restaurante-Tabernes_de_Valldigna_Valencia_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID5146', 'http://www.tripadvisor.es/Restaurant_Review-g187529-d1234297-Reviews-Restaurante_Azahar-Valencia_Valencia_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID5128', 'http://www.tripadvisor.es/Restaurant_Review-g1078811-d2313019-Reviews-Restaurant_Frida-Puerto_de_Sagunto_Valencia_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID2854', 'http://www.tripadvisor.es/Restaurant_Review-g609043-d4559280-Reviews-Wan_Ke_Long_denia-Denia_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID2195', 'http://www.tripadvisor.es/Restaurant_Review-g1064230-d1860584-Reviews-Restaurante_La_Roda_The_Red_Tables-Alicante_Costa_Blanca_Alicante_Province_Valen.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID1359', 'http://www.tripadvisor.es/Restaurant_Review-g3604892-d3721921-Reviews-Lo_Gus-Orihuela_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID0777', 'http://www.tripadvisor.es/Restaurant_Review-g947009-d993975-Reviews-El_Cisne-Santa_Pola_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
 

  end
  
end

Then /^QBot should get a snapshot$/ do

end
