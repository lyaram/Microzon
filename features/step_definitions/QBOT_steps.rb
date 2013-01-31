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
    
    page.launch idLaunch,'HOTELOPIA_HotelList.ALBACETE', 'http://www.hotelopia.es/espana/albacete/albacete-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.ALBACETE', 'http://www.laterooms.com/es/k15762071_hoteles-albacete.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.ALICANTE', 'http://www.hotelopia.es/espana/alicante/alicante-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.ALICANTE', 'http://www.laterooms.com/es/k15762834_hoteles-alicante.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.ALMERIA', 'http://www.hotelopia.es/espana/almeria-costa-de-almeria/almeria-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.ALMERIA', 'http://www.laterooms.com/es/k15763023_hoteles-almeria.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.AVILA', 'http://www.hotelopia.es/espana/avila/avila/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.AVILA', 'http://www.laterooms.com/es/k17185811_hoteles-avila.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.BADAJOZ', 'http://www.hotelopia.es/espana/badajoz/badajoz-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.BADAJOZ', 'http://www.laterooms.com/es/k15765107_hoteles-badajoz-ciudad.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.BALEARES', 'http://www.laterooms.com/es/r30009_hoteles-islas-baleares.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.BARCELONA', 'http://www.hotelopia.es/espana/barcelona/barcelona-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.BARCELONA', 'http://www.laterooms.com/es/k15765562_hoteles-barcelona.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.BILBAO', 'http://www.hotelopia.es/espana/vizcaya-bilbao/bilbao-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.BILBAO', 'http://www.laterooms.com/es/k15767120_hoteles-bilbao.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.BURGOS', 'http://www.hotelopia.es/espana/burgos/burgos-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.BURGOS', 'http://www.laterooms.com/es/k17269299_hoteles-burgos.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.CACERES', 'http://www.hotelopia.es/espana/extremadura/caceres-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.CACERES', 'http://www.laterooms.com/es/k15768587_hoteles-caceres.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.CADIZ', 'http://www.hotelopia.es/espana/cadiz-provincia/cadiz-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.CADIZ', 'http://www.laterooms.com/es/r30019_hoteles-cadiz.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.CANARIAS', 'http://www.laterooms.com/es/r30011_hoteles-islas-canarias.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.CASTELLON_DE_LA_PLANA', 'http://www.hotelopia.es/espana/castellon/castellon/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.CASTELLON_DE_LA_PLANA', 'http://www.laterooms.com/es/k15773593_hoteles-castellon.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.CIUDAD_REAL', 'http://www.hotelopia.es/espana/ciudad-real/ciudad-real-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.CIUDAD_REAL', 'http://www.laterooms.com/es/k15775120_hoteles-ciudad-real.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.CORDOBA', 'http://www.hotelopia.es/espana/cordoba/cordoba-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.CORDOBA', 'http://www.laterooms.com/es/k17222460_hoteles-cordoba.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.CUENCA', 'http://www.hotelopia.es/espana/cuenca/cuenca/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.CUENCA', 'http://www.laterooms.com/es/k15777080_hoteles-cuenca.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.ELCHE', 'http://www.hotelopia.es/espana/alicante/elche/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.ELCHE', 'http://www.laterooms.com/es/k15778347_hoteles-elche.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.GIJON', 'http://www.hotelopia.es/espana/asturias/gijon/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.GIJON', 'http://www.laterooms.com/es/k16849841_hoteles-gijon.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.GIRONA', 'http://www.hotelopia.es/espana/girona/girona-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.GIRONA', 'http://www.laterooms.com/es/k15782512_hoteles-gerona.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.GRANADA', 'http://www.hotelopia.es/espana/granada/granada-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.GRANADA', 'http://www.laterooms.com/es/k15782948_hoteles-granada.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.GUADALAJARA', 'http://www.hotelopia.es/espana/guadalajara/guadalajara-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.GUADALAJARA', 'http://www.laterooms.com/es/k15783262_hoteles-guadalajara.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.HOSPITALET', 'http://www.hotelopia.es/espana/barcelona/hospitalet-de-llobregat/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.HOSPITALET', 'http://www.laterooms.com/es/k15784306_hoteles-hospitalet-de-llobregat.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.HUELVA', 'http://www.hotelopia.es/espana/huelva/huelva-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.HUELVA', 'http://www.laterooms.com/es/k15784453_hoteles-huelva.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.HUESCA', 'http://www.hotelopia.es/espana/huesca/huesca-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.HUESCA', 'http://www.laterooms.com/es/k15784556_hoteles-huesca.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.JAEN', 'http://www.hotelopia.es/espana/jaen/jaen-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.JAEN', 'http://www.laterooms.com/es/r30023_hoteles-jaen.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.JEREZ_DE_LA_FRONTERA', 'http://www.hotelopia.es/espana/cadiz-jerez/jerez-de-la-frontera/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.JEREZ_DE_LA_FRONTERA', 'http://www.laterooms.com/es/k15785252_hoteles-jerez-de-la-frontera.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.LEON', 'http://www.hotelopia.es/espana/leon/leon/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.LEON', 'http://www.laterooms.com/es/k16799500_hoteles-leon.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.LERIDA', 'http://www.hotelopia.es/espana/lerida/lerida-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.LERIDA', 'http://www.laterooms.com/es/k15788653_hoteles-lerida.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.LOGRONO', 'http://www.hotelopia.es/espana/la-rioja/logrono/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.LOGRONO', 'http://www.laterooms.com/es/k15789239_hoteles-logrono.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.LUGO', 'http://www.hotelopia.es/espana/lugo/lugo-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.LUGO', 'http://www.laterooms.com/es/k15790255_hoteles-lugo.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.MADRID', 'http://www.hotelopia.es/espana/madrid/madrid-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.MADRID', 'http://www.laterooms.com/es/k15790393_hoteles-madrid.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.MALAGA', 'http://www.hotelopia.es/espana/malaga/malaga-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.MALAGA', 'http://www.laterooms.com/es/k17281233_hoteles-malaga.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.MERIDA', 'http://www.hotelopia.es/espana/badajoz/merida/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.MERIDA', 'http://www.laterooms.com/es/k17235619_hoteles-merida.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.MURCIA', 'http://www.hotelopia.es/espana/murcia/murcia-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.MURCIA', 'http://www.laterooms.com/es/k15793815_hoteles-murcia.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.OVIEDO', 'http://www.hotelopia.es/espana/asturias/oviedo/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.OVIEDO', 'http://www.laterooms.com/es/k15795646_hoteles-oviedo.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.PALENCIA', 'http://www.hotelopia.es/espana/palencia/palencia-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.PALENCIA', 'http://www.laterooms.com/es/k15795912_hoteles-palencia.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.PAMPLONA', 'http://www.hotelopia.es/espana/navarra/pamplona/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.PAMPLONA', 'http://www.laterooms.com/es/k15796047_hoteles-pamplona.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.PONTEVEDRA', 'http://www.hotelopia.es/espana/pontevedra-provincia/pontevedra-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.PONTEVEDRA', 'http://www.laterooms.com/es/k15798242_hoteles-pontevedra.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.SALAMANCA', 'http://www.hotelopia.es/espana/salamanca/salamanca-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.SALAMANCA', 'http://www.laterooms.com/es/k15801884_hoteles-salamanca.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.SAN_SEBASTIAN', 'http://www.hotelopia.es/espana/guipuzcoa-san-sebastian/san-sebastian-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.SAN_SEBASTIAN', 'http://www.laterooms.com/es/k17185813_hoteles-san-sebastian.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.SANTANDER', 'http://www.hotelopia.es/espana/cantabria/santander/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.SANTANDER', 'http://www.laterooms.com/es/k15805936_hoteles-santander.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.SANTIAGO_DE_COMPOSTELA', 'http://www.hotelopia.es/espana/a-coruna-provincia/santiago-de-compostela/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.SANTIAGO_DE_COMPOSTELA', 'http://www.laterooms.com/es/k15806197_hoteles-santiago.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.SEGOVIA', 'http://www.hotelopia.es/espana/segovia/segovia/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.SEGOVIA', 'http://www.laterooms.com/es/k15806938_hoteles-segovia.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.SEVILLA', 'http://www.hotelopia.es/espana/sevilla/sevilla-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.SEVILLA', 'http://www.laterooms.com/es/k17271482_hoteles-sevilla.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.SORIA', 'http://www.hotelopia.es/espana/soria/soria-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.SORIA', 'http://www.laterooms.com/es/k15807835_hoteles-soria.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.TARRAGONA', 'http://www.hotelopia.es/espana/salou-area-costa-daurada/tarragona/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.TARRAGONA', 'http://www.laterooms.com/es/k15808536_hoteles-tarragona.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.TERUEL', 'http://www.hotelopia.es/espana/teruel/teruel-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.TERUEL', 'http://www.laterooms.com/es/k15808847_hoteles-teruel.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.TOLEDO', 'http://www.hotelopia.es/espana/toledo/toledo-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.TOLEDO', 'http://www.laterooms.com/es/k15809086_hoteles-toledo.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.VALENCIA', 'http://www.hotelopia.es/espana/valencia/valencia-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.VALENCIA', 'http://www.laterooms.com/es/k15811151_hoteles-valencia.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.VALLADOLID', 'http://www.hotelopia.es/espana/valladolid/valladolid-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.VALLADOLID', 'http://www.laterooms.com/es/k15811243_hoteles-valladolid.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.VIGO', 'http://www.hotelopia.es/espana/pontevedra-provincia/vigo/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.VIGO', 'http://www.laterooms.com/es/k16306911_hoteles-vigo.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.VITORIA', 'http://www.hotelopia.es/espana/alava/vitoria-gasteiz/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.VITORIA', 'http://www.laterooms.com/es/k15814371_hoteles-vitoria-gasteiz.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.ZAMORA', 'http://www.hotelopia.es/espana/zamora/zamora-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.ZAMORA', 'http://www.laterooms.com/es/r30038_hoteles-zamora.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''
    page.launch idLaunch,'HOTELOPIA_HotelList.ZARAGOZA', 'http://www.hotelopia.es/espana/zaragoza/zaragoza-ciudad/', '//span[@class="jPag-current"]/../following-sibling::li[1]/a', '//*[@id="content_basefooter"]', ''
    page.launch idLaunch,'LATEROOMS_HotelList.ZARAGOZA', 'http://www.laterooms.com/es/k15814679_hoteles-zaragoza.aspx', './/*[@id="pager"]/text()[normalize-space()!=""]/following-sibling::a[1]', '//*[@id="footer2"]', ''


  end
  
end

Then /^QBot should get a snapshot$/ do

end
