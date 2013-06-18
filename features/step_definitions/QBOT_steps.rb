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
    
	page.launch idLaunch, 'TopRural_ReviewList.Casas-Rurales-Ordesa_23244', 'http://m.toprural.com/Casa-rural-habitaciones/Casas-Rurales-Ordesa_23244/opiniones_op.html?page=12', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Balc%C3%B3n-Del-Pirineo_26485', 'http://m.toprural.com/Casa-rural-habitaciones/Balc%C3%B3n-Del-Pirineo_26485/opiniones_op.html?page=12', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Era-De-Cal-Tom%C3%A0s_26412', 'http://m.toprural.com/Casa-rural-habitaciones/Era-De-Cal-Tom%C3%A0s_26412/opiniones_op.html?page=11', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Cal-Miquel_28046', 'http://m.toprural.com/Casa-rural-habitaciones/Cal-Miquel_28046/opiniones_op.html?page=11', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casas-Rurales-La-Ribera_19532', 'http://m.toprural.com/Casa-rural-habitaciones/Casas-Rurales-La-Ribera_19532/opiniones_op.html?page=10', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Hotel-Roca-Blanca_23153', 'http://m.toprural.com/Casa-rural-habitaciones/Hotel-Roca-Blanca_23153/opiniones_op.html?page=10', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Hotel-La-Casa-Del-R%C3%ADo_27611', 'http://m.toprural.com/Casa-rural-habitaciones/Hotel-La-Casa-Del-R%C3%ADo_27611/opiniones_op.html?page=9', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Sant-Grau_15593', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Sant-Grau_15593/opiniones_op.html?page=9', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Sorripas_30331', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Sorripas_30331/opiniones_op.html?page=8', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Apartamentos-Ib%C3%B3n_38116', 'http://m.toprural.com/Casa-rural-habitaciones/Apartamentos-Ib%C3%B3n_38116/opiniones_op.html?page=7', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.La-Caseta-De-Postils_24110', 'http://m.toprural.com/Casa-rural-habitaciones/La-Caseta-De-Postils_24110/opiniones_op.html?page=7', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.La-Borda-De-Giral_28161', 'http://m.toprural.com/Casa-rural-habitaciones/La-Borda-De-Giral_28161/opiniones_op.html?page=7', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Del-Batlle_25351', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Del-Batlle_25351/opiniones_op.html?page=7', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Muro_13476', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Muro_13476/opiniones_op.html?page=7', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Tierras-De-Ar%C3%A1n_34368', 'http://m.toprural.com/Casa-rural-habitaciones/Tierras-De-Ar%C3%A1n_34368/opiniones_op.html?page=6', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Rural-Campacruz_38327', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Rural-Campacruz_38327/opiniones_op.html?page=6', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Hotel-Valle-De-Pineta_23426', 'http://m.toprural.com/Casa-rural-habitaciones/Hotel-Valle-De-Pineta_23426/opiniones_op.html?page=6', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Hotel-Apartamentos-De-Monta%C3%B1a-Us%C3%B3n_16897', 'http://m.toprural.com/Casa-rural-habitaciones/Hotel-Apartamentos-De-Monta%C3%B1a-Us%C3%B3n_16897/opiniones_op.html?page=6', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.El-Rinc%C3%B3n-De-Usana_23404', 'http://m.toprural.com/Casa-rural-habitaciones/El-Rinc%C3%B3n-De-Usana_23404/opiniones_op.html?page=6', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Cal-Raich_23251', 'http://m.toprural.com/Casa-rural-habitaciones/Cal-Raich_23251/opiniones_op.html?page=6', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Cal-Marti_25584', 'http://m.toprural.com/Casa-rural-habitaciones/Cal-Marti_25584/opiniones_op.html?page=6', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Apartamentos-Fogar%C3%B3n_28338', 'http://m.toprural.com/Casa-rural-habitaciones/Apartamentos-Fogar%C3%B3n_28338/opiniones_op.html?page=5', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Apartamentos-Casa-Pab%C3%A1n_28313', 'http://m.toprural.com/Casa-rural-habitaciones/Apartamentos-Casa-Pab%C3%A1n_28313/opiniones_op.html?page=5', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Villar%C3%B3-De-La-Llena_22480', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Villar%C3%B3-De-La-Llena_22480/opiniones_op.html?page=5', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Mur-De-Aluj%C3%A1n_24951', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Mur-De-Aluj%C3%A1n_24951/opiniones_op.html?page=5', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Las-Casas-De-Satu%C3%A9_23667', 'http://m.toprural.com/Casa-rural-habitaciones/Las-Casas-De-Satu%C3%A9_23667/opiniones_op.html?page=5', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Les-Cots-De-Lloberola_23765', 'http://m.toprural.com/Casa-rural-habitaciones/Les-Cots-De-Lloberola_23765/opiniones_op.html?page=5', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Arrufat_20506', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Arrufat_20506/opiniones_op.html?page=5', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Apartaments-Les-Picardes_23617', 'http://m.toprural.com/Casa-rural-habitaciones/Apartaments-Les-Picardes_23617/opiniones_op.html?page=5', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Cal-Pintor_36032', 'http://m.toprural.com/Casa-rural-habitaciones/Cal-Pintor_36032/opiniones_op.html?page=5', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Rural-Y-Chic_46277', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Rural-Y-Chic_46277/opiniones_op.html?page=5', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.El-Pla-De-Montpol-La-Torra-Y-Sa%C3%BCquer_15590', 'http://m.toprural.com/Casa-rural-habitaciones/El-Pla-De-Montpol-La-Torra-Y-Sa%C3%BCquer_15590/opiniones_op.html?page=5', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.El-Call-D%27oden-I-Ii-Y-Iii_16124', 'http://m.toprural.com/Casa-rural-habitaciones/El-Call-D%27oden-I-Ii-Y-Iii_16124/opiniones_op.html?page=5', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Cal-Miquel_21806', 'http://m.toprural.com/Casa-rural-habitaciones/Cal-Miquel_21806/opiniones_op.html?page=5', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.La-Era-Juanico_36150', 'http://m.toprural.com/Casa-rural-habitaciones/La-Era-Juanico_36150/opiniones_op.html?page=4', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-El-Franc%C3%A9s_24732', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-El-Franc%C3%A9s_24732/opiniones_op.html?page=4', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Cal-Maso_23036', 'http://m.toprural.com/Casa-rural-habitaciones/Cal-Maso_23036/opiniones_op.html?page=4', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Carpintera_13467', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Carpintera_13467/opiniones_op.html?page=4', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Lacoma_13474', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Lacoma_13474/opiniones_op.html?page=4', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Cal-Caminer_22298', 'http://m.toprural.com/Casa-rural-habitaciones/Cal-Caminer_22298/opiniones_op.html?page=4', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Portal-Del-Rom%C3%A0nic_39637', 'http://m.toprural.com/Casa-rural-habitaciones/Portal-Del-Rom%C3%A0nic_39637/opiniones_op.html?page=4', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.L%C2%B4era-De-Cal-Bastida_30076', 'http://m.toprural.com/Casa-rural-habitaciones/L%C2%B4era-De-Cal-Bastida_30076/opiniones_op.html?page=4', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Marc%C3%BAs-Casa-Rural_95366', 'http://m.toprural.com/Casa-rural-habitaciones/Marc%C3%BAs-Casa-Rural_95366/opiniones_op.html?page=4', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Bernat_40410', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Bernat_40410/opiniones_op.html?page=4', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Font-De-Seur%C3%AD_22763', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Font-De-Seur%C3%AD_22763/opiniones_op.html?page=4', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Cal-Puro_24103', 'http://m.toprural.com/Casa-rural-habitaciones/Cal-Puro_24103/opiniones_op.html?page=4', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Les-Feixes-De-Cal-Margarit_60963', 'http://m.toprural.com/Casa-rural-habitaciones/Les-Feixes-De-Cal-Margarit_60963/opiniones_op.html?page=4', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Los-Tres-Albares_16589', 'http://m.toprural.com/Casa-rural-habitaciones/Los-Tres-Albares_16589/opiniones_op.html?page=4', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Les-Pletes_20679', 'http://m.toprural.com/Casa-rural-habitaciones/Les-Pletes_20679/opiniones_op.html?page=4', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Hotel-Muntanya-Spa_22105', 'http://m.toprural.com/Casa-rural-habitaciones/Hotel-Muntanya-Spa_22105/opiniones_op.html?page=4', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casas-Rurales-Fantova-Y-Solpueyo_15120', 'http://m.toprural.com/Casa-rural-habitaciones/Casas-Rurales-Fantova-Y-Solpueyo_15120/opiniones_op.html?page=4', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Cal-Joan-Del-Batlle_41668', 'http://m.toprural.com/Casa-rural-habitaciones/Cal-Joan-Del-Batlle_41668/opiniones_op.html?page=4', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Castel_23639', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Castel_23639/opiniones_op.html?page=4', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Mol%C3%AD-D%C2%B4enfesta_22363', 'http://m.toprural.com/Casa-rural-habitaciones/Mol%C3%AD-D%C2%B4enfesta_22363/opiniones_op.html?page=4', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Sue%C3%B1os-De-Guara_24389', 'http://m.toprural.com/Casa-rural-habitaciones/Sue%C3%B1os-De-Guara_24389/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.La-Torra-De-Llobera_19725', 'http://m.toprural.com/Casa-rural-habitaciones/La-Torra-De-Llobera_19725/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Hotel-Rural-El-Xalet-De-Ta%C3%BCll_23286', 'http://m.toprural.com/Casa-rural-habitaciones/Hotel-Rural-El-Xalet-De-Ta%C3%BCll_23286/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Els-Hostalets_42409', 'http://m.toprural.com/Casa-rural-habitaciones/Els-Hostalets_42409/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Perramon_27462', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Perramon_27462/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Dembas-De-Guara_53880', 'http://m.toprural.com/Casa-rural-habitaciones/Dembas-De-Guara_53880/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.El-Prat_23401', 'http://m.toprural.com/Casa-rural-habitaciones/El-Prat_23401/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.L%27era-De-Sansa_17464', 'http://m.toprural.com/Casa-rural-habitaciones/L%27era-De-Sansa_17464/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Ca-La-Cecilia_34438', 'http://m.toprural.com/Casa-rural-habitaciones/Ca-La-Cecilia_34438/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.La-Llosa-Del-Cavall_22884', 'http://m.toprural.com/Casa-rural-habitaciones/La-Llosa-Del-Cavall_22884/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Mas%C3%ADa-Lola_22259', 'http://m.toprural.com/Casa-rural-habitaciones/Mas%C3%ADa-Lola_22259/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Albergue-Torre-Del-Bar%C3%B3_23562', 'http://m.toprural.com/Casa-rural-habitaciones/Albergue-Torre-Del-Bar%C3%B3_23562/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Can-Rabasser_34869', 'http://m.toprural.com/Casa-rural-habitaciones/Can-Rabasser_34869/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Lo-Paller-De-Roc_37543', 'http://m.toprural.com/Casa-rural-habitaciones/Lo-Paller-De-Roc_37543/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.La-Estibialla_24656', 'http://m.toprural.com/Casa-rural-habitaciones/La-Estibialla_24656/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Minguaso_39463', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Minguaso_39463/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Eguzkilore_80424', 'http://m.toprural.com/Casa-rural-habitaciones/Eguzkilore_80424/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Jaca_89722', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Jaca_89722/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-La-Vi%C3%B1a_16935', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-La-Vi%C3%B1a_16935/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Camping-Del-Remei_23026', 'http://m.toprural.com/Casa-rural-habitaciones/Camping-Del-Remei_23026/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Utxafava_24885', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Utxafava_24885/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Sant-Joan_24459', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Sant-Joan_24459/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Rural-El-Pajar-I-Y-Ii_40162', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Rural-El-Pajar-I-Y-Ii_40162/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Cal-Tristany_20642', 'http://m.toprural.com/Casa-rural-habitaciones/Cal-Tristany_20642/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Era-De-Cal-Gol_20417', 'http://m.toprural.com/Casa-rural-habitaciones/Era-De-Cal-Gol_20417/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Cal-Farr%C3%A9_24268', 'http://m.toprural.com/Casa-rural-habitaciones/Cal-Farr%C3%A9_24268/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.L%C2%B4oliva_80309', 'http://m.toprural.com/Casa-rural-habitaciones/L%C2%B4oliva_80309/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Lord%C3%A1n_95767', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Lord%C3%A1n_95767/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Tomaso_25034', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Tomaso_25034/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Rural-De-La-Franja_20768', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Rural-De-La-Franja_20768/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Bardaj%C3%AD_15055', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Bardaj%C3%AD_15055/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Cal-Bernoi_22602', 'http://m.toprural.com/Casa-rural-habitaciones/Cal-Bernoi_22602/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Miralles_15597', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Miralles_15597/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Serra-De-Dalt_23048', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Serra-De-Dalt_23048/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Apartamentos-Mazcaray_15040', 'http://m.toprural.com/Casa-rural-habitaciones/Apartamentos-Mazcaray_15040/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Cal-Drag%C3%B3_91830', 'http://m.toprural.com/Casa-rural-habitaciones/Cal-Drag%C3%B3_91830/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Cal-Mingo_22701', 'http://m.toprural.com/Casa-rural-habitaciones/Cal-Mingo_22701/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Masia-Estany_38420', 'http://m.toprural.com/Casa-rural-habitaciones/Masia-Estany_38420/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Lueza_25844', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Lueza_25844/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Cal-Mas_24037', 'http://m.toprural.com/Casa-rural-habitaciones/Cal-Mas_24037/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Ventoldra_27229', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Ventoldra_27229/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Apartaments-Era-Baix_22557', 'http://m.toprural.com/Casa-rural-habitaciones/Apartaments-Era-Baix_22557/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Borrells-Rural_24300', 'http://m.toprural.com/Casa-rural-habitaciones/Borrells-Rural_24300/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Bestregui_52526', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Bestregui_52526/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Pochetas_28882', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Pochetas_28882/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Sall%C3%A1n_13490', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Sall%C3%A1n_13490/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.La-Cicuarala_81821', 'http://m.toprural.com/Casa-rural-habitaciones/La-Cicuarala_81821/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casas-Rurales-La-Salada_22732', 'http://m.toprural.com/Casa-rural-habitaciones/Casas-Rurales-La-Salada_22732/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Mas%C3%ADa-Pedrolet_21573', 'http://m.toprural.com/Casa-rural-habitaciones/Mas%C3%ADa-Pedrolet_21573/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Cal-Comorera_34419', 'http://m.toprural.com/Casa-rural-habitaciones/Cal-Comorera_34419/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Cal-Gom%C3%A0_29936', 'http://m.toprural.com/Casa-rural-habitaciones/Cal-Gom%C3%A0_29936/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Mas%C3%ADa-De-Solanes_22323', 'http://m.toprural.com/Casa-rural-habitaciones/Mas%C3%ADa-De-Solanes_22323/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Os-Ormos_28847', 'http://m.toprural.com/Casa-rural-habitaciones/Os-Ormos_28847/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.El-Frag%C3%ADn_28622', 'http://m.toprural.com/Casa-rural-habitaciones/El-Frag%C3%ADn_28622/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Herrero_13499', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Herrero_13499/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Mas%C3%ADa-Vilalta_30268', 'http://m.toprural.com/Casa-rural-habitaciones/Mas%C3%ADa-Vilalta_30268/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Ca-L%27albareda-Masia-Antaviana_21626', 'http://m.toprural.com/Casa-rural-habitaciones/Ca-L%27albareda-Masia-Antaviana_21626/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Torre-De-Mejanell_81660', 'http://m.toprural.com/Casa-rural-habitaciones/Torre-De-Mejanell_81660/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Hostal-La-Pla%C3%A7a_36529', 'http://m.toprural.com/Casa-rural-habitaciones/Hostal-La-Pla%C3%A7a_36529/opiniones_op.html?page=3', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Puerta-De-Ordesa-Apartamentos_83634', 'http://m.toprural.com/Casa-rural-habitaciones/Puerta-De-Ordesa-Apartamentos_83634/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Alfonso_39156', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Alfonso_39156/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.La-Era-De-Navarri_23771', 'http://m.toprural.com/Casa-rural-habitaciones/La-Era-De-Navarri_23771/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Marquet_23986', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Marquet_23986/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Albergue-A-Borda-Felices_24975', 'http://m.toprural.com/Casa-rural-habitaciones/Albergue-A-Borda-Felices_24975/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.La-Borda-Castill%C3%B3n_25552', 'http://m.toprural.com/Casa-rural-habitaciones/La-Borda-Castill%C3%B3n_25552/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Granja-Fusilero_85827', 'http://m.toprural.com/Casa-rural-habitaciones/Granja-Fusilero_85827/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Purroy_92259', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Purroy_92259/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Teul%C3%A9_24118', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Teul%C3%A9_24118/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.L%C2%B4hort-Del-Metge_39039', 'http://m.toprural.com/Casa-rural-habitaciones/L%C2%B4hort-Del-Metge_39039/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Cal-Estasia_85297', 'http://m.toprural.com/Casa-rural-habitaciones/Cal-Estasia_85297/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Apartamentos-Villa-De-Plan_57121', 'http://m.toprural.com/Casa-rural-habitaciones/Apartamentos-Villa-De-Plan_57121/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.El-Pallero-Encuantra_78401', 'http://m.toprural.com/Casa-rural-habitaciones/El-Pallero-Encuantra_78401/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-L%C2%B4englata_51082', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-L%C2%B4englata_51082/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Basilisa_29850', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Basilisa_29850/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-El-Puy_88048', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-El-Puy_88048/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Barranco_36952', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Barranco_36952/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Sara_15112', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Sara_15112/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Las-Eras_41980', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Las-Eras_41980/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.El-Fest%C3%AD-Dels-Sentits_39624', 'http://m.toprural.com/Casa-rural-habitaciones/El-Fest%C3%AD-Dels-Sentits_39624/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Cal-Picarol_23434', 'http://m.toprural.com/Casa-rural-habitaciones/Cal-Picarol_23434/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Maria-Ant%C3%B2nia_27117', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Maria-Ant%C3%B2nia_27117/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Apartamentos-Rurales-Ponsa-D%C2%B4arfa_35421', 'http://m.toprural.com/Casa-rural-habitaciones/Apartamentos-Rurales-Ponsa-D%C2%B4arfa_35421/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.El-Jard%C3%AD_34857', 'http://m.toprural.com/Casa-rural-habitaciones/El-Jard%C3%AD_34857/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casas-Rurales-Molins_28998', 'http://m.toprural.com/Casa-rural-habitaciones/Casas-Rurales-Molins_28998/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-D%C2%B4a-Tienda-Y-Balc%C3%B3n-De-Guara_24601', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-D%C2%B4a-Tienda-Y-Balc%C3%B3n-De-Guara_24601/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Senz_28995', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Senz_28995/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Soltero-Apartamentos_68119', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Soltero-Apartamentos_68119/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Villamana_100302', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Villamana_100302/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.El-Rac%C3%B3-De-Cal-Mar%C3%B3_24219', 'http://m.toprural.com/Casa-rural-habitaciones/El-Rac%C3%B3-De-Cal-Mar%C3%B3_24219/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Corral_17435', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Corral_17435/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Cal-Manjo_26818', 'http://m.toprural.com/Casa-rural-habitaciones/Cal-Manjo_26818/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.L%C2%B4-Era-Del-Pol_26953', 'http://m.toprural.com/Casa-rural-habitaciones/L%C2%B4-Era-Del-Pol_26953/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Masia-Cal-Llorens_39960', 'http://m.toprural.com/Casa-rural-habitaciones/Masia-Cal-Llorens_39960/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Torellola_18282', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Torellola_18282/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Hostal-Canig%C3%B3_30290', 'http://m.toprural.com/Casa-rural-habitaciones/Hostal-Canig%C3%B3_30290/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Hotel-Rantiner_35688', 'http://m.toprural.com/Casa-rural-habitaciones/Hotel-Rantiner_35688/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Esperanza_28290', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Esperanza_28290/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Mairal_29508', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Mairal_29508/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Gistau_86327', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Gistau_86327/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Royo_36640', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Royo_36640/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Rural-Diez-Campanas_85299', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Rural-Diez-Campanas_85299/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-La-Era-De-Satu%C3%A9_16915', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-La-Era-De-Satu%C3%A9_16915/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Cal-Benet_40351', 'http://m.toprural.com/Casa-rural-habitaciones/Cal-Benet_40351/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Apartaments-La-Peguera_51922', 'http://m.toprural.com/Casa-rural-habitaciones/Apartaments-La-Peguera_51922/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Masia-Cal-Bola_78810', 'http://m.toprural.com/Casa-rural-habitaciones/Masia-Cal-Bola_78810/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Bar%C3%B3_28994', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Bar%C3%B3_28994/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casas-De-Zapatierno_15059', 'http://m.toprural.com/Casa-rural-habitaciones/Casas-De-Zapatierno_15059/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Centro-Vacacional-De-Is%C3%ADn_54318', 'http://m.toprural.com/Casa-rural-habitaciones/Centro-Vacacional-De-Is%C3%ADn_54318/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Pardinilla_18739', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Pardinilla_18739/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Roseta_69768', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Roseta_69768/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Hotel-Hosteria-De-Guara_24042', 'http://m.toprural.com/Casa-rural-habitaciones/Hotel-Hosteria-De-Guara_24042/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Rafela_25553', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Rafela_25553/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Pirineos_81259', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Pirineos_81259/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Ciavita_66916', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Ciavita_66916/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Los-Valles_63371', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Los-Valles_63371/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-S%C3%A1nchez_73888', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-S%C3%A1nchez_73888/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Rural-El-Olivar_82602', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Rural-El-Olivar_82602/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Cal-Pauet%C3%B3_36466', 'http://m.toprural.com/Casa-rural-habitaciones/Cal-Pauet%C3%B3_36466/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.El-Paller-De-L%C2%B4antonet_43093', 'http://m.toprural.com/Casa-rural-habitaciones/El-Paller-De-L%C2%B4antonet_43093/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Granges-De-Cal-Barber_35386', 'http://m.toprural.com/Casa-rural-habitaciones/Granges-De-Cal-Barber_35386/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''
    page.launch idLaunch, 'TopRural_ReviewList.Casa-Dalf%C3%B3_36000', 'http://m.toprural.com/Casa-rural-habitaciones/Casa-Dalf%C3%B3_36000/opiniones_op.html?page=2', '', '//footer[@id="footer"]', ''

     
  end
  
end

Then /^QBot should get a snapshot$/ do

end
