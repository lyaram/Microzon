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
    
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_001', 'http://www.clubrural.com/albergue/lleida/sort/ca-l0-anton_125146/opiniones/cesar_17236', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_001', 'http://www.escapadarural.com/opinion/perfil-usuario/510fa3a86f5c3', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_002', 'http://www.clubrural.com/albergue/lleida/sort/ca-l0-anton_125146/opiniones/anna_10458', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_002', 'http://www.escapadarural.com/opinion/perfil-usuario/501cd44212657', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_003', 'http://www.clubrural.com/casa-rural/lleida/osso-de-sio/ca-l0emilia_132358/opiniones/loli-martinez-sanchez_11106', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_003', 'http://www.escapadarural.com/opinion/perfil-usuario/511ae2b48b4cc', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_004', 'http://www.clubrural.com/casa-rural/lleida/montgai/ca-la-celia_134192/opiniones/lina-jodar_13233', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_004', 'http://www.escapadarural.com/opinion/perfil-usuario/51c4aa28f0d12', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_005', 'http://www.clubrural.com/casa-rural/lleida/montgai/cal-manjo_125224/opiniones/magnifica-experiencia_7181', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_005', 'http://www.escapadarural.com/opinion/perfil-usuario/518cf94e2b252', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_006', 'http://www.clubrural.com/casa-rural/lleida/montgai/cal-manjo_125224/opiniones/maria_3724', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_006', 'http://www.escapadarural.com/opinion/perfil-usuario/51b0d47828d3f', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_007', 'http://www.clubrural.com/casa-rural/lleida/belianes/cal-massot-de-belianes_127464/opiniones/elisabeth_13198', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_007', 'http://www.escapadarural.com/opinion/perfil-usuario/501cf2c5484e1', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_008', 'http://www.clubrural.com/casa-rural/lleida/l0-albages/cal-pauarro_142146/opiniones/anabel-olivares_18882', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_008', 'http://www.escapadarural.com/opinion/perfil-usuario/517e902ed0165', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_009', 'http://www.clubrural.com/casa-rural/lleida/montfalco-murallat/cal-raich_124634/opiniones/esther_11313', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_009', 'http://www.escapadarural.com/opinion/perfil-usuario/51b5f55924521', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_010', 'http://www.clubrural.com/pension/lleida/la-pobla-de-segur/can-fasersia_130568/opiniones/julie-ham_9606', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_010', 'http://www.escapadarural.com/opinion/perfil-usuario/501cf8ac44399', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_011', 'http://www.clubrural.com/casa-rural/lleida/nalec/casa-arrufat_126077/opiniones/montserrat-arrufat_14630', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_011', 'http://www.escapadarural.com/opinion/perfil-usuario/5199e02506b0b', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_012', 'http://www.clubrural.com/casa-rural/lleida/nalec/casa-arrufat_126077/opiniones/annabel_10115', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_012', 'http://www.escapadarural.com/opinion/perfil-usuario/519b637714d13', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_013', 'http://www.clubrural.com/casa-rural/lleida/oveix/casa-gris_128646/opiniones/jaume_18292', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_013', 'http://www.escapadarural.com/opinion/perfil-usuario/518b7d07877db', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_014', 'http://www.clubrural.com/casa-rural/lleida/oveix/casa-gris_128646/opiniones/carme-i-francesc_12186', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_014', 'http://www.escapadarural.com/opinion/perfil-usuario/51992ac3a8784', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_015', 'http://www.clubrural.com/casa-rural/lleida/oveix/casa-gris_128646/opiniones/montse_9520', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_015', 'http://www.escapadarural.com/opinion/perfil-usuario/501cd96f92726', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_016', 'http://www.clubrural.com/casa-rural/lleida/oveix/casa-gris_128646/opiniones/bea_7976', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_016', 'http://www.escapadarural.com/opinion/perfil-usuario/513a49d272a98', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_017', 'http://www.clubrural.com/casa-rural/lleida/oveix/casa-gris_128646/opiniones/yolanda_7118', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_017', 'http://www.escapadarural.com/opinion/perfil-usuario/501cbfd427941', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_018', 'http://www.clubrural.com/casa-rural/lleida/oveix/casa-gris_128646/opiniones/jmayenco@hotmailes_6920', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_018', 'http://www.escapadarural.com/opinion/perfil-usuario/501cbfc587d51', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_019', 'http://www.clubrural.com/casa-rural/lleida/oveix/casa-gris_128646/opiniones/carmen-marisa_6905', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_019', 'http://www.escapadarural.com/opinion/perfil-usuario/501cbfff0bd30', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_020', 'http://www.clubrural.com/casa-rural/lleida/oveix/casa-gris_128646/opiniones/zyab-ibanez_6163', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_020', 'http://www.escapadarural.com/opinion/perfil-usuario/501cdf1e6816b', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_021', 'http://www.clubrural.com/casa-rural/lleida/oveix/casa-gris_128646/opiniones/zyab-ibanez_6164', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_021', 'http://www.escapadarural.com/opinion/perfil-usuario/5182ae2b3e99c', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_022', 'http://www.clubrural.com/casa-rural/lleida/oveix/casa-gris_128646/opiniones/susana-maldonado_5722', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_022', 'http://www.escapadarural.com/opinion/perfil-usuario/5066c496e69e2', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_023', 'http://www.clubrural.com/casa-rural/lleida/tavascan/casa-guillem_133872/opiniones/ruthabrileta_18806', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_023', 'http://www.escapadarural.com/opinion/perfil-usuario/519524207220a', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_024', 'http://www.clubrural.com/casa-rural/lleida/tavascan/casa-guillem_133872/opiniones/molinafamili_18558', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_024', 'http://www.escapadarural.com/opinion/perfil-usuario/501cc37fd1e35', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_025', 'http://www.clubrural.com/casa-rural/lleida/tavascan/casa-guillem_133872/opiniones/sara-sala_13708', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_025', 'http://www.escapadarural.com/opinion/perfil-usuario/5180d8d14f094', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_026', 'http://www.clubrural.com/casa-rural/lleida/tavascan/casa-guillem_133872/opiniones/espectacular-_13133', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_026', 'http://www.escapadarural.com/opinion/perfil-usuario/501cdcc6d0b8e', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_027', 'http://www.clubrural.com/casa-rural/lleida/tavascan/casa-guillem_133872/opiniones/francesc_11017', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_027', 'http://www.escapadarural.com/opinion/perfil-usuario/501cc0c7b5966', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_028', 'http://www.clubrural.com/masia/lleida/olius/casa-marcus_136115/opiniones/jordi-cardona_11914', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_028', 'http://www.escapadarural.com/opinion/perfil-usuario/517e7141693b8', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_029', 'http://www.clubrural.com/casa-rural/lleida/llessui/casa-rogel_132944/opiniones/miguel_11363', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_029', 'http://www.escapadarural.com/opinion/perfil-usuario/5183bd8d80280', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_030', 'http://www.clubrural.com/casa-rural/lleida/llessui/casa-rogel_132944/opiniones/eva_8850', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_030', 'http://www.escapadarural.com/opinion/perfil-usuario/0000000012607', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_031', 'http://www.clubrural.com/hotel-rural/lleida/gramos/casa-rural-les-flors_129636/opiniones/manel-i-roser_7234', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_031', 'http://www.escapadarural.com/opinion/perfil-usuario/50f3d52808d84', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_032', 'http://www.clubrural.com/casa-rural/lleida/gosol/casa-rural-roca-roja-y-el-castell_126763/opiniones/maria_5793', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_032', 'http://www.escapadarural.com/opinion/perfil-usuario/517e902ed0165', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_033', 'http://www.clubrural.com/casa-rural/lleida/sant-llorenc-de-morunys/el-porxo-de-la-creu_134254/opiniones/marta-juanma-y-pablo_12103', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_033', 'http://www.escapadarural.com/opinion/perfil-usuario/501cdd0043d7a', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_034', 'http://www.clubrural.com/hotel/lleida/vielha/hotel-acevi-val-d-aran-_125791/opiniones/nuria_4132', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_034', 'http://www.escapadarural.com/opinion/perfil-usuario/51af11f8b6c34', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_035', 'http://www.clubrural.com/hotel/lleida/bellver-de-cerdanya/hotel-cal-rei-de-tallo_136612/opiniones/maria_13401', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_035', 'http://www.escapadarural.com/opinion/perfil-usuario/519248689eb6b', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_036', 'http://www.clubrural.com/hotel-rural/lleida/granyena-de-les-garrigues/hotel-rural-la-garbinada-_127727/opiniones/sonia-y-moises_10077', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_036', 'http://www.escapadarural.com/opinion/perfil-usuario/509ffef1b12b9', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_037', 'http://www.clubrural.com/hotel/lleida/cellers--guardia-de-noguera-/hotel-terradets_125343/opiniones/pere-camarasa_5559', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_037', 'http://www.escapadarural.com/opinion/perfil-usuario/517ecea0efc0a', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_038', 'http://www.clubrural.com/casa-rural/lleida/naves/la-bertolina_133217/opiniones/joana_10780', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_038', 'http://www.escapadarural.com/opinion/perfil-usuario/5142205ec06c0', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_039', 'http://www.clubrural.com/casa-rural/lleida/vallferosa/la-collita_125154/opiniones/jose-antonio_3851', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_039', 'http://www.escapadarural.com/opinion/perfil-usuario/518976eb7cbe6', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_040', 'http://www.clubrural.com/casa-rural/lleida/ponts/masia-confos_133990/opiniones/noca_19150', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_040', 'http://www.escapadarural.com/opinion/perfil-usuario/51c03269a61d6', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_041', 'http://www.clubrural.com/casa-rural/lleida/ponts/masia-confos_133990/opiniones/raquel-sepulveda_17166', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'EscapadaRural_FichaUsuario.Id_041', 'http://www.escapadarural.com/opinion/perfil-usuario/501cf7b5240f2', '', '//*[@class="useful-review"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_042', 'http://www.clubrural.com/pension/lleida/salardu/pension-montanha_133407/opiniones/anna_12717', '', '//*[@id="logos_confianza"]', ''
  page.launch idLaunch, 'ClubRural_ReviewOne.Id_043', 'http://www.clubrural.com/pension/lleida/salardu/pension-montanha_133407/opiniones/rosamelocomoto_19044', '', '//*[@id="logos_confianza"]', ''

     
  end
  
end

Then /^QBot should get a snapshot$/ do

end
