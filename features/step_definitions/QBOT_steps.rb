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

	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.Huesca#1574', 'http://www.tripadvisor.es/VacationRentalReview-g2483511-d2610255-Holiday_House_Tramacastilla_del_Tena-Tramacastilla_de_Tena_Province_of_Huesca_Aragon.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.Lleida#0881', 'http://www.tripadvisor.es/VacationRentalReview-g187500-d2113104-Ca_La_Daina-Lleida_Province_of_Lleida_Catalonia.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.Lleida#0882', 'http://www.tripadvisor.es/VacationRentalReview-g2283833-d1999114-Montarto_Spacious_family_friendly_near_Salardu-Bagergue_Province_of_Lleida_Catalonia.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.Lleida#0883', 'http://www.tripadvisor.es/VacationRentalReview-g2587237-d1983833-Dera_Nheu_2_Perfect_for_families_or_groups_of_friends-Montesclado_Province_of_Lleida_.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.Lleida#0884', 'http://www.tripadvisor.es/VacationRentalReview-g2587237-d1983834-Dera_Nheu_1_Perfect_for_families_or_groups_of_friends-Montesclado_Province_of_Lleida_.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.Lleida#0885', 'http://www.tripadvisor.es/VacationRentalReview-g1594151-d3984863-Barcelona_living_like_a_local-Vallbona_De_Les_Monges_Province_of_Lleida_Catalonia.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.Lleida#0887', 'http://www.tripadvisor.es/VacationRentalReview-g1236096-d3336246-Farmhouse_in_a_stunning_location_Tremp_Lleida-Tremp_Province_of_Lleida_Catalonia.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.Lleida#0888', 'http://www.tripadvisor.es/VacationRentalReview-g1236096-d2455013-Casa_Rafela_village_house_in_the_Catalan_Pyrenees-Tremp_Province_of_Lleida_Catalonia.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.Lleida#0890', 'http://www.tripadvisor.es/VacationRentalReview-g2587029-d3286378-LAGOS_APART_PIRINEO_CATALAN-La_Torre_de_Cabdella_Province_of_Lleida_Catalonia.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.Lleida#0935', 'http://www.tripadvisor.es/VacationRentalReview-g2290784-d2617466-Masia_Can_Ros-Lladorre_Province_of_Lleida_Catalonia.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineoAragones#2437', 'http://www.tripadvisor.es/VacationRentalReview-g227873-d2611157-Urb_los_Valles-Jaca_Aragonian_Pyrenees_Aragon.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2344', 'http://www.tripadvisor.es/VacationRentalReview-g1072501-d2594234-Apartament_Bolvir-Bolvir_Catalonian_Pyrenees_Catalonia.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2345', 'http://www.tripadvisor.es/VacationRentalReview-g580330-d1974110-Beret_Design_and_space_with_garden-Tredos_Catalonian_Pyrenees_Catalonia.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2346', 'http://www.tripadvisor.es/VacationRentalReview-g580330-d2230608-Cap_dAran_With_a_private_transport_to_the_slopes-Tredos_Catalonian_Pyrenees_Catalonia.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2347', 'http://www.tripadvisor.es/VacationRentalReview-g652139-d1764689-Mijaran_1_New_perfect_for_groups-Vielha_Catalonian_Pyrenees_Catalonia.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2348', 'http://www.tripadvisor.es/VacationRentalReview-g187498-d2165618-Mas_Mitjavila_Beautiful_studio_rooms-Catalonian_Pyrenees_Catalonia.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2350', 'http://www.tripadvisor.es/VacationRentalReview-g652139-d1944549-Pleta_de_Vielha_Great_price_parking-Vielha_Catalonian_Pyrenees_Catalonia.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2351', 'http://www.tripadvisor.es/VacationRentalReview-g783972-d1765073-Val_Arties_3_Design_Wifi_in_Valle_de_Aran-Arties_Catalonian_Pyrenees_Catalonia.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2353', 'http://www.tripadvisor.es/VacationRentalReview-g783974-d2387774-Naut_Aran_Luxury_confort_3_kms_away_from_the_slopes-Salardu_Catalonian_Pyrenees_Catalo.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2355', 'http://www.tripadvisor.es/VacationRentalReview-g1745311-d1944565-Baciver_New_apartment_with_clear_views-Garos_Catalonian_Pyrenees_Catalonia.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2356', 'http://www.tripadvisor.es/VacationRentalReview-g783972-d1765074-Val_Arties_2_Design_Wifi-Arties_Catalonian_Pyrenees_Catalonia.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2357', 'http://www.tripadvisor.es/VacationRentalReview-g1745311-d1944566-Artiga_New_house_Aranesa_style-Garos_Catalonian_Pyrenees_Catalonia.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2358', 'http://www.tripadvisor.es/VacationRentalReview-g652139-d1764688-Nere_New_perfect_for_groups-Vielha_Catalonian_Pyrenees_Catalonia.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2360', 'http://www.tripadvisor.es/VacationRentalReview-g664637-d1974111-Bonaigua_The_best_price_on_the_slopes-Baqueira_Beret_Catalonian_Pyrenees_Catalonia.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2361', 'http://www.tripadvisor.es/VacationRentalReview-g664637-d4042748-Val_de_Ruda_Luxe_16_Views_next_to_the_gondola-Baqueira_Beret_Catalonian_Pyrenees_Catal.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2362', 'http://www.tripadvisor.es/VacationRentalReview-g664637-d1765071-Val_de_Ruda_2_Best_price_with_acces_to_the_ski_slopes-Baqueira_Beret_Catalonian_Pyrene.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2363', 'http://www.tripadvisor.es/VacationRentalReview-g652139-d2305795-Mijaran_3_New_perfect_for_groups-Vielha_Catalonian_Pyrenees_Catalonia.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2365', 'http://www.tripadvisor.es/VacationRentalReview-g664637-d3523608-Campalias_Close_to_the_skilift_Baqueira_1500-Baqueira_Beret_Catalonian_Pyrenees_Catalo.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2366', 'http://www.tripadvisor.es/VacationRentalReview-g664637-d4042723-Val_de_Ruda_Luxe_7_Exclusive_next_to_the_gondola_exit_Val_de_Ruda-Baqueira_Beret_Catal.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2367', 'http://www.tripadvisor.es/VacationRentalReview-g1745311-d1944567-Aiguamoig_New_Aranese_house-Garos_Catalonian_Pyrenees_Catalonia.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2368', 'http://www.tripadvisor.es/VacationRentalReview-g1745311-d1944563-Era_Lana_Traditional_house_with_garden-Garos_Catalonian_Pyrenees_Catalonia.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2370', 'http://www.tripadvisor.es/VacationRentalReview-g664637-d3463059-Nin_de_Beret_3_Wifi_right_at_the_slopes-Baqueira_Beret_Catalonian_Pyrenees_Catalonia.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2371', 'http://www.tripadvisor.es/VacationRentalReview-g664637-d2638400-Val_de_Ruda_12_Best_price_with_acces_to_the_ski_slopes-Baqueira_Beret_Catalonian_Pyren.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2372', 'http://www.tripadvisor.es/VacationRentalReview-g664637-d1765072-Val_de_Ruda_10_No_bunk_beds_right_beside_the_gondola_exit-Baqueira_Beret_Catalonian_Py.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2373', 'http://www.tripadvisor.es/VacationRentalReview-g664637-d3634483-Nin_de_Beret_1_Comfort_on_the_slopes-Baqueira_Beret_Catalonian_Pyrenees_Catalonia.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2375', 'http://www.tripadvisor.es/VacationRentalReview-g1745311-d1784440-Montcorbisson_Traditional_house_with_garden-Garos_Catalonian_Pyrenees_Catalonia.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2376', 'http://www.tripadvisor.es/VacationRentalReview-g664637-d1970350-Val_de_Ruda_8_Next_to_gondola_exit_Val_de_Ruda_with_parking-Baqueira_Beret_Catalonian_.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2377', 'http://www.tripadvisor.es/VacationRentalReview-g1745311-d1784426-Cauba_Yard_space-Garos_Catalonian_Pyrenees_Catalonia.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2378', 'http://www.tripadvisor.es/VacationRentalReview-g664637-d2230600-Pleta_de_Nheu_2_Exclusive_transport_to_the_ski_slopes-Baqueira_Beret_Catalonian_Pyrene.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2380', 'http://www.tripadvisor.es/VacationRentalReview-g664637-d1765069-Val_de_Ruda_4_Right_beside_the_gondola_exit_with_parking-Baqueira_Beret_Catalonian_Pyr.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2381', 'http://www.tripadvisor.es/VacationRentalReview-g664637-d1970352-Val_de_Ruda_1_Right_beside_the_gondola_exit-Baqueira_Beret_Catalonian_Pyrenees_Catalon.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2382', 'http://www.tripadvisor.es/VacationRentalReview-g664637-d4042736-Val_de_Ruda_Luxe_15_Well_appointed_on_the_slopes-Baqueira_Beret_Catalonian_Pyrenees_Ca.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2383', 'http://www.tripadvisor.es/VacationRentalReview-g664637-d3738444-Cap_1500_Brand_new_apartment_on_the_slopes-Baqueira_Beret_Catalonian_Pyrenees_Cataloni.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2384', 'http://www.tripadvisor.es/VacationRentalReview-g664637-d1765070-Val_de_Ruda_3_Right_beside_a_new_gondola_exit-Baqueira_Beret_Catalonian_Pyrenees_Catal.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2385', 'http://www.tripadvisor.es/VacationRentalReview-g664637-d3621946-Varrados_Cozy_5_kms_away_from_the_slopes-Baqueira_Beret_Catalonian_Pyrenees_Catalonia.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2386', 'http://www.tripadvisor.es/VacationRentalReview-g664637-d2508605-Vista_Baqueira_2_Wifi_big_capacity_right_at_the_feet_of_the_slopes-Baqueira_Beret_Cata.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2387', 'http://www.tripadvisor.es/VacationRentalReview-g664637-d3659340-Plaza_Garos_Refurbished_and_ample-Baqueira_Beret_Catalonian_Pyrenees_Catalonia.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2388', 'http://www.tripadvisor.es/VacationRentalReview-g783972-d2230597-Val_Arties_1_Has_Wifi-Arties_Catalonian_Pyrenees_Catalonia.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2390', 'http://www.tripadvisor.es/VacationRentalReview-g664637-d1765066-Val_de_Ruda_9_Walking_distance_to_the_ski_slopes-Baqueira_Beret_Catalonian_Pyrenees_Ca.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
	 page.launch idLaunch, 'TRIPADVISOR_HotelFicha.PirineuCatala#2391', 'http://www.tripadvisor.es/VacationRentalReview-g664637-d1765082-Nin_de_Beret_2_Wifi_easy_acces_to_the_ski_runs-Baqueira_Beret_Catalonian_Pyrenees_Cata.html?reviewExpanded=true', '//div[@class="pagination"]/div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]', '//*[@id="FOOT"]', ''
 

     
  end
  
end

Then /^QBot should get a snapshot$/ do

end
