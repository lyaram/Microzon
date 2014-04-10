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

 ##$DEBUG = true
 #   puts "chimpon"
 #   return
 #   idLaunch = "zzzzz"
 #   puts "zzzz... sigue?"

    p1 = File.read('/var/lib/jenkins/Init/db/param1').gsub(/[^0-9A-Za-z]/, '')
    p2 = File.read('/var/lib/jenkins/Init/db/param2').gsub(/[^0-9A-Za-z]/, '')

    #codificando:
    # 1. Agregar Drone de lanzazamiento en tblLaunches y recoger el idLaunch generado
    #    (en teoria ahora ya deberia empezar a generar idLaunch a partir del numero 696)
    # 2. Mientras existan registros, hacer bucle recogiendo el minimo idTarget de la tabla tblTargets sin estar Disabled
    # 3. Intentar incorporar el idTarget minimo anterior a la tabla tblDoneTargets
    # 4. Si no hay fallo, marcar como Disabled el registro de tblTargets de ese idTarget y ejecutar codigo
    # 5. Si hay error significa que ya lo ha recogido otro drone. Volver a 2

    begin
      con = Mysql.new 'localhost', p1, p2, 'Navigator'

      con.query('INSERT INTO tblLaunches(Drone) VALUES("Unknown")')
      idLaunch = con.query('select last_insert_id()').fetch_row.first
      puts idLaunch

      loop do
        idTarget = con.query('SELECT min(idTarget) FROM tblTargets where not(Disabled)').fetch_row.first
        puts idTarget

        break if idTarget.nil?

        idPillado = false
        begin
          con.query("INSERT INTO tblDoneTargets(idTarget) VALUES(#{idTarget})")
        rescue
          idPillado = true
          puts 'Fallo insert en tblDoneTargets'
        end

        unless idPillado
          con.query("UPDATE tblTargets SET Disabled=true WHERE idTarget = #{idTarget}")

          rs = con.query("SELECT * FROM tblTargets WHERE idTarget = #{idTarget}").fetch_row

          description = rs['Description']
          url = rs['URL']
          nextLink = rs['NextLink']
          checkPageCompleted = rs['checkPageCompleted']
          checkPageLoading = rs['checkPageLoading']
          maxPages = rs['MaxPages']

          page.launch idLaunch, description, url, nextLink, checkPageCompleted, checkPageLoading, maxPages
        end
      end

    rescue Mysql::Error => e
      puts e.errno
      puts e.error
    ensure
      con.close if con
    end

  end
  
end

Then /^QBot should get a snapshot$/ do

end
