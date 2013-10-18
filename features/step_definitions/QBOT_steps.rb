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


page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID2538', 'http://www.tripadvisor.es/Restaurant_Review-g609044-d993770-Reviews-Sur-Javea_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID3768', 'http://www.tripadvisor.es/Restaurant_Review-g187522-d2391632-Reviews-Restaurante_Casa_Luisa-Castellon_de_la_Plana_Castellon_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID4533', 'http://www.tripadvisor.es/Restaurant_Review-g187529-d2077724-Reviews-Espaivisor-Valencia_Valencia_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID1925', 'http://www.tripadvisor.es/Restaurant_Review-g187523-d2190543-Reviews-Punjabi_Palace-Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID4388', 'http://www.tripadvisor.es/Restaurant_Review-g187529-d3616956-Reviews-Central_Bar-Valencia_Valencia_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID1452', 'http://www.tripadvisor.es/Restaurant_Review-g661469-d1766130-Reviews-Matola-Elche_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID3512', 'http://www.tripadvisor.es/Restaurant_Review-g187522-d993699-Reviews-Brisamar-Castellon_de_la_Plana_Castellon_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID4978', 'http://www.tripadvisor.es/Restaurant_Review-g659600-d992969-Reviews-La_Parrilla-Gandia_Valencia_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID2888', 'http://www.tripadvisor.es/Restaurant_Review-g661469-d1473534-Reviews-Yaho-Elche_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID1941', 'http://www.tripadvisor.es/Restaurant_Review-g736284-d2161184-Reviews-Raco_de_l_Arros-Moraira_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID0704', 'http://www.tripadvisor.es/Restaurant_Review-g1064230-d3318199-Reviews-Cerveceria_Piazza-Alicante_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID5089', 'http://www.tripadvisor.es/Restaurant_Review-g187529-d1930518-Reviews-Quiques_Restaurante-Valencia_Valencia_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID2634', 'http://www.tripadvisor.es/Restaurant_Review-g187528-d2687377-Reviews-Taverna_El_Posit-Villajoyosa_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID1779', 'http://www.tripadvisor.es/Restaurant_Review-g673855-d994036-Reviews-El_Pescadito-Playa_de_Orihuela_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID1791', 'http://www.tripadvisor.es/Restaurant_Review-g1064248-d2442351-Reviews-Piedra_De_Luna-Rojales_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID4110', 'http://www.tripadvisor.es/Restaurant_Review-g187529-d3479904-Reviews-Balzac_Lounge-Valencia_Valencia_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID1777', 'http://www.tripadvisor.es/Restaurant_Review-g1064230-d3436646-Reviews-Pesca_Al_Peso-Alicante_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID1475', 'http://www.tripadvisor.es/Restaurant_Review-g609043-d994181-Reviews-Menjars_Clareta-Denia_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID0804', 'http://www.tripadvisor.es/Restaurant_Review-g736284-d4097796-Reviews-Colby_s_Bar-Moraira_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID5202', 'http://www.tripadvisor.es/Restaurant_Review-g187529-d3805867-Reviews-Restaurante_Japones_Osaka_III-Valencia_Valencia_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID1784', 'http://www.tripadvisor.es/Restaurant_Review-g187526-d3859327-Reviews-Peter_Pam-Calpe_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID3613', 'http://www.tripadvisor.es/Restaurant_Review-g187522-d4308660-Reviews-Fushion_Japo_Tapas-Castellon_de_la_Plana_Castellon_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID4714', 'http://www.tripadvisor.es/Restaurant_Review-g187529-d1872984-Reviews-L_Albereda-Valencia_Valencia_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID5643', 'http://www.tripadvisor.es/Restaurant_Review-g187529-d4237252-Reviews-Vips-Valencia_Valencia_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID3624', 'http://www.tripadvisor.es/Restaurant_Review-g2435900-d4733300-Reviews-El_Holandes_Errante-Burriana_Castellon_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID2083', 'http://www.tripadvisor.es/Restaurant_Review-g2057037-d4059888-Reviews-Restaurante_Charlot-Benejuzar_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID2587', 'http://www.tripadvisor.es/Restaurant_Review-g2419912-d3345822-Reviews-Taj_Mahal-Benijofar_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID3858', 'http://www.tripadvisor.es/Restaurant_Review-g187522-d3137094-Reviews-15_Tapas-Castellon_de_la_Plana_Castellon_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID2857', 'http://www.tripadvisor.es/Restaurant_Review-g666316-d3783182-Reviews-WAPI_gelato_lab-Altea_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID4261', 'http://www.tripadvisor.es/Restaurant_Review-g187529-d4696996-Reviews-Cafeteri_Amaneix-Valencia_Valencia_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID5172', 'http://www.tripadvisor.es/Restaurant_Review-g187529-d3685656-Reviews-Restaurante_Da_Antonella-Valencia_Valencia_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID2147', 'http://www.tripadvisor.es/Restaurant_Review-g652148-d3318191-Reviews-Restaurante_Enrique-L_Alfas_del_Pi_Costa_Blanca_Alicante_Province_Valencian_Count.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID3832', 'http://www.tripadvisor.es/Restaurant_Review-g1590681-d4059504-Reviews-Segobriga_Restaurante-Segorbe_Castellon_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID0684', 'http://www.tripadvisor.es/Restaurant_Review-g187524-d994713-Reviews-Cerveceria_Cactus_Cantina_SL-Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID5498', 'http://www.tripadvisor.es/Restaurant_Review-g187529-d3969477-Reviews-La_Tagliatella-Valencia_Valencia_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID0504', 'http://www.tripadvisor.es/Restaurant_Review-g661469-d4055999-Reviews-Cafeteria_Cricket-Elche_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID0377', 'http://www.tripadvisor.es/Restaurant_Review-g1064230-d3537079-Reviews-Bistro_le_Kanotier-Alicante_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID2030', 'http://www.tripadvisor.es/Restaurant_Review-g187526-d3627271-Reviews-Restaurante_antica_roma-Calpe_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID1501', 'http://www.tripadvisor.es/Restaurant_Review-g1238605-d3360126-Reviews-Meson_Rincon_De_Paco-San_Miguel_de_Salinas_Costa_Blanca_Alicante_Province_Valenc.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID0284', 'http://www.tripadvisor.es/Restaurant_Review-g1064230-d3380747-Reviews-Bar_Mavi-Alicante_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID1293', 'http://www.tripadvisor.es/Restaurant_Review-g736284-d3370156-Reviews-L_Esbardal-Moraira_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID1172', 'http://www.tripadvisor.es/Restaurant_Review-g736284-d2071238-Reviews-Himalaya_Tandoori-Moraira_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID1936', 'http://www.tripadvisor.es/Restaurant_Review-g1898634-d2325460-Reviews-Quesada_Fish_Chips-Ciudad_Quesada_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID2383', 'http://www.tripadvisor.es/Restaurant_Review-g736284-d1508972-Reviews-Rodolfo_Italian_Restaurant-Moraira_Costa_Blanca_Alicante_Province_Valencian_Count.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID1282', 'http://www.tripadvisor.es/Restaurant_Review-g666316-d4102782-Reviews-L_Airet_d_Altea-Altea_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID5462', 'http://www.tripadvisor.es/Restaurant_Review-g187529-d2396876-Reviews-Taberna_Alcazar-Valencia_Valencia_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID1626', 'http://www.tripadvisor.es/Restaurant_Review-g609044-d3584506-Reviews-Noray-Javea_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID0748', 'http://www.tripadvisor.es/Restaurant_Review-g947010-d987184-Reviews-China_House-Campello_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID5447', 'http://www.tripadvisor.es/Restaurant_Review-g2589988-d2519906-Reviews-Staccia_Buratta-Antella_Valencia_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID2535', 'http://www.tripadvisor.es/Restaurant_Review-g187523-d2696047-Reviews-Sunrise-Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID5483', 'http://www.tripadvisor.es/Restaurant_Review-g187529-d3512289-Reviews-Taberna_La_Senia-Valencia_Valencia_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
page.launch idLaunch, 'TRIPADVISOR_RestFicha.ID0896', 'http://www.tripadvisor.es/Restaurant_Review-g187525-d1817252-Reviews-Deja_Vu-Benidorm_Costa_Blanca_Alicante_Province_Valencian_Country.html', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
 

  end
  
end

Then /^QBot should get a snapshot$/ do

end
