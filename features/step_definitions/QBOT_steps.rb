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
    
  page.launch idLaunch, 'MiNube_Usuarios.Id_0000005', 'http://www.minube.com/visualprofile/ajax_get_user_module/5', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_0028742', 'http://www.minube.com/visualprofile/ajax_get_user_module/28742', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_0070529', 'http://www.minube.com/visualprofile/ajax_get_user_module/70529', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_0072406', 'http://www.minube.com/visualprofile/ajax_get_user_module/72406', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_0072456', 'http://www.minube.com/visualprofile/ajax_get_user_module/72456', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_0073218', 'http://www.minube.com/visualprofile/ajax_get_user_module/73218', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_0073395', 'http://www.minube.com/visualprofile/ajax_get_user_module/73395', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_0074488', 'http://www.minube.com/visualprofile/ajax_get_user_module/74488', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_0078060', 'http://www.minube.com/visualprofile/ajax_get_user_module/78060', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_0078475', 'http://www.minube.com/visualprofile/ajax_get_user_module/78475', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_0082399', 'http://www.minube.com/visualprofile/ajax_get_user_module/82399', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_0148761', 'http://www.minube.com/visualprofile/ajax_get_user_module/148761', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_0278111', 'http://www.minube.com/visualprofile/ajax_get_user_module/278111', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_0564921', 'http://www.minube.com/visualprofile/ajax_get_user_module/564921', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_0616731', 'http://www.minube.com/visualprofile/ajax_get_user_module/616731', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_0747121', 'http://www.minube.com/visualprofile/ajax_get_user_module/747121', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1057821', 'http://www.minube.com/visualprofile/ajax_get_user_module/1057821', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1371621', 'http://www.minube.com/visualprofile/ajax_get_user_module/1371621', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1398981', 'http://www.minube.com/visualprofile/ajax_get_user_module/1398981', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_1598021', 'http://www.minube.com/visualprofile/ajax_get_user_module/1598021', '', '//*[@id="fb-root"]', ''
  page.launch idLaunch, 'MiNube_Usuarios.Id_2224421', 'http://www.minube.com/visualprofile/ajax_get_user_module/2224421', '', '//*[@id="fb-root"]', ''

     
  end
  
end

Then /^QBot should get a snapshot$/ do

end
