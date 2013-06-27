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
    
  page.launch idLaunch, 'portal_ListaOpiniones.Id_422', 'http://www.homelidays.es/ES-Alquileres-Vacaciones/170_Rental/ReputationForm-Ad-LIST.asp?PK_OFFRE=354671&POPUP=TRUE', '', '//*[@id="AnchorTop"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_436', 'http://www.homelidays.es/ES-Alquileres-Vacaciones/170_Rental/ReputationForm-Ad-LIST.asp?PK_OFFRE=403233&POPUP=TRUE', '', '//*[@id="AnchorTop"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_218', 'http://www.escapadarural.com/casa-rural/lleida/torre-del-baro/opiniones', '', '//*[@id="footer"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_419', 'http://www.homelidays.es/ES-Alquileres-Vacaciones/170_Rental/ReputationForm-Ad-LIST.asp?PK_OFFRE=67052&POPUP=TRUE', '', '//*[@id="AnchorTop"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_437', 'http://www.homelidays.es/ES-Alquileres-Vacaciones/170_Rental/ReputationForm-Ad-LIST.asp?PK_OFFRE=49811&POPUP=TRUE', '', '//*[@id="AnchorTop"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_435', 'http://www.homelidays.es/ES-Alquileres-Vacaciones/170_Rental/ReputationForm-Ad-LIST.asp?PK_OFFRE=423459&POPUP=TRUE', '', '//*[@id="AnchorTop"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_129', 'http://www.escapadarural.com/casa-rural/lleida/apartaments-tur--sticos-casa-masover-/opiniones', '', '//*[@id="footer"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_137', 'http://www.escapadarural.com/casa-rural/lleida/aparthotel-spa-areu/opiniones', '', '//*[@id="footer"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_178', 'http://www.escapadarural.com/casa-rural/lleida/borda-de-calvera/opiniones', '', '//*[@id="footer"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_045', 'http://www.clubrural.com/albergue/lleida/sort/ca-l0-anton_125146/opiniones', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_006', 'http://www.clubrural.com/casa-rural/lleida/osso-de-sio/ca-l0emilia_132358/opiniones', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_027', 'http://www.clubrural.com/casa-rural/lleida/montgai/ca-la-celia_134192/opiniones', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_394', 'http://www.escapadarural.com/casa-rural/lleida/ca-la-celia/opiniones', '', '//*[@id="footer"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_125', 'http://www.escapadarural.com/casa-rural/lleida/ca-l-anxica/opiniones', '', '//*[@id="footer"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_208', 'http://www.escapadarural.com/casa-rural/lleida/cal-bernoi/opiniones', '', '//*[@id="footer"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_023', 'http://www.clubrural.com/casa-rural/lleida/montgai/cal-manjo_125224/opiniones', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_215', 'http://www.escapadarural.com/casa-rural/lleida/cal-maso/opiniones', '', '//*[@id="footer"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_053', 'http://www.clubrural.com/casa-rural/lleida/belianes/cal-massot-de-belianes_127464/opiniones', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_134', 'http://www.escapadarural.com/casa-rural/lleida/cal-paris/opiniones', '', '//*[@id="footer"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_073', 'http://www.clubrural.com/casa-rural/lleida/l0-albages/cal-pauarro_142146/opiniones', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_122', 'http://www.escapadarural.com/casa-rural/lleida/cal-paueto/opiniones', '', '//*[@id="footer"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_098', 'http://www.clubrural.com/casa-rural/lleida/montfalco-murallat/cal-raich_124634/opiniones', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_342', 'http://www.escapadarural.com/casa-rural/lleida/cal-valls/opiniones', '', '//*[@id="footer"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_055', 'http://www.clubrural.com/pension/lleida/la-pobla-de-segur/can-fasersia_130568/opiniones', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_182', 'http://www.escapadarural.com/casa-rural/lleida/cantesset/opiniones', '', '//*[@id="footer"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_001', 'http://www.clubrural.com/casa-rural/lleida/nalec/casa-arrufat_126077/opiniones', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_205', 'http://www.escapadarural.com/casa-rural/lleida/casa-churchill/opiniones', '', '//*[@id="footer"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_423', 'http://www.homelidays.es/ES-Alquileres-Vacaciones/170_Rental/ReputationForm-Ad-LIST.asp?PK_OFFRE=101242&POPUP=TRUE', '', '//*[@id="AnchorTop"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_428', 'http://www.homelidays.es/ES-Alquileres-Vacaciones/170_Rental/ReputationForm-Ad-LIST.asp?PK_OFFRE=246351&POPUP=TRUE', '', '//*[@id="AnchorTop"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_433', 'http://www.homelidays.es/ES-Alquileres-Vacaciones/170_Rental/ReputationForm-Ad-LIST.asp?PK_OFFRE=320986&POPUP=TRUE', '', '//*[@id="AnchorTop"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_430', 'http://www.homelidays.es/ES-Alquileres-Vacaciones/170_Rental/ReputationForm-Ad-LIST.asp?PK_OFFRE=594474&POPUP=TRUE', '', '//*[@id="AnchorTop"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_442', 'http://www.homelidays.es/ES-Alquileres-Vacaciones/170_Rental/ReputationForm-Ad-LIST.asp?PK_OFFRE=589505&POPUP=TRUE', '', '//*[@id="AnchorTop"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_039', 'http://www.clubrural.com/casa-rural/lleida/oveix/casa-gris_128646/opiniones', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_004', 'http://www.clubrural.com/casa-rural/lleida/tavascan/casa-guillem_133872/opiniones', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_041', 'http://www.clubrural.com/masia/lleida/olius/casa-marcus_136115/opiniones', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_175', 'http://www.escapadarural.com/casa-rural/lleida/casa-massa/opiniones', '', '//*[@id="footer"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_439', 'http://www.homelidays.es/ES-Alquileres-Vacaciones/170_Rental/ReputationForm-Ad-LIST.asp?PK_OFFRE=300671&POPUP=TRUE', '', '//*[@id="AnchorTop"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_197', 'http://www.escapadarural.com/casa-rural/lleida/casa-olive/opiniones', '', '//*[@id="footer"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_168', 'http://www.escapadarural.com/casa-rural/lleida/casa-perdiu/opiniones', '', '//*[@id="footer"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_031', 'http://www.clubrural.com/casa-rural/lleida/llessui/casa-rogel_132944/opiniones', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_064', 'http://www.clubrural.com/hotel-rural/lleida/gramos/casa-rural-les-flors_129636/opiniones', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_056', 'http://www.clubrural.com/casa-rural/lleida/gosol/casa-rural-roca-roja-y-el-castell_126763/opiniones', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_259', 'http://www.escapadarural.com/casa-rural/lleida/castell-d-ogern/opiniones', '', '//*[@id="footer"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_420', 'http://www.homelidays.es/ES-Alquileres-Vacaciones/170_Rental/ReputationForm-Ad-LIST.asp?PK_OFFRE=265943&POPUP=TRUE', '', '//*[@id="AnchorTop"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_440', 'http://www.homelidays.es/ES-Alquileres-Vacaciones/170_Rental/ReputationForm-Ad-LIST.asp?PK_OFFRE=579209&POPUP=TRUE', '', '//*[@id="AnchorTop"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_431', 'http://www.homelidays.es/ES-Alquileres-Vacaciones/170_Rental/ReputationForm-Ad-LIST.asp?PK_OFFRE=279229&POPUP=TRUE', '', '//*[@id="AnchorTop"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_165', 'http://www.escapadarural.com/casa-rural/lleida/el-call-/opiniones', '', '//*[@id="footer"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_142', 'http://www.escapadarural.com/casa-rural/lleida/el-maset-del-vilosell/opiniones', '', '//*[@id="footer"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_080', 'http://www.clubrural.com/casa-rural/lleida/sant-llorenc-de-morunys/el-porxo-de-la-creu_134254/opiniones', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_425', 'http://www.homelidays.es/ES-Alquileres-Vacaciones/170_Rental/ReputationForm-Ad-LIST.asp?PK_OFFRE=267063&POPUP=TRUE', '', '//*[@id="AnchorTop"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_143', 'http://www.escapadarural.com/casa-rural/lleida/heretat-de-gu--rdia/opiniones', '', '//*[@id="footer"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_171', 'http://www.escapadarural.com/casa-rural/lleida/hostal-la-placa/opiniones', '', '//*[@id="footer"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_060', 'http://www.clubrural.com/hotel/lleida/vielha/hotel-acevi-val-d-aran-_125791/opiniones', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_066', 'http://www.clubrural.com/hotel/lleida/bellver-de-cerdanya/hotel-cal-rei-de-tallo_136612/opiniones', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_304', 'http://www.escapadarural.com/casa-rural/lleida/hotel-font-del-genil/opiniones', '', '//*[@id="footer"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_329', 'http://www.escapadarural.com/casa-rural/lleida/hotel-mirador/opiniones', '', '//*[@id="footer"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_054', 'http://www.clubrural.com/hotel-rural/lleida/granyena-de-les-garrigues/hotel-rural-la-garbinada-_127727/opiniones', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_034', 'http://www.clubrural.com/hotel/lleida/cellers--guardia-de-noguera-/hotel-terradets_125343/opiniones', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_441', 'http://www.homelidays.es/ES-Alquileres-Vacaciones/170_Rental/ReputationForm-Ad-LIST.asp?PK_OFFRE=160553&POPUP=TRUE', '', '//*[@id="AnchorTop"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_078', 'http://www.clubrural.com/casa-rural/lleida/naves/la-bertolina_133217/opiniones', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_139', 'http://www.escapadarural.com/casa-rural/lleida/la-bertolina/opiniones', '', '//*[@id="footer"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_414', 'http://www.escapadarural.com/casa-rural/lleida/la-caseta-de-postils/opiniones', '', '//*[@id="footer"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_061', 'http://www.clubrural.com/casa-rural/lleida/vallferosa/la-collita_125154/opiniones', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_160', 'http://www.escapadarural.com/casa-rural/lleida/la-fabrica/opiniones', '', '//*[@id="footer"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_438', 'http://www.homelidays.es/ES-Alquileres-Vacaciones/170_Rental/ReputationForm-Ad-LIST.asp?PK_OFFRE=593344&POPUP=TRUE', '', '//*[@id="AnchorTop"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_210', 'http://www.escapadarural.com/casa-rural/lleida/la-teuleria/opiniones', '', '//*[@id="footer"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_325', 'http://www.escapadarural.com/casa-rural/lleida/casa-vilardaga/opiniones', '', '//*[@id="footer"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_434', 'http://www.homelidays.es/ES-Alquileres-Vacaciones/170_Rental/ReputationForm-Ad-LIST.asp?PK_OFFRE=570231&POPUP=TRUE', '', '//*[@id="AnchorTop"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_429', 'http://www.homelidays.es/ES-Alquileres-Vacaciones/170_Rental/ReputationForm-Ad-LIST.asp?PK_OFFRE=436294&POPUP=TRUE', '', '//*[@id="AnchorTop"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_010', 'http://www.clubrural.com/casa-rural/lleida/ponts/masia-confos_133990/opiniones', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_424', 'http://www.homelidays.es/ES-Alquileres-Vacaciones/170_Rental/ReputationForm-Ad-LIST.asp?PK_OFFRE=235855&POPUP=TRUE', '', '//*[@id="AnchorTop"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_418', 'http://www.homelidays.es/ES-Alquileres-Vacaciones/170_Rental/ReputationForm-Ad-LIST.asp?PK_OFFRE=160950&POPUP=TRUE', '', '//*[@id="AnchorTop"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_432', 'http://www.homelidays.es/ES-Alquileres-Vacaciones/170_Rental/ReputationForm-Ad-LIST.asp?PK_OFFRE=344296&POPUP=TRUE', '', '//*[@id="AnchorTop"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_106', 'http://www.clubrural.com/pension/lleida/salardu/pension-montanha_133407/opiniones', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_421', 'http://www.homelidays.es/ES-Alquileres-Vacaciones/170_Rental/ReputationForm-Ad-LIST.asp?PK_OFFRE=183212&POPUP=TRUE', '', '//*[@id="AnchorTop"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_427', 'http://www.homelidays.es/ES-Alquileres-Vacaciones/170_Rental/ReputationForm-Ad-LIST.asp?PK_OFFRE=423460&POPUP=TRUE', '', '//*[@id="AnchorTop"]', ''
  page.launch idLaunch, 'portal_ListaOpiniones.Id_426', 'http://www.homelidays.es/ES-Alquileres-Vacaciones/170_Rental/ReputationForm-Ad-LIST.asp?PK_OFFRE=45197&POPUP=TRUE', '', '//*[@id="AnchorTop"]', ''

     
  end
  
end

Then /^QBot should get a snapshot$/ do

end
