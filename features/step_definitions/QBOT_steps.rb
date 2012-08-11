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


    #idLaunch = page.getLaunch
    #idLaunch='00000006'

    #idLaunch = page.getLaunch
    #page.launch idLaunch,'VENERE_HotelList.Buenos Aires', 'http://www.venere.com/es/argentina/buenos-aires/#p|1;f:o|venere_ranking-t|C-z|all_areas-r|r6-c|all_rate', '//*[@id="next" and @class="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    #page.launch idLaunch,'VENERE_HotelList.Tegucigalpa', 'http://www.venere.com/es/honduras/tegucigalpa/#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next" and @class="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'

    idLaunchTRIVAGO = page.getLaunch
    idLaunchEXPEDIA = page.getLaunch
    idLaunchVENERE = page.getLaunch
    
    page.launch idLaunchTRIVAGO,'TRIVAGO_HotelCard.IdList2673.REPESCA01.Tegucigalpa', 'http://www.trivago.es/lugar-12/hotel/hotel-313941', '', '//*[@id="item_main_details"]/div[@class="details item"]', ''
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
