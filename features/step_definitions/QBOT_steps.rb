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
    
    #idLaunch = "00000058"
    idLaunch = page.getLaunch
    
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.A_CORUNA', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Galicia/A_Coru_a/La_Coru_a/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.A_CORUNA', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=68516', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.A_CORUNA', 'http://www.hoteles.com/de457467/hoteles-la-coruna-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.ALBACETE', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Castilla_la_Mancha/Albacete/Albacete/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.ALBACETE', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=67621', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.ALBACETE', 'http://www.hoteles.com/de449895/hoteles-albacete-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.ALICANTE', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Comunidad_Valenciana/Alicante/Alicante/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.ALICANTE', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=67707', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.ALICANTE', 'http://www.hoteles.com/de1636136/hoteles-alicante-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.ALMERIA', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Andalucia/Almeria/Almeria/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.ALMERIA', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=67848', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.ALMERIA', 'http://www.hoteles.com/de462043/hoteles-almeria-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.AVILA', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Castilla_Leon/Avila/Avila/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.AVILA', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=67899', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.AVILA', 'http://www.hoteles.com/de1638459/hoteles-avila-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.BADAJOZ', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Extremadura/Badajoz/Badajoz/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.BADAJOZ', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=67924', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.BADAJOZ', 'http://www.hoteles.com/de447220/hoteles-badajoz-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.BALEARES', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=65197', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.BILBAO', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Euskadi/Vizcaya/Bilbao/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.BILBAO', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=70857', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.BILBAO', 'http://www.hoteles.com/de458094/hoteles-bilbao-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.BURGOS', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Castilla_Leon/Burgos/Burgos/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.BURGOS', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=68128', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.BURGOS', 'http://www.hoteles.com/de445679/hoteles-burgos-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.CACERES', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Extremadura/Caceres/Caceres/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.CACERES', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=68150', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.CACERES', 'http://www.hoteles.com/de462091/hoteles-caceres-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.CADIZ', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Andalucia/Cadiz/Cadiz/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.CADIZ', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=68162', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.CADIZ', 'http://www.hoteles.com/de443771/hoteles-cadiz-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.CANARIAS', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=65213', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.CASTELLON_DE_LA_PLANA', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Comunidad_Valenciana/Castellon/Castellon/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.CASTELLON_DE_LA_PLANA', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=128766', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.CASTELLON_DE_LA_PLANA', 'http://www.hoteles.com/de1641623/hoteles-castellon-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.CIUDAD_REAL', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Castilla_la_Mancha/Ciudad_Real/Ciudad_Real/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.CIUDAD_REAL', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=68341', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.CIUDAD_REAL', 'http://www.hoteles.com/de1644691/hoteles-ciudad-real-area-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.CORDOBA', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Andalucia/Cordoba/Cordoba/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.CORDOBA', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=68441', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.CORDOBA', 'http://www.hoteles.com/de448718/hoteles-cordoba-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.CUENCA', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Castilla_la_Mancha/Cuenca/Cuenca/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.CUENCA', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=68610', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.CUENCA', 'http://www.hoteles.com/de449869/hoteles-cuenca-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.ELCHE', 'http://www.centraldereservas.com/hoteles/espana/comunidad-valenciana/alicante/elche', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.ELCHE', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=128786', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.ELCHE', 'http://www.hoteles.com/de440079/hoteles-elche-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.GIJON', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Asturias/Gijon/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.GIJON', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=69874', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.GIJON', 'http://www.hoteles.com/de441353/hoteles-gijon-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.GIRONA', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Catalunya/Girona/Girona/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.GIRONA', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=68616', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.GIRONA', 'http://www.hoteles.com/de1633509/hoteles-gerona-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.GRANADA', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Andalucia/Granada/Granada/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.GRANADA', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=68638', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.GRANADA', 'http://www.hoteles.com/de441859/hoteles-granada-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.GUADALAJARA', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Castilla_la_Mancha/Guadalajara/Guadalajara/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.GUADALAJARA', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=68804', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.GUADALAJARA', 'http://www.hoteles.com/de1644697/hoteles-guadalajara-area-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.HOSPITALET', 'http://www.centraldereservas.com/hoteles/espana/comunidad-valenciana/alicante/elche', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.HOSPITALET', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=68119', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.HOSPITALET', 'http://www.hoteles.com/de1635212/hoteles-l-hospitalet-de-llobregat-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.HUELVA', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Andalucia/Huelva/Huelva/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.HUELVA', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=68894', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.HUELVA', 'http://www.hoteles.com/de1644699/hoteles-huelva-area-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.HUESCA', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Aragon/Huesca/Huesca/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.HUESCA', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=68973', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.HUESCA', 'http://www.hoteles.com/de445461/hoteles-huesca-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.JAEN', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Andalucia/Jaen/Jaen/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.JAEN', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=69005', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.JAEN', 'http://www.hoteles.com/de1644700/hoteles-jaen-area-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.JEREZ_DE_LA_FRONTERA', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Andalucia/Cadiz/Jerez_de_la_Frontera/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.JEREZ_DE_LA_FRONTERA', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=68179', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.JEREZ_DE_LA_FRONTERA', 'http://www.hoteles.com/de1634476/hoteles-jerez-de-la-frontera-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.LEON', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Castilla_Leon/Leon/Leon/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.LEON', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=69101', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.LEON', 'http://www.hoteles.com/de1636429/hoteles-leon-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.LERIDA', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Catalunya/Lleida/Lleida/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.LERIDA', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=69112', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.LERIDA', 'http://www.hoteles.com/de1644703/hoteles-lleida-area-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.LOGRONO', 'http://www.centraldereservas.com/hotel/pages/Espa_a/La_Rioja/Logro_o/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.LOGRONO', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=128822', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.LOGRONO', 'http://www.hoteles.com/de456357/hoteles-logrono-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.LUGO', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Galicia/Lugo/Lugo/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.LUGO', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=69296', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.LUGO', 'http://www.hoteles.com/de1644704/hoteles-lugo-area-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.MADRID', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Comunidad_de_Madrid/Madrid/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.MADRID', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=69363', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.MADRID', 'http://www.hoteles.com/de457987/hoteles-madrid-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.MALAGA', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Andalucia/Malaga/Malaga/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.MALAGA', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=69542', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.MALAGA', 'http://www.hoteles.com/de444849/hoteles-malaga-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.MERIDA', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Extremadura/Badajoz/Merida/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.MERIDA', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=67950', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.MERIDA', 'http://www.hoteles.com/de441843/hoteles-merida-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.MURCIA', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Murcia/Murcia/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.MURCIA', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=69642', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.MURCIA', 'http://www.hoteles.com/de467168/hoteles-murcia-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.OVIEDO', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Asturias/Oviedo/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.OVIEDO', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=69860', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.OVIEDO', 'http://www.hoteles.com/de466882/hoteles-oviedo-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.PALENCIA', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Castilla_Leon/Palencia/Palencia/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.PALENCIA', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=69938', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.PALENCIA', 'http://www.hoteles.com/de451697/hoteles-palencia-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.PAMPLONA', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Navarra/Pamplona/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.PAMPLONA', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=69687', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.PAMPLONA', 'http://www.hoteles.com/de450754/hoteles-pamplona-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.PONTEVEDRA', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Galicia/Pontevedra/Pontevedra/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.PONTEVEDRA', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=69996', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.PONTEVEDRA', 'http://www.hoteles.com/de1644713/hoteles-pontevedra-area-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.SALAMANCA', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Castilla_Leon/Salamanca/Salamanca/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.SALAMANCA', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=70057', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.SALAMANCA', 'http://www.hoteles.com/de462776/hoteles-salamanca-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.SAN_SEBASTIAN', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Euskadi/Guipuzcoa/San_Sebastian/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.SAN_SEBASTIAN', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=68806', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.SAN_SEBASTIAN', 'http://www.hoteles.com/de462921/hoteles-san-sebastian-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.SANTANDER', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Cantabria/Santander/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.SANTANDER', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=70472', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.SANTANDER', 'http://www.hoteles.com/de464823/hoteles-santander-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.SANTIAGO_DE_COMPOSTELA', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Galicia/A_Coru_a/Santiago_de_Compostela/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.SANTIAGO_DE_COMPOSTELA', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=68582', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.SANTIAGO_DE_COMPOSTELA', 'http://www.hoteles.com/de1634640/hoteles-santiago-de-compostela-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.SEGOVIA', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Castilla_Leon/Segovia/Segovia/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.SEGOVIA', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=70492', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.SEGOVIA', 'http://www.hoteles.com/de1638575/hoteles-segovia-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.SEVILLA', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Andalucia/Sevilla/Sevilla/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.SEVILLA', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=70512', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.SEVILLA', 'http://www.hoteles.com/de447112/hoteles-sevilla-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.SORIA', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Castilla_Leon/Soria/Soria/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.SORIA', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=70617', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.SORIA', 'http://www.hoteles.com/de464282/hoteles-soria-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.TARRAGONA', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Catalunya/Tarragona/Tarragona/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.TARRAGONA', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=70629', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.TARRAGONA', 'http://www.hoteles.com/de454554/hoteles-tarragona-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.TERUEL', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Aragon/Teruel/Teruel/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.TERUEL', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=70707', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.TERUEL', 'http://www.hoteles.com/de1644718/hoteles-teruel-area-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.TOLEDO', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Castilla_la_Mancha/Toledo/Toledo/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.TOLEDO', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=70730', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.TOLEDO', 'http://www.hoteles.com/de451144/hoteles-toledo-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.VALENCIA', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Comunidad_Valenciana/Valencia/Valencia/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.VALENCIA', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=70748', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.VALENCIA', 'http://www.hoteles.com/de465941/hoteles-valencia-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.VALLADOLID', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Castilla_Leon/Valladolid/Valladolid/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.VALLADOLID', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=70818', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.VALLADOLID', 'http://www.hoteles.com/de448475/hoteles-valladolid-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.VIGO', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Galicia/Pontevedra/Vigo/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.VIGO', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=70001', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.VIGO', 'http://www.hoteles.com/de450953/hoteles-vigo-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.VITORIA', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Euskadi/Alava/Vitoria/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.VITORIA', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=67465', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.VITORIA', 'http://www.hoteles.com/de463002/hoteles-vitoria-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.ZAMORA', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Castilla_Leon/Zamora/Zamora/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.ZAMORA', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=70968', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.ZAMORA', 'http://www.hoteles.com/de1644722/hoteles-zamora-area-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''
    page.launch idLaunch,'CENTRALDERESERVAS_HotelList.ZARAGOZA', 'http://www.centraldereservas.com/hotel/pages/Espa_a/Aragon/Zaragoza/Zaragoza/index.html', '//div[@class="paginado"]/span/a[text()="siguiente"][1]', '//div[@class="OtrosHoteles"]', ''
    page.launch idLaunch,'HOTELINFO_HotelList.ZARAGOZA', 'http://www.hotel.info/Search.aspx?lng=CA&hs_validate=2&hs=0&hs_locationnr=70995', '(//img[@src="/Assets/images_ca/pfeil_weiter.gif"]/..)[1]', '//*[@id="footer"]/div/small[@class="sitefooterdisclaimer"]', ''
    page.launch idLaunch,'HOTELS_HotelList.ZARAGOZA', 'http://www.hoteles.com/de466128/hoteles-zaragoza-espana/', '//*[@id="pagination_see_more_link" or @id="lnk_nextPage"]', '//div[@class="list_foot" or @class="see_all_hotels"]', ''

  end
  
end

Then /^QBot should get a snapshot$/ do

end
