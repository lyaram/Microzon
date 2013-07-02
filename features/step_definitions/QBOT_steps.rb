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

  page.launch idLaunch, 'Zoover_ReviewList.Id_150145', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/llavorsi/aigues-braves/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150119', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/el-pont-de-suert/alta-ribagorca/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150278', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/es-bordes/bedura-park/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150154', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/barruera/boneta/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150291', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/baro/borda-beta/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150097', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/soriguera-escos/borda-castell/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150248', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/sort/borda-den-farrero/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150303', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/tavascan/bordes-de-graus/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150114', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/castellbo/buchaca/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150197', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/gosol/cadi-vacances/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150316', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/el-pont-de-suert/can-roig/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150221', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/les/cauarca/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150104', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/la-pobla-de-segur/collegats/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150247', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/ribera-de-cardos/del-cardos/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150136', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/el-pont-de-suert/del-remei/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150152', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/lles-de-cerdanya/el-cortal-del-gral/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150124', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/solsona/el-solsones/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150253', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/oliana/entrellacs/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150314', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/arres/era-lana/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150225', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/bossost/espalias/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150282', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/es-bordes/forcanada/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150173', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/talarn/gaset/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150142', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/montferrer/gran-sol/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150233', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/ribera-de-cardos/la-borda-del-pubill/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150224', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/prullans/la-cerdanya/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150288', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/oden/la-comella/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150089', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/espot/la-mola/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150072', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/sant-llorenc-de-montgai/la-noguera/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150229', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/esterri-daneu/la-presalla/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150258', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/estamariu/la-quera/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150309', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/clariana-de-cardener/la-ribera/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150265', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/ogern/la-ribera-salada/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150125', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/ager/la-vall-dager/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150222', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/montardit-de-dalt/lorri-del-pallars/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150234', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/sant-llorenc-de-morunys/morunys/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150121', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/sort/noguera-pallaresa/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150231', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/la-guingueta-daneu/nou/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150256', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/areu/pica-destats/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150280', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/el-pont-de-bar/pont-dardaix/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150235', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/es-bordes/prado-verde/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150217', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/vilanova-de-la-barca/raco-den-pep/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150281', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/naves/rectoria-de-la-selva/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150259', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/senterada/senterada/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150321', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/lladorre/serra/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150299', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/les-iglesies/sol-i-fred/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150077', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/espot/sol-i-neu/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150214', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/bellver-de-cerdanya/solana-del-segre/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150275', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/espot/solau/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150312', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/la-guingueta-daneu/vall-daneu/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150307', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/alins/vall-ferrera/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150241', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/la-torre-de-cabdella/vall-fosca/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150140', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/pont-darrs/verneda/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150085', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/espot/voraparc/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
  page.launch idLaunch, 'Zoover_ReviewList.Id_150267', 'http://www.zoover.es/espana/cataluna-costa-brava-y-costa-dorada/camarasa/zodiac/camping/?lng=Language_ALL', '(//a[text()="siguiente"])[1]', '//div[@class="footer wrapper"]', ''
    

     
  end
  
end

Then /^QBot should get a snapshot$/ do

end
