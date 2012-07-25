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


    idLaunch='00000006'
    page.launch idLaunch,'VENERE_HotelList.Buenos Aires', 'http://www.venere.com/es/argentina/buenos-aires/#p|1;f:o|venere_ranking-t|C-z|all_areas-r|r6-c|all_rate', '//*[@id="next" and @class="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'
    page.launch idLaunch,'VENERE_HotelList.Tegucigalpa', 'http://www.venere.com/es/honduras/tegucigalpa/#p|1;f:o|venere_ranking-t|C-z|-r|r6-c|all_rate', '//*[@id="next" and @class="next"]', '//*[@id="paging_bottom"]', '//*[@id="loading" and @style!="display: none;"]'

    idLaunch='00000007'
    page.launch idLaunch,'TRAVELOCITY_HotelList.REPESCA01.Managua', 'http://www.travelocity.com/trips/hotellist/datelessList?ac_country=NI&city=Managua&configId=S21949757&numRooms=1&path=hotels&pTxId=3719499&guestCodes=ADULT&guestCounts=1&hotelMaxReturnPerPage=25&startIndex=0', '(//a[@class="nextLink"])[1]', '(//div[@class="products"]/div[starts-with(@class,"product")])[last()]', ''
    page.launch idLaunch,'TRAVELOCITY_HotelList.REPESCA01.Montevideo', 'http://www.travelocity.com/trips/hotellist/datelessList?ac_country=UY&city=Montevideo&configId=S21949757&numRooms=1&path=hotels&pTxId=3719321&guestCodes=ADULT&guestCounts=1&hotelMaxReturnPerPage=25&startIndex=0', '(//a[@class="nextLink"])[1]', '(//div[@class="products"]/div[starts-with(@class,"product")])[last()]', ''
    page.launch idLaunch,'TRAVELOCITY_HotelList.REPESCA01.Quito ', 'http://www.travelocity.com/trips/hotellist/datelessList?ac_country=EC&city=Quito&configId=S21949757&numRooms=1&path=hotels&pTxId=3724484&guestCodes=ADULT&guestCounts=1&hotelMaxReturnPerPage=25&startIndex=0', '(//a[@class="nextLink"])[1]', '(//div[@class="products"]/div[starts-with(@class,"product")])[last()]', ''
    page.launch idLaunch,'TRAVELOCITY_HotelList.REPESCA01.Santiago de Chile', 'http://www.travelocity.com/trips/hotellist/datelessList?ac_country=CL&city=Santiago+De+Chile&configId=S21949757&numRooms=1&path=hotels&pTxId=3721977&guestCodes=ADULT&guestCounts=1&hotelMaxReturnPerPage=25&startIndex=0', '(//a[@class="nextLink"])[1]', '(//div[@class="products"]/div[starts-with(@class,"product")])[last()]', ''
    page.launch idLaunch,'TRAVELOCITY_HotelList.REPESCA01.Santo Domingo (Rep Dominicana)', 'http://www.travelocity.com/trips/hotellist/datelessList?ac_country=DO&city=Santo+Domingo&configId=S21949757&numRooms=1&path=hotels&pTxId=3725463&guestCodes=ADULT&guestCounts=1&hotelMaxReturnPerPage=25&startIndex=0', '(//a[@class="nextLink"])[1]', '(//div[@class="products"]/div[starts-with(@class,"product")])[last()]', ''

  end
  
end

Then /^QBot should get a snapshot$/ do

end
