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
    
    page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0002', 'http://www.tripadvisor.es/Attraction_Review-g1063735-d4185823-Reviews-Carrer_del_Balc-Manresa_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0003', 'http://www.tripadvisor.es/Attraction_Review-g665811-d2367560-Reviews-La_Casa_Alegre-Terrassa_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0005', 'http://www.tripadvisor.es/Attraction_Review-g1235034-d244840-Reviews-Catalonia_in_Miniature_Catalunya_en_Miniatura-Torrelles_de_Llobregat_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0012', 'http://www.tripadvisor.es/Attraction_Review-g1131930-d3265817-Reviews-Fundacio_Palau-Caldes_d_Estrac_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0017', 'http://www.tripadvisor.es/Attraction_Review-g652130-d3460451-Reviews-Igualada_Leather_Museum_Museu_de_la_Pell_d_Igualada-Igualada_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0018', 'http://www.tripadvisor.es/Attraction_Review-g652130-d3460423-Reviews-Igualada_Muleteer_s_Museum_Museu_del_Traginer_d_Igualada-Igualada_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0021', 'http://www.tripadvisor.es/Attraction_Review-g2048657-d4091286-Reviews-Moli_del_Mig-Mura_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0022', 'http://www.tripadvisor.es/Attraction_Review-g187501-d2209735-Reviews-Montserrat_Museum-Montserrat_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0033', 'http://www.tripadvisor.es/Attraction_Review-g1063737-d1867825-Reviews-Museo_Episcopal_de_Vic-Vic_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0035', 'http://www.tripadvisor.es/Attraction_Review-g1064295-d3847738-Reviews-Museo_Mares_del_Encaje-Arenys_de_Mar_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0039', 'http://www.tripadvisor.es/Attraction_Review-g911482-d2223554-Reviews-Museu_Agbar_de_Les_Aigues-Cornella_de_Llobregat_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0042', 'http://www.tripadvisor.es/Attraction_Review-g187502-d244233-Reviews-Museu_Cau_Ferrat-Sitges_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0050', 'http://www.tripadvisor.es/Attraction_Review-g675081-d3752920-Reviews-Museu_de_Gava_i_Mines_Prehistoriques-Gava_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0054', 'http://www.tripadvisor.es/Attraction_Review-g665811-d2020593-Reviews-Museu_de_la_Ciencia_i_de_la_Tecnica_de_Catalunya-Terrassa_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0060', 'http://www.tripadvisor.es/Attraction_Review-g673266-d2209523-Reviews-Museu_del_Ferrocarril-Vilanova_i_la_Geltru_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0072', 'http://www.tripadvisor.es/Attraction_Review-g1236053-d2352141-Reviews-Museu_industrial_del_Ter-Manlleu_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0073', 'http://www.tripadvisor.es/Attraction_Review-g187502-d244234-Reviews-Museu_Maricel-Sitges_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0075', 'http://www.tripadvisor.es/Attraction_Review-g665816-d3932772-Reviews-Museum_Badalona-Badalona_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0077', 'http://www.tripadvisor.es/Attraction_Review-g187502-d244235-Reviews-Museu_Romantic_Can_Llopis-Sitges_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0078', 'http://www.tripadvisor.es/Attraction_Review-g1969684-d2717858-Reviews-Museu_Romantico_Can_Papiol-Province_of_Barcelona_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0120', 'http://www.tripadvisor.es/Attraction_Review-g2284058-d2371036-Reviews-Ajuntament_de_Montmajor-Montmajor_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0137', 'http://www.tripadvisor.es/Attraction_Review-g1064028-d1134855-Reviews-Castell_Medieval-Tordera_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0138', 'http://www.tripadvisor.es/Attraction_Review-g1064028-d3236349-Reviews-Castell_Medieval_Comte_de_Valltordera-Tordera_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0139', 'http://www.tripadvisor.es/Attraction_Review-g2284072-d3518762-Reviews-Castillo_de_Balsareny-Balsareny_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0140', 'http://www.tripadvisor.es/Attraction_Review-g2284063-d2371051-Reviews-Castrum_Serris-Casserres_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0145', 'http://www.tripadvisor.es/Attraction_Review-g187502-d3637495-Reviews-Church_of_Sant_Bartomeu_Santa_Tecla-Sitges_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0146', 'http://www.tripadvisor.es/Attraction_Review-g2284060-d2371044-Reviews-Church_of_Sant_Climent-L_Espunyola_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0150', 'http://www.tripadvisor.es/Attraction_Review-g1078737-d3367595-Reviews-Garraf_Budhist_Monastery-Olivella_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0151', 'http://www.tripadvisor.es/Attraction_Review-g793321-d776336-Reviews-Colonia_Guell_Gaudi_Crypt-Santa_Coloma_de_Cervello_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0152', 'http://www.tripadvisor.es/Attraction_Review-g2284065-d2371056-Reviews-Gironella_Cotton_Mills-Gironella_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0155', 'http://www.tripadvisor.es/Attraction_Review-g2048657-d4074698-Reviews-Iglesia_Romanica_de_Sant_Marti-Mura_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0156', 'http://www.tripadvisor.es/Attraction_Review-g2284072-d3637970-Reviews-Iglesia_Santa_Maria_de_Balsareny-Balsareny_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0157', 'http://www.tripadvisor.es/Attraction_Review-g2284068-d2662723-Reviews-Church_of_Saint_Marti-Puig_reig_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0160', 'http://www.tripadvisor.es/Attraction_Review-g1078737-d3857806-Reviews-Monasterio_Budista_del_Garraf_Sakya_Tashi_Ling-Olivella_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0161', 'http://www.tripadvisor.es/Attraction_Review-g187501-d191040-Reviews-Monasterio_de_Montserrat-Montserrat_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0163', 'http://www.tripadvisor.es/Attraction_Review-g2470245-d3223415-Reviews-Monestir_de_Santa_Maria_de_l_Estany-L_Estany_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0164', 'http://www.tripadvisor.es/Attraction_Review-g1063737-d1487233-Reviews-Monestir_de_Sant_Pere_de_Casserres-Vic_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0165', 'http://www.tripadvisor.es/Attraction_Review-g1235037-d1896027-Reviews-Mon_St_Benet-Sant_Fruitos_de_Bages_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0182', 'http://www.tripadvisor.es/Attraction_Review-g187501-d3136910-Reviews-Santa_Maria_de_Montserrat-Montserrat_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0183', 'http://www.tripadvisor.es/Attraction_Review-g1235435-d2278506-Reviews-Sant_Miquel_del_Fai-Sant_Feliu_de_Codines_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0187', 'http://www.tripadvisor.es/Attraction_Review-g2284068-d2371060-Reviews-The_Castle_of_Puig_Reig-Puig_reig_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0210', 'http://www.tripadvisor.es/Attraction_Review-g187501-d4127692-Reviews-Aeri_de_Montserrat-Montserrat_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0216', 'http://www.tripadvisor.es/Attraction_Review-g665811-d4090718-Reviews-Cartoixa_Castle-Terrassa_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0225', 'http://www.tripadvisor.es/Attraction_Review-g580327-d3672685-Reviews-The_Lighthouse_of_Calella-Calella_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0233', 'http://www.tripadvisor.es/Attraction_Review-g187502-d1755008-Reviews-Passeig_Maritim-Sitges_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0242', 'http://www.tripadvisor.es/Attraction_Review-g673266-d2531363-Reviews-Ribes_Roges_Tower-Vilanova_i_la_Geltru_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0244', 'http://www.tripadvisor.es/Attraction_Review-g187501-d1024323-Reviews-Sant_Joan_Funicular_Railway-Montserrat_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0283', 'http://www.tripadvisor.es/Attraction_Review-g1058625-d2068998-Reviews-Hotel_Insomnia-Berga_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0300', 'http://www.tripadvisor.es/Attraction_Review-g1080422-d3975723-Reviews-Teatre_Auditori_Sant_Cugat-Sant_Cugat_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0331', 'http://www.tripadvisor.es/Attraction_Review-g2444773-d3952320-Reviews-Aidina_Park-Carme_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0332', 'http://www.tripadvisor.es/Attraction_Review-g665816-d3842360-Reviews-Badalona_Beach-Badalona_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0334', 'http://www.tripadvisor.es/Attraction_Review-g1078960-d3505141-Reviews-Castanya_de_Viladrau-Viladrau_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0335', 'http://www.tripadvisor.es/Attraction_Review-g1078727-d3728526-Reviews-Coves_del_Salnitre-Collbato_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0336', 'http://www.tripadvisor.es/Attraction_Review-g580327-d3672705-Reviews-Dalmau_Park-Calella_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0337', 'http://www.tripadvisor.es/Attraction_Review-g675081-d3388385-Reviews-Gava_Mines_Archaeological_Park-Gava_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0338', 'http://www.tripadvisor.es/Attraction_Review-g2048657-d4074724-Reviews-Gorg_del_Padre-Mura_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0341', 'http://www.tripadvisor.es/Attraction_Review-g1236741-d3223575-Reviews-Les_Fonts_del_Llobregat-Castellar_de_n_Hug_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0343', 'http://www.tripadvisor.es/Attraction_Review-g1131931-d3367659-Reviews-Ocata_Beach-El_Masnou_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0349', 'http://www.tripadvisor.es/Attraction_Review-g665811-d2367222-Reviews-Parc_de_Vallparadis-Terrassa_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0350', 'http://www.tripadvisor.es/Attraction_Review-g642220-d2476648-Reviews-Parc_Francesc_Macia-Malgrat_de_Mar_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0352', 'http://www.tripadvisor.es/Attraction_Review-g1969684-d2191061-Reviews-Pedraforca-Province_of_Barcelona_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0353', 'http://www.tripadvisor.es/Attraction_Review-g187502-d1755010-Reviews-Platja_de_la_Barra-Sitges_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0354', 'http://www.tripadvisor.es/Attraction_Review-g187502-d3389921-Reviews-La_Playa_de_Sitges-Sitges_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0355', 'http://www.tripadvisor.es/Attraction_Review-g187502-d2254016-Reviews-Playa_Nudista_Cala_Balmins-Sitges_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0358', 'http://www.tripadvisor.es/Attraction_Review-g187501-d606362-Reviews-Sant_JeroMi-Montserrat_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0359', 'http://www.tripadvisor.es/Attraction_Review-g187502-d3514823-Reviews-Sausalito_Beach-Sitges_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0391', 'http://www.tripadvisor.es/Attraction_Review-g1236025-d3237249-Reviews-Barcelona_F1_Grand_Prix_Circuit_de_Catalunya-Montmelo_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0395', 'http://www.tripadvisor.es/Attraction_Review-g1236025-d4084715-Reviews-Circuit_de_catalyuna-Montmelo_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0397', 'http://www.tripadvisor.es/Attraction_Review-g3793675-d3929343-Reviews-Club_De_Golf_La_Roqueta-Castellgali_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0398', 'http://www.tripadvisor.es/Attraction_Review-g1940756-d3961920-Reviews-Club_De_Golf_Montanya-El_Brull_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0399', 'http://www.tripadvisor.es/Attraction_Review-g187502-d3963571-Reviews-Club_De_Golf_Terramar-Sitges_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0400', 'http://www.tripadvisor.es/Attraction_Review-g675099-d3963514-Reviews-Club_De_Golf_Vallromanes-Vallromanes_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0405', 'http://www.tripadvisor.es/Attraction_Review-g1063737-d3971225-Reviews-Golf_Public_Taradell-Vic_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0406', 'http://www.tripadvisor.es/Attraction_Review-g1235435-d3967031-Reviews-Golf_Sant_Feliu-Sant_Feliu_de_Codines_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0407', 'http://www.tripadvisor.es/Attraction_Review-g1078740-d3967063-Reviews-Golf_Sant_Joan-Rubi_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0408', 'http://www.tripadvisor.es/Attraction_Review-g1026844-d3967093-Reviews-Golf_Sant_Vicenc_de_Montalt-Sant_Vicenc_de_Montalt_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0409', 'http://www.tripadvisor.es/Attraction_Review-g1526061-d2508888-Reviews-Hipica_Canoves-Canoves_i_Samalus_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0410', 'http://www.tripadvisor.es/Attraction_Review-g642220-d3981661-Reviews-Kite_Paddel_Surf_Center_Catalunya-Malgrat_de_Mar_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0411', 'http://www.tripadvisor.es/Attraction_Review-g665811-d3968742-Reviews-Real_Club_De_Golf_El_Prat-Terrassa_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0415', 'http://www.tripadvisor.es/Attraction_Review-g1235489-d3971201-Reviews-Vilalba_Golf-La_Roca_del_Valles_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0461', 'http://www.tripadvisor.es/Attraction_Review-g3329417-d3936124-Reviews-Gimkana_Humor_Amarillo-Santa_Maria_de_Corco_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0468', 'http://www.tripadvisor.es/Attraction_Review-g783979-d4106298-Reviews-Karting_Cardedeu-Cardedeu_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0469', 'http://www.tripadvisor.es/Attraction_Review-g1174924-d2012653-Reviews-Marineland_Catalunya-Palafolls_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0542', 'http://www.tripadvisor.es/Attraction_Review-g642220-d2716446-Reviews-Anman_Mobile_Tours-Malgrat_de_Mar_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0545', 'http://www.tripadvisor.es/Attraction_Review-g1064294-d2174393-Reviews-Avantgarde_Limousine_Tours-Premia_de_Mar_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0561', 'http://www.tripadvisor.es/Attraction_Review-g968379-d4040224-Reviews-Barcelona_Exclusive_Private_Tours-Alella_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0602', 'http://www.tripadvisor.es/Attraction_Review-g911482-d2235349-Reviews-Barcelona_Turisme_Tour_RCD_Espanyol-Cornella_de_Llobregat_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0644', 'http://www.tripadvisor.es/Attraction_Review-g1063994-d3477549-Reviews-Espai_Xocolata_Simon_Coll-Sant_Sadurni_d_Anoia_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0646', 'http://www.tripadvisor.es/Attraction_Review-g642221-d2540146-Reviews-Excursions_Catalunya-Mataro_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0661', 'http://www.tripadvisor.es/Attraction_Review-g670666-d3573344-Reviews-Helicopteros_Mach_Barcelona-Granollers_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0670', 'http://www.tripadvisor.es/Attraction_Review-g1969684-d2507618-Reviews-Kon_Tiki_Barcelona_Private_Baloon_Tour-Province_of_Barcelona_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0681', 'http://www.tripadvisor.es/Attraction_Review-g187502-d1867273-Reviews-Open_Guide_Group-Sitges_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0685', 'http://www.tripadvisor.es/Attraction_Review-g1969684-d2358343-Reviews-Parque_mediombiental_de_gualba-Province_of_Barcelona_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0700', 'http://www.tripadvisor.es/Attraction_Review-g187502-d3440764-Reviews-Segway_Sitges-Sitges_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0703', 'http://www.tripadvisor.es/Attraction_Review-g911479-d2214277-Reviews-Spain_Day_Tours-Esplugues_de_Llobregat_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0706', 'http://www.tripadvisor.es/Attraction_Review-g1064295-d3704539-Reviews-Sport_Fishing_Barcelona-Arenys_de_Mar_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0718', 'http://www.tripadvisor.es/Attraction_Review-g1236744-d3366889-Reviews-El_Tren_del_Ciment-La_Pobla_de_Lillet_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0751', 'http://www.tripadvisor.es/Attraction_Review-g793622-d788533-Reviews-Albert_i_Noya-Sant_Pau_d_Ordal_Subirats_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0758', 'http://www.tripadvisor.es/Attraction_Review-g793622-d2317242-Reviews-Bodega_Eudald_Massana_Noya-Sant_Pau_d_Ordal_Subirats_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0759', 'http://www.tripadvisor.es/Attraction_Review-g1598763-d678061-Reviews-Bodega_J_Miquel_Jane-Font_Rubi_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0760', 'http://www.tripadvisor.es/Attraction_Review-g1744339-d234107-Reviews-Freixenet_Winery-Pacs_del_Penedes_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0761', 'http://www.tripadvisor.es/Attraction_Review-g1063994-d2308035-Reviews-Bodegas_Gramona-Sant_Sadurni_d_Anoia_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0762', 'http://www.tripadvisor.es/Attraction_Review-g1744339-d3392738-Reviews-Bodegas_Pares_Balta-Pacs_del_Penedes_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0763', 'http://www.tripadvisor.es/Attraction_Review-g1744339-d234108-Reviews-Segura_Viudas_Winery-Pacs_del_Penedes_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0764', 'http://www.tripadvisor.es/Attraction_Review-g1744339-d1065663-Reviews-Bodegas_Torres-Pacs_del_Penedes_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0766', 'http://www.tripadvisor.es/Attraction_Review-g187502-d2096420-Reviews-Casa_Bacardi_Sitges-Sitges_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0768', 'http://www.tripadvisor.es/Attraction_Review-g1063994-d2509207-Reviews-Cava_Recaredo-Sant_Sadurni_d_Anoia_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0769', 'http://www.tripadvisor.es/Attraction_Review-g1063738-d1818114-Reviews-Cavas_Nadal-Vilafranca_del_Penedes_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0770', 'http://www.tripadvisor.es/Attraction_Review-g3679754-d4097464-Reviews-Cava_Sola_Raventos-Sant_Sadurni_d_Anoia_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0771', 'http://www.tripadvisor.es/Attraction_Review-g1063994-d1863393-Reviews-Codorniu-Sant_Sadurni_d_Anoia_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0772', 'http://www.tripadvisor.es/Attraction_Review-g1078726-d3506262-Reviews-Finca_Viladellops-Canyelles_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0777', 'http://www.tripadvisor.es/Attraction_Review-g3679754-d3678746-Reviews-Pere_Ventura-Sant_Sadurni_d_Anoia_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0780', 'http://www.tripadvisor.es/Attraction_Review-g1744339-d1594692-Reviews-Torres_Winery_Penedes-Pacs_del_Penedes_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0818', 'http://www.tripadvisor.es/Attraction_Review-g187502-d3953277-Reviews-Casa_Relajese-Sitges_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0823', 'http://www.tripadvisor.es/Attraction_Review-g665811-d3567274-Reviews-Kainis_Rituals-Terrassa_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0829', 'http://www.tripadvisor.es/Attraction_Review-g642221-d2509196-Reviews-Natural_Tea_Fish_Spa-Mataro_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0835', 'http://www.tripadvisor.es/Attraction_Review-g665816-d2717934-Reviews-Stress_Zero_Float_Center-Badalona_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0870', 'http://www.tripadvisor.es/Attraction_Review-g227870-d2076482-Reviews-Altus_Aviacion-Sabadell_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0873', 'http://www.tripadvisor.es/Attraction_Review-g652130-d2085178-Reviews-Barcelona_Ballooning-Igualada_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0875', 'http://www.tripadvisor.es/Attraction_Review-g1969684-d2353147-Reviews-Barcelona_Helicopters-Province_of_Barcelona_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0882', 'http://www.tripadvisor.es/Attraction_Review-g1063995-d4002017-Reviews-Comarca_Aventura-Arenys_de_Munt_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0883', 'http://www.tripadvisor.es/Attraction_Review-g1063737-d3975944-Reviews-Diversub-Vic_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0885', 'http://www.tripadvisor.es/Attraction_Review-g670666-d2218953-Reviews-Globubolg-Granollers_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0930', 'http://www.tripadvisor.es/Attraction_Review-g1063738-d4003240-Reviews-Artcava-Vilafranca_del_Penedes_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#0943', 'http://www.tripadvisor.es/Attraction_Review-g187502-d3224316-Reviews-Salsa_Verde_Cooking_School-Sitges_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#1058', 'http://www.tripadvisor.es/Attraction_Review-g227870-d4178756-Reviews-Destapa_t_Sabadell-Sabadell_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#1059', 'http://www.tripadvisor.es/Attraction_Review-g580327-d3643430-Reviews-Disco_Menfis-Calella_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#1079', 'http://www.tripadvisor.es/Attraction_Review-g187502-d3735055-Reviews-La_Locacola-Sitges_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#1092', 'http://www.tripadvisor.es/Attraction_Review-g187502-d624119-Reviews-Orek_s-Sitges_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#1097', 'http://www.tripadvisor.es/Attraction_Review-g665816-d4145786-Reviews-4_Pedres-Badalona_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#1098', 'http://www.tripadvisor.es/Attraction_Review-g187502-d1908995-Reviews-Pub_Voramar-Sitges_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#1101', 'http://www.tripadvisor.es/Attraction_Review-g187502-d3367410-Reviews-Ruby_s_Bar-Sitges_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#1121', 'http://www.tripadvisor.es/Attraction_Review-g187502-d4005183-Reviews-Villa_Lola-Sitges_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#1158', 'http://www.tripadvisor.es/Attraction_Review-g911481-d2085205-Reviews-Row14-Viladecans_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#1203', 'http://www.tripadvisor.es/Attraction_Review-g2048657-d4090932-Reviews-Antiguitats_El_Retaule-Mura_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#1222', 'http://www.tripadvisor.es/Attraction_Review-g2284072-d2371074-Reviews-Els_Culos-Balsareny_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#1258', 'http://www.tripadvisor.es/Attraction_Review-g1235489-d2141885-Reviews-La_Roca_Village-La_Roca_del_Valles_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#1262', 'http://www.tripadvisor.es/Attraction_Review-g652137-d3514751-Reviews-Shopping_Lounge_Outlet_Multimarcas-Sant_Pere_de_Ribes_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''
	page.launch idLaunch, 'TAAtraccionesFicha.Dipu#1264', 'http://www.tripadvisor.es/Attraction_Review-g670666-d4211358-Reviews-The_Vintage-Granollers_Catalonia.html', '//*[@class="pgLinks"]/a[contains(@class,"pageNext")]', '//*[@id="FOOT"]', ''

     
  end
  
end

Then /^QBot should get a snapshot$/ do

end
