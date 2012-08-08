Given /^QBot is running$/ do
  visit BookingPage
end

When /^QBot is surfing a webpage$/ do
  on NextLinkPage do |page| 

#para subir modificaciones por ftp a amazon, utilizar la carpeta /tmp
#una vez alli, reubicar a la carpeta que sea necesaria
#si ha de ser manipulada, es posible que se necesiten cambios de permisos
#utilizar por ejemplo: sudo chmod ugo+rw launcheslog.xml


    #idLaunch = page.getLaunch
    #idLaunch='00000006'

    #idLaunch = page.getLaunch
    #page.launch idLaunch,'VENERE_HotelList.Buenos Aires', 'http://www.venere.com/es/argentina/buenos-aires/#p|1;f:o|venere_ranking-t|C-z|all_areas-r|r6-c|all_rate', '//*[@id="next" and @class="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    #page.launch idLaunch,'VENERE_HotelList.Tegucigalpa', 'http://www.venere.com/es/honduras/tegucigalpa/#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next" and @class="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'

    idLaunchTRIVAGO = page.getLaunch
    idLaunchEXPEDIA = page.getLaunch
    idLaunchVENERE = page.getLaunch
    
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList161.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-846011', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList312.Asuncion', 'http://www.expedia.com/Asuncion-Hotels-Guarani-Esplendor.h2097522.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList162.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-102685', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList497.Asuncion', 'http://www.venere.com/es/hoteles/asuncion/hotel-royal-gardens/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList313.Asuncion', 'http://www.expedia.com/Asuncion-Hotels-Sheraton-Asuncion-Hotel.h1097572.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList163.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-102687', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList164.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-997115', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList314.Asuncion', 'http://www.expedia.com/Asuncion-Hotels-Resort-Yacht-Y-Golf-Club-Paraguayo.h185564.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList498.Asuncion', 'http://www.venere.com/es/hoteles/asuncion/hotel-cecilia/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList165.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-102695', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList315.Asuncion', 'http://www.expedia.com/Asuncion-Hotels-Crowne-Plaza-Asuncion.h1379152.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList166.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-129862', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList167.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-102690', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList499.Asuncion', 'http://www.venere.com/es/hoteles/asuncion/terrazas-del-sol-apart-hotel/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList316.Asuncion', 'http://www.expedia.com/Asuncion-Hotels-La-Mision-Hotel-Boutique.h2411710.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList168.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-165203', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList317.Asuncion', 'http://www.expedia.com/Asuncion-Hotels-Granados-Park-Hotel.h1107405.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList169.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-102692', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList500.Asuncion', 'http://www.venere.com/es/hoteles/asuncion/hotel-la-espanola/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList170.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-1220706', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList318.Asuncion', 'http://www.expedia.com/Asuncion-Hotels-Internacional-Asuncion-Hotel-Suites.h979366.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList171.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-624491', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList319.Asuncion', 'http://www.expedia.com/Asuncion-Hotels-Hotel-Las-Margaritas.h3048510.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList501.Asuncion', 'http://www.venere.com/es/crowne-plaza-hotels/asuncion/crowne-plaza-asuncion/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList172.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-165273', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList320.Asuncion', 'http://www.expedia.com/Asuncion-Hotels-Hidden-Palace-Hotel.h5013935.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList173.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-102688', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList174.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-102689', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList502.Asuncion', 'http://www.venere.com/es/hoteles/asuncion/mision-hotel-boutique/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList321.Asuncion', 'http://www.expedia.com/Asuncion-Hotels-Hotel-Pantanal-Inn.h5259120.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList175.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-102694', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList322.Asuncion', 'http://www.expedia.com/Asuncion-Hotels-La-Morada-Posada-Boutique.h3994783.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList176.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-102693', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList503.Asuncion', 'http://www.venere.com/es/hoteles/asuncion/resort-yacht-golf-club-paraguayo/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList177.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-596556', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList323.Asuncion', 'http://www.expedia.com/Asuncion-Hotels-La-Espanola.h4258348.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList178.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-165209', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList324.Asuncion', 'http://www.expedia.com/Asuncion-Hotels-Hotel-Royal-Gardens.h4099816.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList504.Asuncion', 'http://www.venere.com/es/hoteles/asuncion/granados-park-hotel/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList179.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-1563587', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList180.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-1718381', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList325.Asuncion', 'http://www.expedia.com/Asuncion-Hotels-Terrazas-Del-Sol-Apart-Hotel.h1486330.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList181.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-102684', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList505.Asuncion', 'http://www.venere.com/es/pensiones/asuncion/pension-la-morada/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList326.Asuncion', 'http://www.expedia.com/Asuncion-Hotels-Hotel-Cecilia.h1172295.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList182.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-102686', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList327.Asuncion', 'http://www.expedia.com/Asuncion-Hotels-Hotel-Westfalnhaus.h538796.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList183.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-935523', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList506.Asuncion', 'http://www.venere.com/es/hoteles/asuncion/hotel-las-margaritas/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList184.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-997113', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList328.Asuncion', 'http://www.expedia.com/Asuncion-Hotels-Hotel-Palmas-Del-Sol.h1172298.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList185.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-102691', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList507.Bogota', 'http://www.venere.com/es/hoteles/bogota/borboleta-hotel/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList329.Asuncion', 'http://www.expedia.com/Asuncion-Hotels-Bourbon-Conmebol-Asuncion-Hote.h5013229.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList186.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-716796', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList187.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-1121716', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList330.Asuncion', 'http://www.expedia.com/Asuncion-Hotels-Hotel-Chaco.h15081.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList188.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-1815427', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList508.Bogota', 'http://www.venere.com/es/bandb/bogota/bandb-chorro-de-quevedo/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList331.Asuncion', 'http://www.expedia.com/Asuncion-Hotels-Portal-Del-Sol.h1172299.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList189.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-165291', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList190.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-1099500', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList332.Bogota', 'http://www.expedia.com/Bogota-Hotels-Casa-Dann-Carlton.h564960.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList509.Bogota', 'http://www.venere.com/es/hoteles/bogota/hotel-casa-deco/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList191.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-1720361', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList333.Bogota', 'http://www.expedia.com/Bogota-Hotels-Sofitel-Bogota-Victoria-Regia.h14472.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList192.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-1829323', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList510.Bogota', 'http://www.venere.com/es/hoteles/bogota/hotel-saint-simon/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList193.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-106981', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList334.Bogota', 'http://www.expedia.com/Bogota-Hotels-Ar-Hotel-Salitre.h3837228.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList194.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-165226', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList335.Bogota', 'http://www.expedia.com/Bogota-Hotels-Aloft-Bogota-Airport.h4750997.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList195.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-165260', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList511.Bogota', 'http://www.venere.com/es/hoteles/bogota/blue-suites-hotel/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList336.Bogota', 'http://www.expedia.com/Bogota-Hotels-Sonesta-Hotel-Bogota.h4258041.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList196.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-165281', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList197.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-165287', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList337.Bogota', 'http://www.expedia.com/Bogota-Hotels-Hilton-Bogota.h4018070.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList512.Bogota', 'http://www.venere.com/es/hoteles/bogota/hotel-dann-carlton-bogota/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList198.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-165288', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList338.Bogota', 'http://www.expedia.com/Bogota-Hotels-Hotel-Estelar-Windsor-House.h28244.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList199.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-165312', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList513.Bogota', 'http://www.venere.com/es/hoteles/bogota/hotel-casa-sarita/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList200.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-165378', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList339.Bogota', 'http://www.expedia.com/Bogota-Hotels-Bogota-Plaza-Summit-Hotel.h447639.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList201.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-965481', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList340.Bogota', 'http://www.expedia.com/Bogota-Hotels-JW-Marriott-Hotel-Bogota.h3565915.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList202.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-997139', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList514.Bogota', 'http://www.venere.com/es/hoteles/bogota/hotel-b3-virrey/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList203.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-1067602', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList341.Bogota', 'http://www.expedia.com/Bogota-Hotels-Hotel-Casa-Medina-Bogota.h17296.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList204.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-1099494', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList515.Bogota', 'http://www.venere.com/es/hoteles/bogota/abitare-56-hotel/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList342.Bogota', 'http://www.expedia.com/Bogota-Hotels-GHL-Hotel-Capital.h487021.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList205.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-1740139', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList343.Bogota', 'http://www.expedia.com/Bogota-Hotels-Hotel-Charleston-Bogota.h44342.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList206.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-1776121', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList516.Bogota', 'http://www.venere.com/es/hoteles/bogota/hotel-bogota-on-holidays/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList207.Asuncion', 'http://www.trivago.es/lugar-12/hotel/hotel-1829861', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList344.Bogota', 'http://www.expedia.com/Bogota-Hotels-Hotel-Estelar-La-Fontana.h21567.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''

  end
  
end

Then /^QBot should get a snapshot$/ do

end
