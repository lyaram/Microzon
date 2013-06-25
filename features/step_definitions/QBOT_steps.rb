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
    
  page.launch idLaunch, 'MiNube_Usuarios.Id_1398981', 'http://www.minube.com/visualprofile/ajax_get_user_module/1398981', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1405001', 'http://www.minube.com/visualprofile/ajax_get_user_module/1405001', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1416871', 'http://www.minube.com/visualprofile/ajax_get_user_module/1416871', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1420501', 'http://www.minube.com/visualprofile/ajax_get_user_module/1420501', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1425381', 'http://www.minube.com/visualprofile/ajax_get_user_module/1425381', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1430921', 'http://www.minube.com/visualprofile/ajax_get_user_module/1430921', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1433401', 'http://www.minube.com/visualprofile/ajax_get_user_module/1433401', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1440021', 'http://www.minube.com/visualprofile/ajax_get_user_module/1440021', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1447611', 'http://www.minube.com/visualprofile/ajax_get_user_module/1447611', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1450061', 'http://www.minube.com/visualprofile/ajax_get_user_module/1450061', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1451291', 'http://www.minube.com/visualprofile/ajax_get_user_module/1451291', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1477341', 'http://www.minube.com/visualprofile/ajax_get_user_module/1477341', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1477701', 'http://www.minube.com/visualprofile/ajax_get_user_module/1477701', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1484291', 'http://www.minube.com/visualprofile/ajax_get_user_module/1484291', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1489741', 'http://www.minube.com/visualprofile/ajax_get_user_module/1489741', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1494951', 'http://www.minube.com/visualprofile/ajax_get_user_module/1494951', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1531821', 'http://www.minube.com/visualprofile/ajax_get_user_module/1531821', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1535201', 'http://www.minube.com/visualprofile/ajax_get_user_module/1535201', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1563901', 'http://www.minube.com/visualprofile/ajax_get_user_module/1563901', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1572271', 'http://www.minube.com/visualprofile/ajax_get_user_module/1572271', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1596011', 'http://www.minube.com/visualprofile/ajax_get_user_module/1596011', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1598021', 'http://www.minube.com/visualprofile/ajax_get_user_module/1598021', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1618311', 'http://www.minube.com/visualprofile/ajax_get_user_module/1618311', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1623581', 'http://www.minube.com/visualprofile/ajax_get_user_module/1623581', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1650741', 'http://www.minube.com/visualprofile/ajax_get_user_module/1650741', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1667021', 'http://www.minube.com/visualprofile/ajax_get_user_module/1667021', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1729851', 'http://www.minube.com/visualprofile/ajax_get_user_module/1729851', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1734001', 'http://www.minube.com/visualprofile/ajax_get_user_module/1734001', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1740971', 'http://www.minube.com/visualprofile/ajax_get_user_module/1740971', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1749261', 'http://www.minube.com/visualprofile/ajax_get_user_module/1749261', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1752691', 'http://www.minube.com/visualprofile/ajax_get_user_module/1752691', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1753901', 'http://www.minube.com/visualprofile/ajax_get_user_module/1753901', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1759301', 'http://www.minube.com/visualprofile/ajax_get_user_module/1759301', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1776481', 'http://www.minube.com/visualprofile/ajax_get_user_module/1776481', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1785631', 'http://www.minube.com/visualprofile/ajax_get_user_module/1785631', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1787051', 'http://www.minube.com/visualprofile/ajax_get_user_module/1787051', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1807981', 'http://www.minube.com/visualprofile/ajax_get_user_module/1807981', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1811491', 'http://www.minube.com/visualprofile/ajax_get_user_module/1811491', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1828251', 'http://www.minube.com/visualprofile/ajax_get_user_module/1828251', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1830861', 'http://www.minube.com/visualprofile/ajax_get_user_module/1830861', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1845251', 'http://www.minube.com/visualprofile/ajax_get_user_module/1845251', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1850661', 'http://www.minube.com/visualprofile/ajax_get_user_module/1850661', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1900691', 'http://www.minube.com/visualprofile/ajax_get_user_module/1900691', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1910141', 'http://www.minube.com/visualprofile/ajax_get_user_module/1910141', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1919981', 'http://www.minube.com/visualprofile/ajax_get_user_module/1919981', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1933841', 'http://www.minube.com/visualprofile/ajax_get_user_module/1933841', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1958341', 'http://www.minube.com/visualprofile/ajax_get_user_module/1958341', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1962121', 'http://www.minube.com/visualprofile/ajax_get_user_module/1962121', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2001691', 'http://www.minube.com/visualprofile/ajax_get_user_module/2001691', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2005521', 'http://www.minube.com/visualprofile/ajax_get_user_module/2005521', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2012131', 'http://www.minube.com/visualprofile/ajax_get_user_module/2012131', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2079901', 'http://www.minube.com/visualprofile/ajax_get_user_module/2079901', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2083851', 'http://www.minube.com/visualprofile/ajax_get_user_module/2083851', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2104561', 'http://www.minube.com/visualprofile/ajax_get_user_module/2104561', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2111261', 'http://www.minube.com/visualprofile/ajax_get_user_module/2111261', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2126501', 'http://www.minube.com/visualprofile/ajax_get_user_module/2126501', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2127721', 'http://www.minube.com/visualprofile/ajax_get_user_module/2127721', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2133591', 'http://www.minube.com/visualprofile/ajax_get_user_module/2133591', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2151911', 'http://www.minube.com/visualprofile/ajax_get_user_module/2151911', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2169041', 'http://www.minube.com/visualprofile/ajax_get_user_module/2169041', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2193341', 'http://www.minube.com/visualprofile/ajax_get_user_module/2193341', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2205151', 'http://www.minube.com/visualprofile/ajax_get_user_module/2205151', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2224421', 'http://www.minube.com/visualprofile/ajax_get_user_module/2224421', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2225561', 'http://www.minube.com/visualprofile/ajax_get_user_module/2225561', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2238041', 'http://www.minube.com/visualprofile/ajax_get_user_module/2238041', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2240071', 'http://www.minube.com/visualprofile/ajax_get_user_module/2240071', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2243011', 'http://www.minube.com/visualprofile/ajax_get_user_module/2243011', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2248441', 'http://www.minube.com/visualprofile/ajax_get_user_module/2248441', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2268581', 'http://www.minube.com/visualprofile/ajax_get_user_module/2268581', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2276561', 'http://www.minube.com/visualprofile/ajax_get_user_module/2276561', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2289641', 'http://www.minube.com/visualprofile/ajax_get_user_module/2289641', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2293071', 'http://www.minube.com/visualprofile/ajax_get_user_module/2293071', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2298051', 'http://www.minube.com/visualprofile/ajax_get_user_module/2298051', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2311401', 'http://www.minube.com/visualprofile/ajax_get_user_module/2311401', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2323641', 'http://www.minube.com/visualprofile/ajax_get_user_module/2323641', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2379521', 'http://www.minube.com/visualprofile/ajax_get_user_module/2379521', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2393971', 'http://www.minube.com/visualprofile/ajax_get_user_module/2393971', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2412411', 'http://www.minube.com/visualprofile/ajax_get_user_module/2412411', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2430081', 'http://www.minube.com/visualprofile/ajax_get_user_module/2430081', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2449391', 'http://www.minube.com/visualprofile/ajax_get_user_module/2449391', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2457631', 'http://www.minube.com/visualprofile/ajax_get_user_module/2457631', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2460541', 'http://www.minube.com/visualprofile/ajax_get_user_module/2460541', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2484871', 'http://www.minube.com/visualprofile/ajax_get_user_module/2484871', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2525161', 'http://www.minube.com/visualprofile/ajax_get_user_module/2525161', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2574621', 'http://www.minube.com/visualprofile/ajax_get_user_module/2574621', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2630411', 'http://www.minube.com/visualprofile/ajax_get_user_module/2630411', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2665771', 'http://www.minube.com/visualprofile/ajax_get_user_module/2665771', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2680961', 'http://www.minube.com/visualprofile/ajax_get_user_module/2680961', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2711071', 'http://www.minube.com/visualprofile/ajax_get_user_module/2711071', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3175971', 'http://www.minube.com/visualprofile/ajax_get_user_module/3175971', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3197091', 'http://www.minube.com/visualprofile/ajax_get_user_module/3197091', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3247251', 'http://www.minube.com/visualprofile/ajax_get_user_module/3247251', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3279071', 'http://www.minube.com/visualprofile/ajax_get_user_module/3279071', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3284181', 'http://www.minube.com/visualprofile/ajax_get_user_module/3284181', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3316001', 'http://www.minube.com/visualprofile/ajax_get_user_module/3316001', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3318631', 'http://www.minube.com/visualprofile/ajax_get_user_module/3318631', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3335461', 'http://www.minube.com/visualprofile/ajax_get_user_module/3335461', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3342371', 'http://www.minube.com/visualprofile/ajax_get_user_module/3342371', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3378821', 'http://www.minube.com/visualprofile/ajax_get_user_module/3378821', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3405131', 'http://www.minube.com/visualprofile/ajax_get_user_module/3405131', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3411731', 'http://www.minube.com/visualprofile/ajax_get_user_module/3411731', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3424131', 'http://www.minube.com/visualprofile/ajax_get_user_module/3424131', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3438851', 'http://www.minube.com/visualprofile/ajax_get_user_module/3438851', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3439691', 'http://www.minube.com/visualprofile/ajax_get_user_module/3439691', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3450911', 'http://www.minube.com/visualprofile/ajax_get_user_module/3450911', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3459041', 'http://www.minube.com/visualprofile/ajax_get_user_module/3459041', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3461831', 'http://www.minube.com/visualprofile/ajax_get_user_module/3461831', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3499921', 'http://www.minube.com/visualprofile/ajax_get_user_module/3499921', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3502181', 'http://www.minube.com/visualprofile/ajax_get_user_module/3502181', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3530881', 'http://www.minube.com/visualprofile/ajax_get_user_module/3530881', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3553171', 'http://www.minube.com/visualprofile/ajax_get_user_module/3553171', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3558991', 'http://www.minube.com/visualprofile/ajax_get_user_module/3558991', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3561711', 'http://www.minube.com/visualprofile/ajax_get_user_module/3561711', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3574481', 'http://www.minube.com/visualprofile/ajax_get_user_module/3574481', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3581451', 'http://www.minube.com/visualprofile/ajax_get_user_module/3581451', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3594981', 'http://www.minube.com/visualprofile/ajax_get_user_module/3594981', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3626191', 'http://www.minube.com/visualprofile/ajax_get_user_module/3626191', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3647961', 'http://www.minube.com/visualprofile/ajax_get_user_module/3647961', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3650311', 'http://www.minube.com/visualprofile/ajax_get_user_module/3650311', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3663171', 'http://www.minube.com/visualprofile/ajax_get_user_module/3663171', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3665891', 'http://www.minube.com/visualprofile/ajax_get_user_module/3665891', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3666141', 'http://www.minube.com/visualprofile/ajax_get_user_module/3666141', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3672251', 'http://www.minube.com/visualprofile/ajax_get_user_module/3672251', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3675381', 'http://www.minube.com/visualprofile/ajax_get_user_module/3675381', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3697531', 'http://www.minube.com/visualprofile/ajax_get_user_module/3697531', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3706631', 'http://www.minube.com/visualprofile/ajax_get_user_module/3706631', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3733311', 'http://www.minube.com/visualprofile/ajax_get_user_module/3733311', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3733491', 'http://www.minube.com/visualprofile/ajax_get_user_module/3733491', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3737721', 'http://www.minube.com/visualprofile/ajax_get_user_module/3737721', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3745261', 'http://www.minube.com/visualprofile/ajax_get_user_module/3745261', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3766041', 'http://www.minube.com/visualprofile/ajax_get_user_module/3766041', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3805421', 'http://www.minube.com/visualprofile/ajax_get_user_module/3805421', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3813041', 'http://www.minube.com/visualprofile/ajax_get_user_module/3813041', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3825411', 'http://www.minube.com/visualprofile/ajax_get_user_module/3825411', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3854161', 'http://www.minube.com/visualprofile/ajax_get_user_module/3854161', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3857441', 'http://www.minube.com/visualprofile/ajax_get_user_module/3857441', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3866541', 'http://www.minube.com/visualprofile/ajax_get_user_module/3866541', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3896051', 'http://www.minube.com/visualprofile/ajax_get_user_module/3896051', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3911321', 'http://www.minube.com/visualprofile/ajax_get_user_module/3911321', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3911781', 'http://www.minube.com/visualprofile/ajax_get_user_module/3911781', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3929951', 'http://www.minube.com/visualprofile/ajax_get_user_module/3929951', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3940441', 'http://www.minube.com/visualprofile/ajax_get_user_module/3940441', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3993401', 'http://www.minube.com/visualprofile/ajax_get_user_module/3993401', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3996281', 'http://www.minube.com/visualprofile/ajax_get_user_module/3996281', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3996491', 'http://www.minube.com/visualprofile/ajax_get_user_module/3996491', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3996751', 'http://www.minube.com/visualprofile/ajax_get_user_module/3996751', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3996901', 'http://www.minube.com/visualprofile/ajax_get_user_module/3996901', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3996961', 'http://www.minube.com/visualprofile/ajax_get_user_module/3996961', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_3999041', 'http://www.minube.com/visualprofile/ajax_get_user_module/3999041', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4000841', 'http://www.minube.com/visualprofile/ajax_get_user_module/4000841', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4001991', 'http://www.minube.com/visualprofile/ajax_get_user_module/4001991', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4002711', 'http://www.minube.com/visualprofile/ajax_get_user_module/4002711', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4010251', 'http://www.minube.com/visualprofile/ajax_get_user_module/4010251', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4012791', 'http://www.minube.com/visualprofile/ajax_get_user_module/4012791', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4032801', 'http://www.minube.com/visualprofile/ajax_get_user_module/4032801', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4033391', 'http://www.minube.com/visualprofile/ajax_get_user_module/4033391', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4047211', 'http://www.minube.com/visualprofile/ajax_get_user_module/4047211', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4066401', 'http://www.minube.com/visualprofile/ajax_get_user_module/4066401', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4066451', 'http://www.minube.com/visualprofile/ajax_get_user_module/4066451', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4100181', 'http://www.minube.com/visualprofile/ajax_get_user_module/4100181', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4104521', 'http://www.minube.com/visualprofile/ajax_get_user_module/4104521', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4108851', 'http://www.minube.com/visualprofile/ajax_get_user_module/4108851', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4114201', 'http://www.minube.com/visualprofile/ajax_get_user_module/4114201', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4115911', 'http://www.minube.com/visualprofile/ajax_get_user_module/4115911', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4118101', 'http://www.minube.com/visualprofile/ajax_get_user_module/4118101', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4127531', 'http://www.minube.com/visualprofile/ajax_get_user_module/4127531', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4130131', 'http://www.minube.com/visualprofile/ajax_get_user_module/4130131', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4138581', 'http://www.minube.com/visualprofile/ajax_get_user_module/4138581', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4142891', 'http://www.minube.com/visualprofile/ajax_get_user_module/4142891', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4152541', 'http://www.minube.com/visualprofile/ajax_get_user_module/4152541', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4165051', 'http://www.minube.com/visualprofile/ajax_get_user_module/4165051', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4201311', 'http://www.minube.com/visualprofile/ajax_get_user_module/4201311', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4248261', 'http://www.minube.com/visualprofile/ajax_get_user_module/4248261', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4301271', 'http://www.minube.com/visualprofile/ajax_get_user_module/4301271', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4402271', 'http://www.minube.com/visualprofile/ajax_get_user_module/4402271', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4416211', 'http://www.minube.com/visualprofile/ajax_get_user_module/4416211', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4422201', 'http://www.minube.com/visualprofile/ajax_get_user_module/4422201', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4440321', 'http://www.minube.com/visualprofile/ajax_get_user_module/4440321', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4453391', 'http://www.minube.com/visualprofile/ajax_get_user_module/4453391', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4470661', 'http://www.minube.com/visualprofile/ajax_get_user_module/4470661', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4508491', 'http://www.minube.com/visualprofile/ajax_get_user_module/4508491', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4550561', 'http://www.minube.com/visualprofile/ajax_get_user_module/4550561', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4552321', 'http://www.minube.com/visualprofile/ajax_get_user_module/4552321', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4577891', 'http://www.minube.com/visualprofile/ajax_get_user_module/4577891', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4592041', 'http://www.minube.com/visualprofile/ajax_get_user_module/4592041', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4594501', 'http://www.minube.com/visualprofile/ajax_get_user_module/4594501', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4630141', 'http://www.minube.com/visualprofile/ajax_get_user_module/4630141', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4648671', 'http://www.minube.com/visualprofile/ajax_get_user_module/4648671', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4707621', 'http://www.minube.com/visualprofile/ajax_get_user_module/4707621', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4910677', 'http://www.minube.com/visualprofile/ajax_get_user_module/4910677', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4911652', 'http://www.minube.com/visualprofile/ajax_get_user_module/4911652', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4911722', 'http://www.minube.com/visualprofile/ajax_get_user_module/4911722', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4926921', 'http://www.minube.com/visualprofile/ajax_get_user_module/4926921', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4936875', 'http://www.minube.com/visualprofile/ajax_get_user_module/4936875', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4946333', 'http://www.minube.com/visualprofile/ajax_get_user_module/4946333', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4948039', 'http://www.minube.com/visualprofile/ajax_get_user_module/4948039', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4948529', 'http://www.minube.com/visualprofile/ajax_get_user_module/4948529', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4950946', 'http://www.minube.com/visualprofile/ajax_get_user_module/4950946', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4952246', 'http://www.minube.com/visualprofile/ajax_get_user_module/4952246', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4956014', 'http://www.minube.com/visualprofile/ajax_get_user_module/4956014', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4958298', 'http://www.minube.com/visualprofile/ajax_get_user_module/4958298', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4960543', 'http://www.minube.com/visualprofile/ajax_get_user_module/4960543', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4961858', 'http://www.minube.com/visualprofile/ajax_get_user_module/4961858', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4962461', 'http://www.minube.com/visualprofile/ajax_get_user_module/4962461', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4972547', 'http://www.minube.com/visualprofile/ajax_get_user_module/4972547', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4974912', 'http://www.minube.com/visualprofile/ajax_get_user_module/4974912', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4975748', 'http://www.minube.com/visualprofile/ajax_get_user_module/4975748', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4976859', 'http://www.minube.com/visualprofile/ajax_get_user_module/4976859', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4982290', 'http://www.minube.com/visualprofile/ajax_get_user_module/4982290', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4982394', 'http://www.minube.com/visualprofile/ajax_get_user_module/4982394', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4983841', 'http://www.minube.com/visualprofile/ajax_get_user_module/4983841', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4988390', 'http://www.minube.com/visualprofile/ajax_get_user_module/4988390', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4989886', 'http://www.minube.com/visualprofile/ajax_get_user_module/4989886', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4996558', 'http://www.minube.com/visualprofile/ajax_get_user_module/4996558', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_4999252', 'http://www.minube.com/visualprofile/ajax_get_user_module/4999252', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5007467', 'http://www.minube.com/visualprofile/ajax_get_user_module/5007467', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5011074', 'http://www.minube.com/visualprofile/ajax_get_user_module/5011074', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5012414', 'http://www.minube.com/visualprofile/ajax_get_user_module/5012414', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5013992', 'http://www.minube.com/visualprofile/ajax_get_user_module/5013992', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5015927', 'http://www.minube.com/visualprofile/ajax_get_user_module/5015927', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5022924', 'http://www.minube.com/visualprofile/ajax_get_user_module/5022924', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5025593', 'http://www.minube.com/visualprofile/ajax_get_user_module/5025593', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5025681', 'http://www.minube.com/visualprofile/ajax_get_user_module/5025681', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5027065', 'http://www.minube.com/visualprofile/ajax_get_user_module/5027065', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5027301', 'http://www.minube.com/visualprofile/ajax_get_user_module/5027301', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5027346', 'http://www.minube.com/visualprofile/ajax_get_user_module/5027346', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5027365', 'http://www.minube.com/visualprofile/ajax_get_user_module/5027365', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5027405', 'http://www.minube.com/visualprofile/ajax_get_user_module/5027405', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5027452', 'http://www.minube.com/visualprofile/ajax_get_user_module/5027452', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5027584', 'http://www.minube.com/visualprofile/ajax_get_user_module/5027584', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5027773', 'http://www.minube.com/visualprofile/ajax_get_user_module/5027773', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5028035', 'http://www.minube.com/visualprofile/ajax_get_user_module/5028035', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5028266', 'http://www.minube.com/visualprofile/ajax_get_user_module/5028266', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5030383', 'http://www.minube.com/visualprofile/ajax_get_user_module/5030383', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5030575', 'http://www.minube.com/visualprofile/ajax_get_user_module/5030575', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5030889', 'http://www.minube.com/visualprofile/ajax_get_user_module/5030889', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5033134', 'http://www.minube.com/visualprofile/ajax_get_user_module/5033134', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5033474', 'http://www.minube.com/visualprofile/ajax_get_user_module/5033474', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5034974', 'http://www.minube.com/visualprofile/ajax_get_user_module/5034974', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5036907', 'http://www.minube.com/visualprofile/ajax_get_user_module/5036907', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5037428', 'http://www.minube.com/visualprofile/ajax_get_user_module/5037428', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5038011', 'http://www.minube.com/visualprofile/ajax_get_user_module/5038011', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5039475', 'http://www.minube.com/visualprofile/ajax_get_user_module/5039475', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5041241', 'http://www.minube.com/visualprofile/ajax_get_user_module/5041241', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5041271', 'http://www.minube.com/visualprofile/ajax_get_user_module/5041271', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5041447', 'http://www.minube.com/visualprofile/ajax_get_user_module/5041447', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5078636', 'http://www.minube.com/visualprofile/ajax_get_user_module/5078636', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5079796', 'http://www.minube.com/visualprofile/ajax_get_user_module/5079796', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5087114', 'http://www.minube.com/visualprofile/ajax_get_user_module/5087114', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5092198', 'http://www.minube.com/visualprofile/ajax_get_user_module/5092198', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_5095289', 'http://www.minube.com/visualprofile/ajax_get_user_module/5095289', '', '//*[@id="fb-root"]', ''

     
  end
  
end

Then /^QBot should get a snapshot$/ do

end
