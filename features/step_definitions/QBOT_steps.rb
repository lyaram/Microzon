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
    
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150363', 'http://www.campinguia.com/campings/lleida/camping-aigues-braves/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150444', 'http://www.spaincamping.es/camping-aig%EF%BF%BDesbraves/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150343', 'http://www.campinguia.com/campings/lleida/camping-alta-ribagorca/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150394', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-alta-ribagor%e7a-108247/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150452', 'http://www.spaincamping.es/camping-altaribagor%EF%BF%BDa/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150328', 'http://www.campinguia.com/campings/lleida/camping-artigane/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150451', 'http://www.spaincamping.es/camping-artigane/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150400', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-bedura-park-101072/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150336', 'http://www.campinguia.com/campings/lleida/camping-bedura-park/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150427', 'http://www.spaincamping.es/camping-bedura-park/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150333', 'http://www.campinguia.com/campings/lleida/camping-beta/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150334', 'http://www.campinguia.com/campings/lleida/camping-boneta/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150421', 'http://www.spaincamping.es/camping-boneta/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150462', 'http://www.spaincamping.es/camping-bordadenfarrero/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150382', 'http://www.campinguia.com/campings/lleida/camping-bordes-de-graus/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150464', 'http://www.spaincamping.es/camping-bordesdegraus/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150339', 'http://www.campinguia.com/campings/lleida/camping-buchaca/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150426', 'http://www.spaincamping.es/camping-buchaca/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150351', 'http://www.campinguia.com/campings/lleida/camping-cadi-de-gosol/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150436', 'http://www.spaincamping.es/camping-cadivacances/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150384', 'http://www.campinguia.com/campings///', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150341', 'http://www.campinguia.com/campings/lleida/camping-can-roig/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150453', 'http://www.spaincamping.es/camping-canroig/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150398', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-castellb%f2-buchaca-106744/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150360', 'http://www.campinguia.com/campings/lleida/camping-cauarca/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150374', 'http://www.campinguia.com/campings/lleida/camping-cel-de-rubio/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150357', 'http://www.campinguia.com/campings/lleida/camping-collegats/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150439', 'http://www.spaincamping.es/camping-collegats/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150403', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-collegats-106707/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150456', 'http://www.spaincamping.es/camping-delcardos/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150372', 'http://www.campinguia.com/campings/lleida/camping-del-cardos/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150389', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-del-card%f3s-106741/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150342', 'http://www.campinguia.com/campings/lleida/camping-del-remei/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150454', 'http://www.spaincamping.es/camping-delremei/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150397', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-del-remei-106704/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150441', 'http://www.spaincamping.es/camping-deportur/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150446', 'http://www.spaincamping.es/camping-elcortaldelgral/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150410', 'http://www.spaincamping.es/camping-elsolsones/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150377', 'http://www.campinguia.com/campings/lleida/camping-el-solsones/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150391', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-el-solsones-106749/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150358', 'http://www.campinguia.com/campings/lleida/camping-en-valira/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150367', 'http://www.campinguia.com/campings/lleida/camping-entrellacs/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150450', 'http://www.spaincamping.es/camping-entrellacs/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150327', 'http://www.campinguia.com/campings/lleida/camping-era-lana/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150330', 'http://www.campinguia.com/campings/lleida/camping-era-yerla-d-arties/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150405', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-era-yerla-d%27arties-106700/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150419', 'http://www.spaincamping.es/camping-erayerladarties/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150337', 'http://www.campinguia.com/campings/lleida/camping-espalias/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150423', 'http://www.spaincamping.es/camping-espalias/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150352', 'http://www.campinguia.com/campings/lleida/camping-forcanada/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150428', 'http://www.spaincamping.es/camping-forcanada/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150354', 'http://www.campinguia.com/campings/lleida/camping-frontera/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150401', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-frontera-106743/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150437', 'http://www.spaincamping.es/camping-frontera-park/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150463', 'http://www.spaincamping.es/camping-gaset/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150380', 'http://www.campinguia.com/campings/lleida/camping-gasset/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150366', 'http://www.campinguia.com/campings/lleida/camping-gran-sol/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150413', 'http://www.spaincamping.es/camping-gransol/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150393', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-gran-sol-109154/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150373', 'http://www.campinguia.com/campings/lleida/camping-la-borda-del-pubill/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150457', 'http://www.spaincamping.es/camping-labordadelpubill/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150408', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-la-borda-del-pubill-106740/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150378', 'http://www.campinguia.com/campings/lleida/camping-la-borda-d-en-farrero/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150371', 'http://www.campinguia.com/campings/lleida/camping-la-cerdanya/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150455', 'http://www.spaincamping.es/camping-lacerdanya/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150386', 'http://www.campinguia.com/campings/lleida/camping-la-comella/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150425', 'http://www.spaincamping.es/camping-lacomella/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150344', 'http://www.campinguia.com/campings/lleida/camping-la-mola/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150431', 'http://www.spaincamping.es/camping-lamola/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150396', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-la-mola-106739/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150375', 'http://www.campinguia.com/campings/lleida/camping-la-noguera/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150399', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-la-noguera-112228/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150458', 'http://www.spaincamping.es/camping-lanoguera/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150349', 'http://www.campinguia.com/campings/lleida/camping-la-presalla/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150434', 'http://www.spaincamping.es/camping-lapresalla/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150404', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-la-presalla-100918/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150348', 'http://www.campinguia.com/campings/lleida/camping-la-quera/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150340', 'http://www.campinguia.com/campings/lleida/camping-la-ribera/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150412', 'http://www.spaincamping.es/camping-laribera/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150387', 'http://www.campinguia.com/campings/lleida/camping-la-ribera-salada/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150449', 'http://www.spaincamping.es/camping-lariberasalada/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150323', 'http://www.campinguia.com/campings/lleida/camping-les-contioles/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150416', 'http://www.spaincamping.es/camping-lescontioles/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150402', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-l%27orri-de-pallars-112231/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150447', 'http://www.spaincamping.es/camping-lorridelpallars/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150350', 'http://www.campinguia.com/campings/lleida/camping-moli-de-fornols/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150435', 'http://www.spaincamping.es/camping-molidefornols/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150459', 'http://www.spaincamping.es/camping-morunys/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150379', 'http://www.campinguia.com/campings/lleida/camping-noguera-pallaresa/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150461', 'http://www.spaincamping.es/camping-noguerapallaresa/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150409', 'http://www.spaincamping.es/camping-noucamping/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150388', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/nou-camping-101371/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150355', 'http://www.campinguia.com/campings/lleida/camping-nou-camping/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150369', 'http://www.campinguia.com/campings/lleida/camping-oliana/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150370', 'http://www.campinguia.com/campings/lleida/camping-organya/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150332', 'http://www.campinguia.com/campings/lleida/camping-pallars-sobira/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150420', 'http://www.spaincamping.es/camping-pallarssobira-bordabeta/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150325', 'http://www.campinguia.com/campings/lleida/camping-pica-d-estats/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150418', 'http://www.spaincamping.es/camping-picadestats/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150326', 'http://www.campinguia.com/campings/lleida/camping-pont-d-ardaix/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150411', 'http://www.spaincamping.es/camping-pontdardaix/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150407', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-pont-d%27ardaix-106746/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150353', 'http://www.campinguia.com/campings/lleida/camping-prado-verde/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150429', 'http://www.spaincamping.es/camping-pradoverde/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150383', 'http://www.campinguia.com/campings/lleida/camping-raco-d-en-pep/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150385', 'http://www.campinguia.com/campings/lleida/camping-rectoria-de-la-selva/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150448', 'http://www.spaincamping.es/camping-rectoriadelaselva/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150364', 'http://www.campinguia.com/campings/lleida/camping-riberies/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150445', 'http://www.spaincamping.es/camping-riberies/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150395', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-s.a.-noguera-pallaresa-106742/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150376', 'http://www.campinguia.com/campings/lleida/camping-senterada/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150460', 'http://www.spaincamping.es/camping-senterada/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150362', 'http://www.campinguia.com/campings/lleida/camping-serra/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150443', 'http://www.spaincamping.es/camping-serra/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150361', 'http://www.campinguia.com/campings/lleida/camping-sol-i-fred/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150442', 'http://www.spaincamping.es/camping-solifred/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150345', 'http://www.campinguia.com/campings/lleida/camping-sol-i-neu/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150432', 'http://www.spaincamping.es/camping-solineu/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150406', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-sol-i-neu-106738/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150335', 'http://www.campinguia.com/campings/lleida/camping-solana-del-segre/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150422', 'http://www.spaincamping.es/camping-solanadelsegre/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150347', 'http://www.campinguia.com/campings/lleida/camping-solau/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150430', 'http://www.spaincamping.es/camping-solau/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150381', 'http://www.campinguia.com/campings/lleida/camping-taull/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150465', 'http://www.spaincamping.es/camping-taull/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150365', 'http://www.campinguia.com/campings/lleida/camping-temple-del-sol/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150356', 'http://www.campinguia.com/campings/lleida/camping-vall-d-aneu/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150322', 'http://www.campinguia.com/campings/lleida/camping-vall-d-ager/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150415', 'http://www.spaincamping.es/camping-valldager/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150438', 'http://www.spaincamping.es/camping-valldaneu/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150324', 'http://www.campinguia.com/campings/lleida/camping-vall-ferrera/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150417', 'http://www.spaincamping.es/camping-vallferrera/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150359', 'http://www.campinguia.com/campings/lleida/camping-vall-fosca/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150440', 'http://www.spaincamping.es/camping-vallfosca/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150368', 'http://www.campinguia.com/campings/lleida/camping-valldan/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150329', 'http://www.campinguia.com/campings/lleida/camping-verneda/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150392', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-verneda-112229/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150414', 'http://www.spaincamping.es/camping-verneda/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150433', 'http://www.spaincamping.es/camping-voraparc/opinions.html', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150346', 'http://www.campinguia.com/campings/lleida/camping-voraparc/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150390', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-voraparc-115937/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150331', 'http://www.campinguia.com/campings/lleida/camping-yerla/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150338', 'http://www.campinguia.com/campings/lleida/camping-zodiac/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150424', 'http://www.spaincamping.es/camping-zodiacii/opinions.html', '', '//*[@id="footer1"]', ''

     
  end
  
end

Then /^QBot should get a snapshot$/ do

end
