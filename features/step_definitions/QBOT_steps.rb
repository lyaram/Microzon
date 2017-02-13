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
    #idLaunch = page.getLaunch

 ##$DEBUG = true
 #   puts "chimpon"
 #   return
 #   idLaunch = "zzzzz"
 #   puts "zzzz... sigue?"

    p0 = File.read('/var/lib/jenkins/Init/db/param0').gsub(/[^.0-9A-Za-z]/, '')
    p1 = File.read('/var/lib/jenkins/Init/db/param1').gsub(/[^0-9A-Za-z]/, '')
    p2 = File.read('/var/lib/jenkins/Init/db/param2').gsub(/[^0-9A-Za-z]/, '')

    #codificando:
    # 1. Agregar Drone de lanzazamiento en tblLaunches y recoger el idLaunch generado
    #    (en teoria ahora ya deberia empezar a generar idLaunch a partir del numero 696)
    # 2. Mientras existan registros, hacer bucle recogiendo el minimo idTarget de la tabla tblTargets sin estar Disabled
    # 3. Intentar incorporar el idTarget minimo anterior a la tabla tblDoneTargets
    # 4. Si no hay fallo, marcar como Disabled el registro de tblTargets de ese idTarget y ejecutar codigo
    # 5. Si hay error significa que ya lo ha recogido otro drone. Volver a 2

    sobrecarga = false
    
    begin
      con = Mysql.new p0 , p1, p2, 'Navigator'

      ip = open('http://169.254.169.254/latest/meta-data/public-ipv4').read
      instanceId = open('http://169.254.169.254/latest/meta-data/instance-id').read
      updateDate = Time.now.strftime("%Y-%m-%d %H:%M:%S")  #vigilar que no haya que meterlo en utc Time.now.utc.to_s(:db)
      begin
        idConexion = con.query("SELECT idConexion FROM tblConexiones WHERE `InstanceId` = '#{instanceId}' AND `IP` = '#{ip}' ORDER BY idConexion DESC").fetch_row.first
        con.query("UPDATE `Navigator`.`tblConexiones` SET `UltimaConexion` = '#{updateDate}' WHERE `idConexion`=#{idConexion};")
      rescue
        con.query("INSERT INTO `Navigator`.`tblConexiones` (`IP`, `InstanceId`, `UltimaConexion`) VALUES ('#{ip}', '#{instanceId}', '#{updateDate}');")
        int_idConexion = con.query("select last_insert_id()").fetch_row.first.to_i
        idConexion = "%08d" % int_idConexion
      end
      
      con.query("INSERT INTO tblLaunches(Drone) VALUES('Unknown')")
      int_idLaunch = con.query("select last_insert_id()").fetch_row.first.to_i
      idLaunch = "%08d" % int_idLaunch
      page.prepararLaunch idLaunch
      puts idLaunch

      pillamientos = 0
      resetCountDown = 10000 #en TA con muchas fichas poner a 5 para evitar bloqueos
      
      loop do
        ssql = "SELECT min(idTarget) FROM tblTargets where Disabled=0 and time_stamp > '2015-12-21';"
      puts("CODETRACE >> #{__FILE__}:#{__LINE__}"); puts(ssql);$stdout.flush
        resetCountDown += -1
        
        #treses = con.query("SELECT count(*) FROM tblTargets WHERE disabled=3 and time_stamp > '2015-12-21';").fetch_row.first
        #puts "treses: " + treses
        #if (treses=='0')
        #  puts "DELETE"
        #  con.query("DELETE FROM tblDoneTargets")
        #  puts "The query has affected #{con.affected_rows} rows"
        #  puts "UPDATE"
        #  con.query("UPDATE tblTargets SET disabled=3 WHERE disabled=99 and time_stamp > '2015-12-21';")
        #  puts "The query has affected #{con.affected_rows} rows"         
        #end
 
        idTarget = con.query(ssql).fetch_row.first
        puts "Getting idTARGET (" + Time.now.strftime("%Y-%m-%d %H:%M:%S") + ") ....... "
        puts idTarget

        break if idTarget.nil?

        idPillado = false
        begin
      puts("CODETRACE >> #{__FILE__}:#{__LINE__}"); puts("INSERT INTO tblDoneTargets(idTarget) VALUES(#{idTarget});");$stdout.flush
           con.query("INSERT INTO tblDoneTargets(idTarget) VALUES(#{idTarget});")
        rescue
          idPillado = true
          pillamientos += 1
          puts 'Fallo insert en tblDoneTargets'
        end
        break if pillamientos>100

        unless idPillado
          updateDate = Time.now.strftime("%Y-%m-%d %H:%M:%S")  #vigilar que no haya que meterlo en utc Time.now.utc.to_s(:db)
          puts("CODETRACE >> #{__FILE__}:#{__LINE__}"); puts("UPDATE `Navigator`.`tblConexiones` SET `UltimaConexion` = '#{updateDate}' WHERE `idConexion`=#{idConexion};");$stdout.flush
          con.query("UPDATE `Navigator`.`tblConexiones` SET `UltimaConexion` = '#{updateDate}' WHERE `idConexion`=#{idConexion};")

          con.query("UPDATE tblTargets SET Disabled=99 WHERE idTarget = #{idTarget}")

          rs = con.query("SELECT Description,URL,NextLink,checkPageCompleted,checkPageLoading,MaxPages"\
                         " FROM tblTargets WHERE idTarget = #{idTarget}").fetch_row

          description = rs[0]
          url = rs[1]
          nextLink = rs[2]
          checkPageCompleted = rs[3]
          checkPageLoading = rs[4]
          maxPages = rs[5].to_i
          
          hayfallos = false
          begin
            page.launch con, idTarget, idConexion, idLaunch, description, url, nextLink, checkPageCompleted, checkPageLoading, maxPages
            con.query("UPDATE tblTargets SET Disabled=true WHERE idTarget = #{idTarget}")
            
            updateDate = Time.now.strftime("%Y-%m-%d %H:%M:%S")  #vigilar que no haya que meterlo en utc Time.now.utc.to_s(:db)
            con.query("UPDATE `Navigator`.`tblConexiones` SET `UltimaConexion` = '#{updateDate}' WHERE `idConexion`=#{idConexion};")
          rescue
            hayfallos = true
          end
         
         puts('CARGA DE SISTEMA:');puts(IO.read('/proc/loadavg'));$stdout.flush
         sobrecarga = (IO.read('/proc/loadavg').split[1].to_f>1.05)
         break if sobrecarga
         
         
         #Codigo para autodestruir al llegar al countdown o si hay fallo en el lanzamiento
         while (resetCountDown<=0 || hayfallos)
           pid = Process.spawn('sudo shutdown -P 1')
           begin
             Timeout.timeout(60) do
               puts 'waiting for the process to end'
               Process.wait(pid)
               puts 'process finished in time'
             end
           rescue Timeout::Error
             puts 'process not finished in time, killing it'
             # Process.kill('TERM', pid)
           end
           sleep 300    
         end
         

       end
      end

    rescue Mysql::Error => e
      puts e.errno
      puts e.error
    ensure
      con.close if con
      puts "CLOSING LAUNCH (" + Time.now.strftime("%Y-%m-%d %H:%M:%S") + ")"
      
      Dir::mkdir('screenshots') if not File.directory?('screenshots')
 
      begin
        screenshot = "./screenshots/DEBUG_IMG.png"
        Browser::BROWSER.driver.save_screenshot(screenshot)
        embed screenshot, 'image/png'
      rescue Exception => e
        puts "fallo de DEBUG_IMG"
        puts e.message; $stdout.flush
      end
      #if $headless
      #  $headless.take_screenshot(screenshot)
      #end
      
      begin
        htmlFile = "./screenshots/DEBUG_HTML.html"
        aFile = File.new(htmlFile, "w")
        aFile.write(Browser::BROWSER.html)
        aFile.close
      rescue Exception => e
        puts "fallo de DEBUG_HTML"
        puts e.message; $stdout.flush
      end
   end
    
   fail "sobrecarga en servidor" if sobrecarga
    
  end

  
end

Then /^QBot should get a snapshot$/ do

end
