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
  page.launch idLaunch, 'Zoover_ReviewList.Id_150145', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/llavorsi/aigues-braves/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150444', 'http://www.spaincamping.es/camping-aig%EF%BF%BDesbraves/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150343', 'http://www.campinguia.com/campings/lleida/camping-alta-ribagorca/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150394', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-alta-ribagor%e7a-108247/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150119', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/el-pont-de-suert/alta-ribagorca/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150452', 'http://www.spaincamping.es/camping-altaribagor%EF%BF%BDa/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150328', 'http://www.campinguia.com/campings/lleida/camping-artigane/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150451', 'http://www.spaincamping.es/camping-artigane/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150400', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-bedura-park-101072/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150278', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/es-bordes/bedura-park/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150336', 'http://www.campinguia.com/campings/lleida/camping-bedura-park/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150427', 'http://www.spaincamping.es/camping-bedura-park/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150333', 'http://www.campinguia.com/campings/lleida/camping-beta/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150154', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/barruera/boneta/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150334', 'http://www.campinguia.com/campings/lleida/camping-boneta/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150421', 'http://www.spaincamping.es/camping-boneta/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150291', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/baro/borda-beta/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150097', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/soriguera-escos/borda-castell/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150248', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/sort/borda-den-farrero/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150462', 'http://www.spaincamping.es/camping-bordadenfarrero/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150303', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/tavascan/bordes-de-graus/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150382', 'http://www.campinguia.com/campings/lleida/camping-bordes-de-graus/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150464', 'http://www.spaincamping.es/camping-bordesdegraus/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150114', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/castellbo/buchaca/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150339', 'http://www.campinguia.com/campings/lleida/camping-buchaca/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150426', 'http://www.spaincamping.es/camping-buchaca/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150351', 'http://www.campinguia.com/campings/lleida/camping-cadi-de-gosol/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150197', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/gosol/cadi-vacances/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150436', 'http://www.spaincamping.es/camping-cadivacances/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150384', 'http://www.campinguia.com/campings///', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150316', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/el-pont-de-suert/can-roig/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150341', 'http://www.campinguia.com/campings/lleida/camping-can-roig/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150453', 'http://www.spaincamping.es/camping-canroig/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150398', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-castellb%f2-buchaca-106744/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150221', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/les/cauarca/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150360', 'http://www.campinguia.com/campings/lleida/camping-cauarca/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150374', 'http://www.campinguia.com/campings/lleida/camping-cel-de-rubio/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150104', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/la-pobla-de-segur/collegats/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150357', 'http://www.campinguia.com/campings/lleida/camping-collegats/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150439', 'http://www.spaincamping.es/camping-collegats/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150403', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-collegats-106707/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150247', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/ribera-de-cardos/del-cardos/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150456', 'http://www.spaincamping.es/camping-delcardos/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150372', 'http://www.campinguia.com/campings/lleida/camping-del-cardos/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150389', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-del-card%f3s-106741/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150136', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/el-pont-de-suert/del-remei/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150342', 'http://www.campinguia.com/campings/lleida/camping-del-remei/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150454', 'http://www.spaincamping.es/camping-delremei/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150397', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-del-remei-106704/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150441', 'http://www.spaincamping.es/camping-deportur/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150152', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/lles-de-cerdanya/el-cortal-del-gral/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150446', 'http://www.spaincamping.es/camping-elcortaldelgral/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150124', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/solsona/el-solsones/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150410', 'http://www.spaincamping.es/camping-elsolsones/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150377', 'http://www.campinguia.com/campings/lleida/camping-el-solsones/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150391', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-el-solsones-106749/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150358', 'http://www.campinguia.com/campings/lleida/camping-en-valira/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150253', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/oliana/entrellacs/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150367', 'http://www.campinguia.com/campings/lleida/camping-entrellacs/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150450', 'http://www.spaincamping.es/camping-entrellacs/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150314', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/arres/era-lana/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150327', 'http://www.campinguia.com/campings/lleida/camping-era-lana/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150330', 'http://www.campinguia.com/campings/lleida/camping-era-yerla-d-arties/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150405', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-era-yerla-d%27arties-106700/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150419', 'http://www.spaincamping.es/camping-erayerladarties/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150225', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/bossost/espalias/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150337', 'http://www.campinguia.com/campings/lleida/camping-espalias/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150423', 'http://www.spaincamping.es/camping-espalias/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150282', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/es-bordes/forcanada/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150352', 'http://www.campinguia.com/campings/lleida/camping-forcanada/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150428', 'http://www.spaincamping.es/camping-forcanada/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150354', 'http://www.campinguia.com/campings/lleida/camping-frontera/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150401', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-frontera-106743/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150437', 'http://www.spaincamping.es/camping-frontera-park/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150173', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/talarn/gaset/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150463', 'http://www.spaincamping.es/camping-gaset/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150380', 'http://www.campinguia.com/campings/lleida/camping-gasset/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150142', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/montferrer/gran-sol/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150366', 'http://www.campinguia.com/campings/lleida/camping-gran-sol/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150413', 'http://www.spaincamping.es/camping-gransol/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150393', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-gran-sol-109154/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150233', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/ribera-de-cardos/la-borda-del-pubill/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150373', 'http://www.campinguia.com/campings/lleida/camping-la-borda-del-pubill/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150457', 'http://www.spaincamping.es/camping-labordadelpubill/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150408', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-la-borda-del-pubill-106740/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150378', 'http://www.campinguia.com/campings/lleida/camping-la-borda-d-en-farrero/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150224', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/prullans/la-cerdanya/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150371', 'http://www.campinguia.com/campings/lleida/camping-la-cerdanya/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150455', 'http://www.spaincamping.es/camping-lacerdanya/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150288', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/oden/la-comella/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150386', 'http://www.campinguia.com/campings/lleida/camping-la-comella/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150425', 'http://www.spaincamping.es/camping-lacomella/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150089', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/espot/la-mola/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150344', 'http://www.campinguia.com/campings/lleida/camping-la-mola/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150431', 'http://www.spaincamping.es/camping-lamola/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150396', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-la-mola-106739/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150072', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/sant-llorenc-de-montgai/la-noguera/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150375', 'http://www.campinguia.com/campings/lleida/camping-la-noguera/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150399', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-la-noguera-112228/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150458', 'http://www.spaincamping.es/camping-lanoguera/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150229', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/esterri-daneu/la-presalla/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150349', 'http://www.campinguia.com/campings/lleida/camping-la-presalla/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150434', 'http://www.spaincamping.es/camping-lapresalla/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150404', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-la-presalla-100918/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150258', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/estamariu/la-quera/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150348', 'http://www.campinguia.com/campings/lleida/camping-la-quera/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150309', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/clariana-de-cardener/la-ribera/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150340', 'http://www.campinguia.com/campings/lleida/camping-la-ribera/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150412', 'http://www.spaincamping.es/camping-laribera/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150265', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/ogern/la-ribera-salada/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150387', 'http://www.campinguia.com/campings/lleida/camping-la-ribera-salada/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150449', 'http://www.spaincamping.es/camping-lariberasalada/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150125', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/ager/la-vall-dager/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150323', 'http://www.campinguia.com/campings/lleida/camping-les-contioles/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150416', 'http://www.spaincamping.es/camping-lescontioles/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150402', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-l%27orri-de-pallars-112231/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150222', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/montardit-de-dalt/lorri-del-pallars/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150447', 'http://www.spaincamping.es/camping-lorridelpallars/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150350', 'http://www.campinguia.com/campings/lleida/camping-moli-de-fornols/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150435', 'http://www.spaincamping.es/camping-molidefornols/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150234', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/sant-llorenc-de-morunys/morunys/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150459', 'http://www.spaincamping.es/camping-morunys/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150121', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/sort/noguera-pallaresa/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150379', 'http://www.campinguia.com/campings/lleida/camping-noguera-pallaresa/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150461', 'http://www.spaincamping.es/camping-noguerapallaresa/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150231', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/la-guingueta-daneu/nou/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150409', 'http://www.spaincamping.es/camping-noucamping/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150388', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/nou-camping-101371/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150355', 'http://www.campinguia.com/campings/lleida/camping-nou-camping/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150369', 'http://www.campinguia.com/campings/lleida/camping-oliana/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150370', 'http://www.campinguia.com/campings/lleida/camping-organya/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150332', 'http://www.campinguia.com/campings/lleida/camping-pallars-sobira/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150420', 'http://www.spaincamping.es/camping-pallarssobira-bordabeta/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150256', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/areu/pica-destats/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150325', 'http://www.campinguia.com/campings/lleida/camping-pica-d-estats/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150418', 'http://www.spaincamping.es/camping-picadestats/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150280', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/el-pont-de-bar/pont-dardaix/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150326', 'http://www.campinguia.com/campings/lleida/camping-pont-d-ardaix/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150411', 'http://www.spaincamping.es/camping-pontdardaix/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150407', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-pont-d%27ardaix-106746/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150235', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/es-bordes/prado-verde/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150353', 'http://www.campinguia.com/campings/lleida/camping-prado-verde/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150429', 'http://www.spaincamping.es/camping-pradoverde/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150383', 'http://www.campinguia.com/campings/lleida/camping-raco-d-en-pep/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150217', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/vilanova-de-la-barca/raco-den-pep/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150385', 'http://www.campinguia.com/campings/lleida/camping-rectoria-de-la-selva/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150281', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/naves/rectoria-de-la-selva/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150448', 'http://www.spaincamping.es/camping-rectoriadelaselva/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150364', 'http://www.campinguia.com/campings/lleida/camping-riberies/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150445', 'http://www.spaincamping.es/camping-riberies/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150395', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-s.a.-noguera-pallaresa-106742/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150259', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/senterada/senterada/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150376', 'http://www.campinguia.com/campings/lleida/camping-senterada/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150460', 'http://www.spaincamping.es/camping-senterada/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150321', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/lladorre/serra/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150362', 'http://www.campinguia.com/campings/lleida/camping-serra/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150443', 'http://www.spaincamping.es/camping-serra/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150299', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/les-iglesies/sol-i-fred/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150361', 'http://www.campinguia.com/campings/lleida/camping-sol-i-fred/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150442', 'http://www.spaincamping.es/camping-solifred/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150077', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/espot/sol-i-neu/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150345', 'http://www.campinguia.com/campings/lleida/camping-sol-i-neu/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150432', 'http://www.spaincamping.es/camping-solineu/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150406', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-sol-i-neu-106738/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150214', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/bellver-de-cerdanya/solana-del-segre/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150335', 'http://www.campinguia.com/campings/lleida/camping-solana-del-segre/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150422', 'http://www.spaincamping.es/camping-solanadelsegre/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150275', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/espot/solau/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150347', 'http://www.campinguia.com/campings/lleida/camping-solau/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150430', 'http://www.spaincamping.es/camping-solau/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150381', 'http://www.campinguia.com/campings/lleida/camping-taull/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150465', 'http://www.spaincamping.es/camping-taull/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150365', 'http://www.campinguia.com/campings/lleida/camping-temple-del-sol/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150356', 'http://www.campinguia.com/campings/lleida/camping-vall-d-aneu/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150322', 'http://www.campinguia.com/campings/lleida/camping-vall-d-ager/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150415', 'http://www.spaincamping.es/camping-valldager/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150312', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/la-guingueta-daneu/vall-daneu/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150438', 'http://www.spaincamping.es/camping-valldaneu/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150307', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/alins/vall-ferrera/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150324', 'http://www.campinguia.com/campings/lleida/camping-vall-ferrera/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150417', 'http://www.spaincamping.es/camping-vallferrera/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150241', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/la-torre-de-cabdella/vall-fosca/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150359', 'http://www.campinguia.com/campings/lleida/camping-vall-fosca/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150440', 'http://www.spaincamping.es/camping-vallfosca/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150368', 'http://www.campinguia.com/campings/lleida/camping-valldan/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150140', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/pont-darrs/verneda/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150329', 'http://www.campinguia.com/campings/lleida/camping-verneda/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150392', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-verneda-112229/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150414', 'http://www.spaincamping.es/camping-verneda/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150433', 'http://www.spaincamping.es/camping-voraparc/', '', '//*[@id="footer1"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150085', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/espot/voraparc/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150346', 'http://www.campinguia.com/campings/lleida/camping-voraparc/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Eurocampings_ReviewList.Id_150390', 'http://www.eurocampings.es/es/europa/espa%f1a/catalu%f1a/lerida/camping-voraparc-115937/', '', '//*[@id="Footer"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150331', 'http://www.campinguia.com/campings/lleida/camping-yerla/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150267', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/camarasa/zodiac/camping', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Campinguia_ReviewList.Id_150338', 'http://www.campinguia.com/campings/lleida/camping-zodiac/', '', '//form[@action="enviar_camping_amigo.asp"]', ''
  page.launch idLaunch, 'SpainCamping_ReviewList.Id_150424', 'http://www.spaincamping.es/camping-zodiacii/', '', '//*[@id="footer1"]', ''

     
  end
  
end

Then /^QBot should get a snapshot$/ do

end
