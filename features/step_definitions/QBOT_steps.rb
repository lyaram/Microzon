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
    
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList1489.Sao Paulo', 'http://www.venere.com/es/hoteles/san-pablo/hotel-tsue-the-palace-flat/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2634.REPESCA01.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-1707667', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList1929.Sao Paulo', 'http://www.expedia.com/Sao-Paulo-Hotels-Transamerica-Classic-Victoria.h82899.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList1490.Sao Paulo', 'http://www.venere.com/es/hoteles/san-pablo/hotel-transamerica-prime-the-world/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2635.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-1710959', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList1491.Sao Paulo', 'http://www.venere.com/es/hoteles/san-pablo/hotel-transamerica-classic-higienopolis/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2636.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-1714535', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList1930.Sao Paulo', 'http://www.expedia.com/Sao-Paulo-Hotels-Transamerica-Exec-The-Advance.h691436.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2637.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-1721575', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList1931.Sao Paulo', 'http://www.expedia.com/Sao-Paulo-Hotels-Etoile-George-V-Jardins.h1678789.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2638.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-1754083', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList1492.Sao Paulo', 'http://www.venere.com/es/hoteles/san-pablo/hotel-slaviero-slim-congonhas/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2639.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-1754087', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList1932.Sao Paulo', 'http://www.expedia.com/Sao-Paulo-Hotels-Augusta-Park-Suite-Hotel.h526858.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2640.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-1754097', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList1493.Sao Paulo', 'http://www.venere.com/es/hoteles/san-pablo/hotel-transamerica-classic/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList1933.Sao Paulo', 'http://www.expedia.com/Sao-Paulo-Hotels-Riema-Saint-Charbel-Suites-Life.h1807419.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2641.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-1882841', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2642.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-1890749', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList1934.Sao Paulo', 'http://www.expedia.com/Sao-Paulo-Hotels-Amaralina-Hotel.h3469407.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList1494.Sao Paulo', 'http://www.venere.com/es/hoteles/san-pablo/hotel-newciti/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2643.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-1893267', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList1935.Sao Paulo', 'http://www.expedia.com/Sao-Paulo-Hotels-Porto-Palace-Hotel.h3958060.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2644.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-1911031', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList1936.Sao Paulo', 'http://www.expedia.com/Sao-Paulo-Hotels-Higienopolis-Hotel-Suites.h4593853.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2645.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-1931275', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList1495.Sao Paulo', 'http://www.venere.com/es/hoteles/san-pablo/hotel-riema-saint-charbel/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2646.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-1963011', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList1937.Sao Paulo', 'http://www.expedia.com/Sao-Paulo-Hotels-Transamerica-Clas-Higienopolis.h82863.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2647.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-2001147', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList1496.Sao Paulo', 'http://www.venere.com/es/hoteles/san-pablo/hotel-intercity-premium-ibirapuera/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList1938.Sao Paulo', 'http://www.expedia.com/Sao-Paulo-Hotels-Transamerica-Executive-Perdizes.h1807364.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2648.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-2021081', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2649.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-2043405', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList1939.Sao Paulo', 'http://www.expedia.com/Sao-Paulo-Hotels-Matsubara-Hotel.h1807598.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList1497.Sao Paulo', 'http://www.venere.com/es/pensiones/san-pablo/pension-green-place-flat/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2650.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-2086760', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList1940.Sao Paulo', 'http://www.expedia.com/Sao-Paulo-Hotels-The-Universe-Flat.h539460.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2651.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-2155714', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2652.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-2175458', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList1941.Sao Paulo', 'http://www.expedia.com/Sao-Paulo-Hotels-Transamerica-Prime-Paradise.h1807368.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList1498.Sao Paulo', 'http://www.venere.com/es/hoteles/san-pablo/hotel-transamerica-300186/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2653.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-2175522', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList1942.Sao Paulo', 'http://www.expedia.com/Osasco-Hotels-Best-Western-Osasco.h1172166.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2654.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-2176842', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList1499.Sao Paulo', 'http://www.venere.com/es/hoteles/san-pablo/grand-plaza-hotel/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2655.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-2176844', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList1943.Sao Paulo', 'http://www.expedia.com/Sao-Paulo-Hotels-Columbia.h1272703.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2656.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-2178232', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList1944.Sao Paulo', 'http://www.expedia.com/Sao-Paulo-Hotels-Transamerica-Exec-The-First.h4548862.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList1500.Sao Paulo', 'http://www.venere.com/es/hoteles/san-pablo/hotel-transamerica-executive/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2657.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-2178824', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList1945.Sao Paulo', 'http://www.expedia.com/Sao-Paulo-Hotels-Real-Castilha.h1175211.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2658.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-2180438', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2659.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-2234832', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList1501.Sao Paulo', 'http://www.venere.com/es/hoteles/san-pablo/matsubara-hotel/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList1946.Sao Paulo', 'http://www.expedia.com/Sao-Paulo-Hotels-Fortune-Residence-And-Executiv.h48060.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2660.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-2240280', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList1947.Sao Paulo', 'http://www.expedia.com/Sao-Paulo-Hotels-Travel-Inn-Ibirapuera.h915915.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2661.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-2248616', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList1502.Sao Paulo', 'http://www.venere.com/es/hoteles/san-pablo/lorena-hotel-internacional/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2662.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-2249294', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList1948.Sao Paulo', 'http://www.expedia.com/Sao-Paulo-Hotels-Hotel-Metropolitano.h1397721.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2663.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-2258696', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList1949.Sao Paulo', 'http://www.expedia.com/Sao-Paulo-Hotels-H3-Hotel-Paulista.h4559971.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList1503.Sao Paulo', 'http://www.venere.com/es/hoteles/san-pablo/hotel-intercity-premium-berrini/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2664.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-2271678', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2665.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-2278052', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList1950.Sao Paulo', 'http://www.expedia.com/Sao-Paulo-Hotels-Feller-Avenida-Paulista-Hotel.h1210615.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2666.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-2314900', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList1504.Sao Paulo', 'http://www.venere.com/es/hoteles/san-pablo/amaralina-hotel/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList1951.Tegucigalpa', 'http://www.expedia.com/Tegucigalpa-Hotels-Clarion-Hotel-Real-Tegucigalpa.h328468.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2667.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-2324764', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList1952.Tegucigalpa', 'http://www.expedia.com/Tegucigalpa-Hotels-Tegucigalpa-Marriott-Hotel.h1080711.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2668.Sao Paulo', 'http://www.trivago.es/lugar-12/hotel/hotel-2324768', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList1505.Sao Paulo', 'http://www.venere.com/es/hoteles/san-pablo/hotel-intercity-premium-nacoes-unidas/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2669.Tegucigalpa', 'http://www.trivago.es/lugar-12/hotel/hotel-314001', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList1953.Tegucigalpa', 'http://www.expedia.com/Tegucigalpa-Hotels-InterContinental-Real-Tegucigalpa.h551899.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2670.Tegucigalpa', 'http://www.trivago.es/lugar-12/hotel/hotel-1760853', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList1954.Tegucigalpa', 'http://www.expedia.com/Tegucigalpa-Hotels-Hotel-And-Casino-Excelsior.h461336.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList1506.Sao Paulo', 'http://www.venere.com/es/golden-tulip/san-pablo/hotel-interative/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2671.Tegucigalpa', 'http://www.trivago.es/lugar-12/hotel/hotel-952377', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2672.Tegucigalpa', 'http://www.trivago.es/lugar-12/hotel/hotel-100592', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList1955.Tegucigalpa', 'http://www.expedia.com/Tegucigalpa-Hotels-Hotel-Portal-Del-Angel.h897083.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2673.Tegucigalpa', 'http://www.trivago.es/lugar-12/hotel/hotel-313941', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList1507.Tegucigalpa', 'http://www.venere.com/es/intercontinental-hotels/tegucigalpa/hotel-intercontinental-real-tegucigalpa/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList1956.Tegucigalpa', 'http://www.expedia.com/Tegucigalpa-Hotels-Honduras-Maya-Hotel.h199423.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2674.Tegucigalpa', 'http://www.trivago.es/lugar-12/hotel/hotel-313956', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2675.Tegucigalpa', 'http://www.trivago.es/lugar-12/hotel/hotel-408931', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList1957.Tegucigalpa', 'http://www.expedia.com/Tegucigalpa-Hotels-Hotel-Plaza-Del-General.h526722.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList1508.Tegucigalpa', 'http://www.venere.com/es/clarion-hotels/tegucigalpa/hotel-clarion-tegucigalpa/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2676.Tegucigalpa', 'http://www.trivago.es/lugar-12/hotel/hotel-313991', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList1958.Tegucigalpa', 'http://www.expedia.com/Tegucigalpa-Hotels-Hotel-Plaza-San-Martin.h994823.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2677.Tegucigalpa', 'http://www.trivago.es/lugar-12/hotel/hotel-408946', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
    page.launch idLaunchEXPEDIA,'EXPEDIA_HotelCard.IdList1959.Tegucigalpa', 'http://www.expedia.com/Tegucigalpa-Hotels-Minister-Business-Hotel.h4970947.Hotel-Information', '', '//*[@id="reviewsSummaryBox"]', ''
    page.launch idLaunchVENERE,'VENERE_HotelCard.IdList1509.Tegucigalpa', 'http://www.venere.com/es/marriott-hotels/tegucigalpa/hotel-marriott-tegucigalpa/', '', '//*[@id="avg_guest_review"]', ''
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2678.Tegucigalpa', 'http://www.trivago.es/lugar-12/hotel/hotel-2077274', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''

  end
  
end

Then /^QBot should get a snapshot$/ do

end
