class NextLinkPage

  #include WatirPageHelper
 
  #si al final hay que instalar gem, considerar Hpricot
  require 'rexml/document'
  include REXML 
    
  def getLaunch

    #folderbase = Dir.home() + "/BotStoring"
	folderbase = "/volHTML"
    folderlaunches = "/volHTML"
    
    maxi = 0
    carpetas = Dir.glob(folderlaunches + '/00*')
    carpetas.each do |pathcarpeta|
      carpeta = File.basename(pathcarpeta)
      numcarp = carpeta.to_i
      maxi = numcarp if numcarp > maxi
    end

    raise "No hay historial de carpetas para poder continuar" if maxi == 0
    
    indexLaunch = "%08d" % (maxi+1)
    ruta = folderlaunches + "/" + indexLaunch
    begin
      old_umask = File.umask
      File.umask 0
      Dir::mkdir(ruta, 0777)
    ensure
      File.umask old_umask
    end


#    launchesLogXml = folderbase + "/launcheslog.xml"
#
#    if not File.file?(launchesLogXml)
#      File.open(launchesLogXml, "w") do |f|
#        f.puts '<Launches/>'; $stdout.flush
#      end
#      indexLaunch = "%08d" % 1
#    end
#    
#    file = File.new(launchesLogXml)
#    doc = Document.new(file)
#    
#    if indexLaunch == ""
#      lastLaunch = XPath.match(doc.root, "//Launches/Launch[last()]").first
#      indexLaunch = "%08d" % ((lastLaunch.attributes["id"]).to_i+1)
#    end
#    
#    subdoc = Document.new("<Launch />")
#    subdoc.root.attributes["id"] = indexLaunch
#
#    doc.root.elements.add(subdoc.root)

    launchLogXml = ruta + "/launchlog.xml"
    doc = Document.new("<Launch />")
    File.open(launchLogXml,"w") do |data|
      data<<doc
    end
 
    return indexLaunch
  end

  def prepararLaunch idLaunch

    folderlaunches = "/volHTML"

    ruta = folderlaunches + "/" + idLaunch
    begin
      old_umask = File.umask
      File.umask 0
      Dir::mkdir(ruta, 0777)
    ensure
      File.umask old_umask
    end

    launchLogXml = ruta + "/launchlog.xml"
    doc = Document.new("<Launch />")
    File.open(launchLogXml,"w") do |data|
      data<<doc
    end

  end

  def launch con, idTarget, idConexion, idLaunch, descripcion, url, nextlink, checkPageCompleted, checkPageLoading, maxPage
    lasttime = Time.now.to_f

      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

    puts "Reiniciando firefox"
    pid = Process.spawn('firefox')
    @browser.close
    begin
        Timeout.timeout(20) do
            Process.wait
        end
    rescue Timeout::Error
        firefoxout = system("killall firefox")
        #Process.wait firefoxout
    end
    puts "firefox exited, pid = #{pid}"

    pid = Process.spawn('rm -rf ~/.mozilla')
    begin
      Timeout.timeout(5) do
        puts 'waiting for the process to end'
        Process.wait(pid)
        puts 'process finished in time'
      end
    rescue Timeout::Error
      puts 'process not finished in time, killing it'
      Process.kill('TERM', pid)
    end    
    
      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.timeout = 180
    profile = Selenium::WebDriver::Firefox::Profile.new
    if system("netstat -anltp|grep :9050")
      profile['network.proxy.socks'] = 'localhost'
      profile['network.proxy.socks_port'] = 9050
      profile['network.proxy.type'] = 1
    end
    if descripcion.include?('TAListMobile_') || descripcion.include?('DespegarMobile_') 
      profile['general.useragent.override']='Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_2_1 like Mac OS X; da-dk) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8C148 Safari/6533.18.5'
    elsif descripcion.include?('BOOKING_HotelFicha.')
      profile['general.useragent.override']='Mozilla/5.0 (Linux; U; Android 4.4.2; en-us; GT-P5210 Build/KOT49H) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30'      
    end
    @browser = Watir::Browser.new DRIVER, :profile => profile, :http_client => client
    @browser.window.resize_to(1024, 768)
    #@browser.driver.manage.timeouts.implicit_wait = 2

      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      reintentos = 3
      begin
        reintentos += -1
        puts '@browser.goto.Retries:' + reintentos.to_s ; $stdout.flush
        @browser.goto url 
        sleep 1

      puts "Buscando ventana principal..."
      titulo = @browser.title
      puts(titulo)


        ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        if descripcion.include? 'MiNube_Usuarios.Id_'
          jumptosuer = '(//a[contains(@href,"viajeros.minube.com")])[1]'
          browser.element(:xpath,jumptosuer).wait_until_present
          @browser.element(:xpath,jumptosuer).click
          sleep 1
        end
        if descripcion.include? 'Eurocampings_ReviewList.Id_'
          jumptosuer = '//*[@id="review_links"]/a'
          browser.element(:xpath,jumptosuer).wait_until_present
          @browser.element(:xpath,jumptosuer).click
          sleep 1
        end
        if descripcion.include? 'Logitravel_CruceroFicha.ID_'
          linkopis = '//*[starts-with(@id,"cruPest_")]/a[contains(./span/text(),"Opini")]'
          browser.element(:xpath,linkopis).wait_until_present
          @browser.element(:xpath,linkopis).click
          sleep 1
        end
        if descripcion.include? 'TRIPADVISOR_Atracciones.Tipo2.'
          linkactiv = '//*[@id="tab1"]/a[contains(@href,"-c25-")]'
          browser.element(:xpath,linkactiv).wait_until_present
          @browser.element(:xpath,linkactiv).click
          sleep 1
        end

        puts 'comprobando descripcion ... ' + descripcion  ; $stdout.flush
        if descripcion.include? 'CampingsOnline_PlaceList.'
          linkmore = '//*[@id="cart_mil"]/a[@action="see_more"]'
          begin
            while browser.element(:xpath,linkmore).exists?
              puts 'click' ; $stdout.flush
              browser.element(:xpath,linkmore).click
              sleep 1
              browser.element(:xpath,linkmore).wait_until_present
            end
          rescue
            #fallo
          end
        end
        rescue Exception => e
        puts e.message; $stdout.flush
        if reintentos>0
          retry
        end
      end

  
      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

  
    idCaptura = prepararCaptura idLaunch, descripcion, url, nextlink, checkPageCompleted #cambiar el anterior por otro proceso que verifique el ultimo indice utilizado registrado en un xml

      if descripcion.include? 'EXPEDIA_HotelList.'
        begin
          while @browser.element(:xpath,'//*[@id="edsModal"]//*[@id="modalCloseButton"]').exists?
            @browser.element(:xpath,'//*[@id="edsModal"]//*[@id="modalCloseButton"]').click
            sleep 3
          end
        rescue
          #fallo
        end

      end

      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      if descripcion.include? 'Eurocampings_ReviewList.'
        begin
          while @browser.element(:xpath,'descendant-or-self::*[contains(concat(" ", normalize-space(@class), " "), " fancybox-item ") and (contains(concat(" ", normalize-space(@class), " "), " fancybox-close "))]').exists?
            @browser.element(:xpath,'descendant-or-self::*[contains(concat(" ", normalize-space(@class), " "), " fancybox-item ") and (contains(concat(" ", normalize-space(@class), " "), " fancybox-close "))]').click
            sleep 3
          end
        rescue
          #fallo
        end

      end

      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      if descripcion.include? 'EuroRelais_ReviewList.'
        begin
          ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          while @browser.element(:xpath,'//*[not(contains(@class,"active")) and @name="tabReviews"]').exists?
            @browser.element(:xpath,'//*[not(contains(@class,"active")) and @name="tabReviews"]').click
            sleep 3
          end
          while @browser.element(:xpath,'//*[@class="display_more more plus" and not(contains(@style,"none"))]').exists?
            @browser.element(:xpath,'//*[@class="display_more more plus" and not(contains(@style,"none"))]').click
            sleep 3
          end
        rescue
          #fallo
        end

      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      end

      if descripcion.include? 'Airbnb_PlaceList.'
        begin
          while @browser.element(:xpath,'//*[@id="step-close"]').exists?
            @browser.element(:xpath,'//*[@id="step-close"]').click
            sleep 3
          end
        rescue
          #fallo
        end

      end

      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      if descripcion.include? 'BOOKING_HotelFicha.'
#        begin
          boxes = @browser.checkboxes(:class => 'language_filter_checkbox')
          boxes.each do |box| 
            if box.visible?
              if box.checked?
                box.clear            
                puts 'click' ; $stdout.flush
                sleep 3
               end
            end
          end

      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

          if @browser.element(:xpath,'//*[@id="review_sort"]').exists?
            @browser.select_list(:id => 'review_sort').select 'Date (newer to older)'
            sleep 3
          end
          
#        rescue
#          #fallo
#        end

      end

      if descripcion.include? 'ElTenedor_RestFicha.'
        begin
          ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          
          if @browser.element(:xpath,'//*[@id="cboxClose" and not(ancestor-or-self::*[contains(translate(@style," ",""),"display:none")])]').exists?
            @browser.element(:xpath,'//*[@id="cboxClose" and not(ancestor-or-self::*[contains(translate(@style," ",""),"display:none")])]').click
          end
          if @browser.element(:xpath,'//*[@title="close" and not(ancestor-or-self::*[contains(translate(@style," ",""),"display:none")])]').exists?
            @browser.element(:xpath,'//*[@title="close" and not(ancestor-or-self::*[contains(translate(@style," ",""),"display:none")])]').click
          end
          if @browser.element(:xpath,'//*[@id="restaurantTab-reviews"]//span[@class="check"]').exists?
            @browser.element(:xpath,'//*[@id="restaurantTab-reviews"]//span[@class="check"]').click
            sleep 3
          end
        rescue
          #fallo
        end
  
      end
    
      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      @browser.element(:xpath,checkPageCompleted).wait_until_present

      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      #Agregado para reorganizar opiniones de TA a más recientes primero sin preferencia de idioma
      if @browser.element(:xpath,'//option[@id="selFilterAll"]').exists?
      	if @browser.element(:xpath,'//option[@id="selFilterAll"]').visible?
          @browser.element(:xpath,'//option[@id="selFilterAll"]').click
        end
      end
      

      sleep 1
      puts "Organizando ventanas..."
      puts(@browser.title )
      if @browser.title != titulo
        @browser.window(:title, titulo).use
      end
      
      
      allLangRadioButton = './/*[@name="filterLang" and @value="ALL"]'
      if @browser.element(:xpath,allLangRadioButton).exists?
        if @browser.element(:xpath,allLangRadioButton).visible?
          @browser.element(:xpath,allLangRadioButton).click
          sleep 2
        end
      end

      sleep 1
      puts "Organizando ventanas..."
      puts(@browser.title )
      if @browser.title != titulo
        @browser.window(:title, titulo).use
      end

      
      
      
       #Desactivando filtro activo si lo si hay
       ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
       if @browser.element(:xpath,'//button[@class="clear"]').exists?
        if @browser.element(:xpath,'//button[@class="clear"]').visible?
           ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
           @browser.element(:xpath,'//button[@class="clear"]').click
          
           begin
            ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
            Timeout.timeout(60) do
              ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
              while (@browser.element(:xpath,"//button[@class='clear']").exists? ||
                     @browser.element(:xpath,".//*[@class='loadingBox' and not(ancestor-or-self::*[contains(translate(@style,' ',''),'display:none')])]").exists?)
                 sleep 1
              end
              ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
            end
           rescue Timeout::Error
            puts 'timeout para quitar filtro'
           end
        end
      end
      
      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      if descripcion.include? '.TAFilterSegment'
       ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
       
      puts("Ventanas: #{@browser.windows.count}")
      puts("Titulo:   #{@browser.title}")
       begin
        @browser.element(:xpath,"//*[@id='ratingFilter']").wait_until_present
       rescue 
        puts 'timeout esperando filtro'
       end

       if @browser.element(:xpath,"//*[@id='ratingFilter']").exists?
        filternumber = descripcion[/.*\.TAFilterSegment_(.*)\./,1]
        filterpath = ".//li/span/input[@name='filterSegment' and @value='#{filternumber}']"
        puts filterpath
        
        begin
          ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
           retries = 10
           while retries > 0
              retries += -1
              puts("Ventanas: #{@browser.windows.count}")
              puts("Titulo:   #{@browser.title}")
              ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
              @browser.element(:xpath,filterpath).click
              ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
              chkdfilterpath = ".//li/span/input[@name='filterSegment' and @checked and @value='#{filternumber}']"
              begin
                @browser.element(:xpath,chkdfilterpath).wait_until_present
              rescue
                puts("Filter sin clicar...")
                ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
                @browser.refresh
                @browser.wait 60

              end
              if @browser.element(:xpath,chkdfilterpath).exists?
                retries = 0
              end
           end

          ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          @browser.element(:xpath,"//button[@class='clear']").wait_until_present
          ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        rescue => error
          puts("ERROR:")
          puts("Error.class: #{error.class}")
          puts("Error.msg: #{error.message}")
          ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        
          aFile = File.new("/volHTML/debug/" + Time.now.strftime("%y%m%d_%H%M%S_%9N") + ".htm", "w")
          htmlPage=@browser.html
          aFile.write(htmlPage)
          aFile.close
        
          puts "Fallo con filtro #{filternumber}"
          return
        end
       end
      end
      
 #Aplicar el siguiente codigo para ordenaciones por idioma en TA
    
#    if @browser.element(:xpath,"//form[contains(@id,'review_filter_controls')]/div[contains(@class,'language')]").exists?
#      @browser.element(:xpath,"(//form[contains(@id,'review_filter_controls')]/div[contains(@class,'language')]/ul/li/span/input)[last()]").click
#      sleep 5
#      begin
#        Timeout.timeout(300) do
#          while(@browser.element(:xpath,"//*[@class='loadingBox' and not(ancestor-or-self::*[contains(translate(@style,' ',''),'display:none')])]").exists?)
#            sleep 1
#          end
#        end
#      rescue Timeout::Error
#
#      end
#      @browser.element(:xpath,"//form[contains(@id,'review_filter_controls')]/div[contains(@class,'language')]/ul/li/span/input[@value='ALL']").click
#    end    
#    
#    if @browser.element(:xpath,'//*[@id="LANG_FORM"]').exists? 
#      if not(@browser.element(:xpath,'//*[@id="LANG_FORM"]//span[@class="selected" and contains(./text(),"Any")]').exists?)
#        @browser.element(:xpath,'//*[@id="LANG_FORM"]/fieldset//span[@class="sprite-date_picker-triangle"]').click
#        @browser.element(:xpath,'.//*[@id="selFilterAll"]').click
#        sleep 3      
#        begin  
#          @browser.element(:xpath,'//*[@id="LANG_FORM"]//span[@class="selected" and contains(./text(),"Any")]').wait_until_present
#         rescue Exception => e
#           puts e.message    ; $stdout.flush
#         end
#        sleep 3      
#      end
#    end

#    if @browser.element(:xpath,'//select[@id="filterLang"]/option[@value="ru" and not(@selected)]').exists?
#      @browser.element(:xpath,'//select[@id="filterLang"]/option[@value="ru"]').select
#      sleep 3      
#      begin
#        @browser.element(:xpath,'//select[@id="filterLang"]/option[@value="ru"]/@selected').wait_until_present
#      rescue Exception => e
#        puts e.message    ; $stdout.flush
#      end
#      sleep 3      
#    end

      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

    if descripcion.include? '.GotoTAPag'
      newurl = @browser.url
      newurl = newurl.gsub('-Reviews-','-Reviews-or' + descripcion.scan(/\.GotoTAPag(.*)\./)[0][0] + '-')
      @browser.goto newurl
      sleep 1
      @browser.element(:xpath,checkPageCompleted).wait_until_present
    end
    
    if descripcion.include? 'GMapsPlaceFull.ID' 
      puts "In GMapsPlace"
      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      div_scrollable_y = @browser.element(:xpath,"//*[contains(@class,'scrollable-y')]")
      scroll_top_script = 'arguments[0].scrollTop = arguments[0].scrollHeight'
      div_scrollable_y.browser.execute_script(scroll_top_script, div_scrollable_y)
       
      enlaceReviews = "//button[contains(translate(text(),'REVIEW','review'),'review')]"
      hayReviews = true
      puts @browser.element(:xpath,enlaceReviews).outer_html
      begin
        puts "esperando enlaceReviews"    ; $stdout.flush
        @browser.element(:xpath,enlaceReviews).wait_until_present
      rescue Exception => e
        puts "fallo enlaceReviews"    ; $stdout.flush
        puts e.message    ; $stdout.flush
        hayReviews = false
      end
       
      puts "go clicking enlaceReviews"    ; $stdout.flush
      if @browser.element(:xpath,enlaceReviews).visible?
        puts "clicking enlaceReviews"    ; $stdout.flush
        @browser.element(:xpath,enlaceReviews).click
        sleep 1
        puts "waiting reviews"
        ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        @browser.element(:xpath,"//*[text()='Sort by:']").wait_until_present
        sleep 3
        div_with_scroll = @browser.element(:xpath,"//*[contains(@class,'section-scrollbox')]")
        scroll_top_script = 'arguments[0].scrollTop = arguments[0].scrollTop + 200'
        scrollcount = 0
        while @browser.element(:xpath,"//*[contains(@class,'section-loading')]").exists?
          puts "scrolling down"
          ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          div_with_scroll.browser.execute_script(scroll_top_script, div_with_scroll)
          sleep 2
          scrollcount += 1
          if scrollcount > 10000
            stDT = Time.now.strftime("%y%m%d_%H%M%S_%9N") 
            aFile = File.new("/volHTML/debug/" + stDT + ".htm", "w")
            htmlPage=@browser.html
            aFile.write(htmlPage)
            aFile.close
            storePagePng stDT
            raise "SCROLL FALLIDO"
          end
        end
      end
    end

    repeatPageCountDownMax = 30
    repeatPageCountDown = repeatPageCountDownMax
    
    @numPag = 0
    loop do
      @numPag += 1
      
      recargar = false
      sigueprobando=true
      reintentos = 5
      begin
        while sigueprobando
          reintentos += -1
        ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        puts descripcion + '.chkLOAD.Pag:' + @numPag.to_s + '.Retries:' + reintentos.to_s ; $stdout.flush
          
          if recargar
            @browser.refresh
            @browser.wait 60
          end
          recargar = false
          
          puts "Organizando ventanas..."
          puts(@browser.title )
          if @browser.title != titulo
            #agregando esta condición para los casos que la ventana activa cambia el Título
            if @browser.window(:title, titulo).exists?
              @browser.window(:title, titulo).use
            else
              titulo = @browser.title
            end
          end

          closeModal = '//*[@class="ui_close_x"]'
          if @browser.element(:xpath,closeModal).exists?
            @browser.element(:xpath,closeModal).click
          end
          
         @browser.element(:xpath,checkPageCompleted).wait_until_present
          
          break if checkPageLoading==''
          
          if descripcion.include? 'Airbnb_PlaceList.'
             sleep 10
          end
          sleep 5
          if !@browser.element(:xpath,checkPageLoading).exists?
            break
          end

          if reintentos<=0  
            sigueprobando = false
          end
        end
      rescue Exception => e
        ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
		    strDT = Time.now.strftime("%y%m%d_%H%M%S_%9N")
        puts strDT + ": " + e.message; $stdout.flush

        aFile = File.new("/volHTML/debug/" + strDT + ".htm", "w")
        htmlPage=@browser.html
        aFile.write(htmlPage)
        aFile.close
        
#        if e.message == 'end of file reached'
#          recargar=true
#        else
#          aFile = File.new(Dir.home() + "/BotStoring/debug/" + strDT + ".htm", "w")
#          htmlPage=@browser.html
#          aFile.write(htmlPage)
#          aFile.close
#        end
    		
        break if reintentos<=0
        retry
      end
      
      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      if descripcion.include? 'TRIPADVISOR_RestFicha.'
        if @browser.element(:xpath,"//*[@class='pageNum current']").exists?
          webpage = @browser.element(:xpath,"//*[@class='pageNum current']").text
          if webpage.strip.to_i!=@numPag
            puts "Paginado no esperado (#{webpage.strip} != #{@numPag})"
            if (repeatPageCountDown > 0)
              @numPag += -1
              repeatPageCountDown += -1
              puts "Reintentando paginado correcto (#{repeatPageCountDown})"
            else
              fail "fallo en paginacion TRIPADVISOR"
            end
          else
            repeatPageCountDown = repeatPageCountDownMax
          end 
        end
      end
      
          #htmlPage = Nokogiri::HTML.parse(@browser.html)
    
    #$DEBUG = true

      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
     puts 'Ejecutando htmlPage = @browser.html'; $stdout.flush
  
     sigueprobando=true
     reintentos = 5
     while sigueprobando
       begin 
          puts 'Intento #' + reintentos.to_s; $stdout.flush
          reintentos += -1
      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          htmlPage = @browser.html
      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          sigueprobando = false 
       rescue Exception => e
          puts 'Intento fallido: ' + e.message    ; $stdout.flush
          if reintentos<=0  
            sigueprobando=false
          else
            @browser.refresh
            @browser.wait 60
          end
       end
     end

     #$DEBUG = false

      
      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      
      
      sleep 2
      @browser.element(:xpath,checkPageCompleted).wait_until_present

      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      closeModal = '//*[@class="ui_close_x"]'
      if @browser.element(:xpath,closeModal).exists?
        @browser.element(:xpath,closeModal).click
      end

      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      
      buttonNoTranslation = '//*[@id="REVIEWS"]/div[starts-with(@id,"review_")]/div[not(@style="display: none;")]//form[@class="translationOptionForm"]/label/input[@value="false" and not(@checked)]'
      reintentos = 10
      while @browser.element(:xpath,buttonNoTranslation).exists?
        reintentos += -1
        break if reintentos<0
        @browser.element(:xpath,buttonNoTranslation).click
        sleep 2

        ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
  
        closeModal = '//*[@class="ui_close_x"]'
        if @browser.element(:xpath,closeModal).exists?
          @browser.element(:xpath,closeModal).click
        end

        ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      end

      if @browser.element(:xpath,'//div[@class="xCloseGreen"]').exists?
        sleep 30
        ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        @browser.element(:xpath,'//body').click
        #@browser.iframe(:id,"overlayRegFrame").element(:xpath,".//div[starts-with(@class,'submitBtn')]").wait_until_present
        #@browser.iframe(:id,"overlayRegFrame").text_field(:id,"email").set SecureRandom.hex[0..(8+rand(3))] + "@gmail.com"
        #@browser.iframe(:id,"overlayRegFrame").element(:xpath,".//div[starts-with(@class,'submitBtn')]").click
        sleep 2
      end

      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      linkMore = '//*[@id="REVIEWS"]//div[starts-with(@id,"review_")]//span[contains(@class,"taLnk") and contains(text(),"More") and not(ancestor-or-self::*[contains(translate(@style," ",""),"display:none")])]'
      if descripcion.include? '.TAFilterSegment' 
        linkMore = '/nada'
      end
      reintentos = 50
      while @browser.element(:xpath,linkMore).exists?
        ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        if (reintentos<25 and linkMore.split(//).last(3).join=='[1]') 
          ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          puts 'linkMore BEFORE:' + linkMore
          linkMore = linkMore[0..(linkMore.length-4)] + '[last()]'
          puts 'linkMore AFTER:' + linkMore
        end
        ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        reintentos += -1
        if reintentos<0
          stDT = Time.now.strftime("%y%m%d_%H%M%S_%9N") 
          aFile = File.new("/volHTML/debug/" + stDT + ".htm", "w")
          htmlPage=@browser.html
          aFile.write(htmlPage)
          aFile.close
          storePagePng stDT
 
          break
        end
        @browser.element(:xpath,linkMore).wd.location_once_scrolled_into_view
        @browser.send_keys :page_up
        @browser.element(:xpath,linkMore).click
        sleep 2
        if @browser.element(:xpath,'//div[@class="xCloseGreen"]').exists?
          sleep 30
          ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          @browser.iframe(:id,"overlayRegFrame").element(:xpath,".//*[@id='regSignIn']").wait_until_present
          @browser.element(:xpath,'//body').click
          #@browser.iframe(:id,"overlayRegFrame").element(:xpath,".//div[starts-with(@class,'submitBtn')]").wait_until_present
          #@browser.iframe(:id,"overlayRegFrame").text_field(:id,"email").set SecureRandom.hex[0..(8+rand(3))] + "@gmail.com"
          #@browser.iframe(:id,"overlayRegFrame").element(:xpath,".//div[starts-with(@class,'submitBtn')]").click
          sleep 2
        end
        ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        closeModal = '//*[@class="ui_close_x"]'
        if @browser.element(:xpath,closeModal).exists?
          sleep 5
          ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          @browser.element(:xpath,closeModal).click
        end
      end
      
      if reintentos<-99999 #Desactivando la interrupcion cuando se encuentra un "more" imposible de desplegar.
      #if reintentos<0      #ACTIVAR DE NUEVO CON <0
           pid = Process.spawn('sudo shutdown -P now')
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
           fail 'Fallo reset paginado'
       end

      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      linkMore = '//*[starts-with(@id,"review_")]//span[starts-with(@class,"taLnk") and not(ancestor-or-self::*[contains(translate(@style," ",""),"display:none")])]'
      if descripcion.include? '.TAFilterSegment' 
        linkMore = '/nada'
      end
      reintentos = 10
      while @browser.element(:xpath,linkMore).exists?
        ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        reintentos += -1
        break if reintentos<0
        @browser.element(:xpath,linkMore).wd.location_once_scrolled_into_view
        @browser.send_keys :page_up
        @browser.element(:xpath,linkMore).click
        ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        sleep 2
        if @browser.element(:xpath,'//div[@class="xCloseGreen"]').exists?
          sleep 30
          ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          @browser.element(:xpath,'//body').click
          #@browser.iframe(:id,"overlayRegFrame").element(:xpath,".//div[starts-with(@class,'submitBtn')]").wait_until_present
          #@browser.iframe(:id,"overlayRegFrame").text_field(:id,"email").set SecureRandom.hex[0..(8+rand(3))] + "@gmail.com"
          #@browser.iframe(:id,"overlayRegFrame").element(:xpath,".//div[starts-with(@class,'submitBtn')]").click
          sleep 2
        end
        ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        closeModal = '//*[@class="ui_close_x"]'
        if @browser.element(:xpath,closeModal).exists?
          sleep 5
          ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          @browser.element(:xpath,closeModal).click
        end
      end

      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      if @browser.element(:xpath,'//div[@class="xCloseGreen"]').exists?
        sleep 30
        @browser.iframe(:id,"overlayRegFrame").element(:xpath,".//div[starts-with(@class,'submitBtn')]").wait_until_present
        @browser.iframe(:id,"overlayRegFrame").text_field(:id,"email").set SecureRandom.hex[0..(8+rand(3))] + "@gmail.com"
        @browser.iframe(:id,"overlayRegFrame").element(:xpath,".//div[starts-with(@class,'submitBtn')]").click
        sleep 2
      end

      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      linkMore = './/*[@class="review_item_response_more"]'
      reintentos = 10
      while @browser.element(:xpath,linkMore).exists?
        reintentos += -1
        break if reintentos<0
        @browser.element(:xpath,linkMore).wd.location_once_scrolled_into_view
        @browser.send_keys :page_up
        @browser.element(:xpath,linkMore).click
        sleep 2
      end

      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

     if @browser.element(:xpath,'//div[@class="wrap more"]/a[contains(@class,"set_reviewExpand")]').exists?
        @browser.element(:xpath,'//div[@class="wrap more"]/a[contains(@class,"set_reviewExpand")]').click
        begin
          @browser.element(:xpath,'//div[@class="note"]').wait_until_present
        rescue
          #fallo
        end
      end

      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

		estoprural = false
		begin
		  while @browser.element(:xpath,'//p[not(@style="display: none;")]/*[@id="twentymore"]').exists?
			estoprural = true
			@browser.element(:xpath,'//p[not(@style="display: none;")]/*[@id="twentymore"]').click
			sleep 2
		  end
		rescue
		  #fallo
		end

      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
		
		if estoprural
			@browser.goto @browser.url.gsub('#page','?page=')
		    sleep 1
		    @browser.element(:xpath,checkPageCompleted).wait_until_present
		end

      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

		begin
		  while @browser.element(:xpath,'//*[@id="moreExperiencesContainer" and not(@style="display: none;")]').exists?
			@browser.element(:xpath,'//*[@id="moreExperiencesContainer" and not(@style="display: none;")]').click
			sleep 2
		  end
		rescue
		  #fallo
		end

      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      begin
        while @browser.element(:xpath,'//*[@id="edsModal"]//*[@id="modalCloseButton"]').exists?
          @browser.element(:xpath,'//*[@id="edsModal"]//*[@id="modalCloseButton"]').click
          sleep 2
        end
      rescue
        #fallo
      end

      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

#Descartado porque no carga siempre
   # #cargando dims en AT
   # i = 0
   # elems = @browser.spans(:class, /opi-rating/i)
   # elems.each do |elem|
   #   i += 1
   #   puts i.to_s + '. opi-rating: ' + elem.text    ; $stdout.flush
   #   elem.click
   #   sleep 1
   # end
  
      
      storePage con, idTarget, idConexion, idLaunch, idCaptura, @numPag
      #abort("Aborting to check fail")
      
      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      puts url; $stdout.flush
      #puts checkPageCompleted
      #ttt = @browser.element(:xpath,checkPageCompleted).text
      #puts ttt
      
      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      break if @numPag>=maxPage

	  if descripcion.include? 'Hotels_Ficha.'
		xpage = '//div[1]/div/ul/li/em'
		break if !@browser.element(:xpath,xpage).exists?
		indicepagina = @browser.element(:xpath,xpage).text
		postotal = 4 + (indicepagina.index ' de ')
		ptotal = indicepagina[postotal..-1].to_i
		break if @numPag >= ptotal
	  end	  

      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      reintentos = 5
      begin
        reintentos += -1
        puts descripcion + '.chkNEXT.Pag:' + @numPag.to_s + '.Retries:' + reintentos.to_s ; $stdout.flush
      rescue
        break if reintentos<=0
        retry
      end
      break if nextlink==''
      break if !@browser.element(:xpath,nextlink).exists?
      
      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      reintentos = 3
      begin
        reintentos += -1
        puts '@browser.element(:xpath,nextlink).click.Retries:' + reintentos.to_s ; $stdout.flush
        @browser.element(:xpath,nextlink).wd.location_once_scrolled_into_view
        @browser.send_keys :page_up
        @browser.element(:xpath,nextlink).click
        sleep 2
      rescue Exception
        puts $!, $@
        if reintentos>0
          retry
        end
      end

      ahora = Time.now; tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

    end 
    #para empaquetar previo ftp, usar este comando en consola
    # zip -r 00001.zip 00001/
    #
    #para empaquetar todos los xml de captura:
    #zip FullCapt.zip -r */captura.xml
    #
    #para empaquetar varias carpetas de html:
    #zip FullHTML.zip -r 00000009/ 00000010/(ETC.ETC.ETC.ETC.ETC.ETC.ETC.)
    
    #para sincronizar carpeta trabajo y carpeta de publicacion 
    # sudo rsync -a /var/lib/jenkins/BotStoring/png /vol/BotStoring/
  end
  
  def prepararCaptura idLaunch, descripcion, url, nextlink, checkPageCompleted

    #folderbase = Dir.home() + "/BotStoring"
    folderlaunches = "/volHTML/" #"Dir.home() + "/BotStoring/launches/" 
    folderlaunch = "/volHTML/" + idLaunch + '/' #Dir.home() + "/BotStoring/launches/" + idLaunch + '/'

    launchLogXml = folderlaunch + "launchlog.xml"

    file = File.new(launchLogXml)
    fichtxt = file.read
    ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')
    fichtxtclean = ic.iconv(fichtxt + ' ')[0..-2]
    doc = Document.new(fichtxtclean)
    eLaunch = XPath.match(doc.root, "/Launch").first

    indexCaptura = ""
    if XPath.match(eLaunch, "./Captura").empty?
      indexCaptura = "%08d" % 1
    else
      lastLaunch = XPath.match(eLaunch, "./Captura[last()]").first
      indexCaptura = "%08d" % ((lastLaunch.attributes["id"]).to_i+1)
    end

    subdoc = Document.new("<Captura />")
    subdoc.root.attributes["id"] = indexCaptura
    eFechaHora = subdoc.root.add_element "FechaHora"
    eFechaHora.text = Time.now.to_s
    eDescripcion = subdoc.root.add_element "Descripcion"
    eDescripcion.text = descripcion
    eURL = subdoc.root.add_element "URL"
    eURL.text = url
    eNextLink = subdoc.root.add_element "NextLink"
    eNextLink.text = nextlink
    ePageCompleted = subdoc.root.add_element "ePageCompleted"
    ePageCompleted.text = checkPageCompleted
    
    eLaunch.elements.add(subdoc.root)

    File.open(launchLogXml,"w") do |data|
      data<<doc
    end
 
    ruta = folderlaunch + indexCaptura
    begin
      old_umask = File.umask
      File.umask 0
      Dir::mkdir(ruta, 0777)
    ensure
      File.umask old_umask
    end

    ruta <<  "/captura.xml"
    File.open(ruta, "w") do |f|
      f.puts '<Captura/>'; $stdout.flush
    end

    return indexCaptura
  end

  def storePage con, idTarget, idConexion, idLaunch, idCaptura, page
    t = Time.now  
    strDT = t.strftime("%y%m%d_%H%M%S_%9N")

    updateDate = Time.now.strftime("%Y-%m-%d %H:%M:%S")  #vigilar que no haya que meterlo en utc Time.now.utc.to_s(:db)
    con.query("UPDATE `Navigator`.`tblConexiones` SET `UltimaConexion` = '#{updateDate}' WHERE `idConexion`=#{idConexion};")

    con.query("INSERT INTO `Navigator`.`tblInserts` (idConexion, idTarget, idLaunch, idCaptura, Pagina, FechaHora, Estado)"\
              " VALUES ('#{idConexion}', '#{idTarget}', '#{idLaunch}', '#{idCaptura}', '#{page}', '#{strDT}', 99);")
    int_idInsert = con.query("select last_insert_id()").fetch_row.first.to_i
    idInsert = "%08d" % int_idInsert

    storePagePng strDT
    storePageHtml idLaunch, idCaptura, strDT

    updateDate = Time.now.strftime("%Y-%m-%d %H:%M:%S")  #vigilar que no haya que meterlo en utc Time.now.utc.to_s(:db)
    con.query("UPDATE `Navigator`.`tblConexiones` SET `UltimaConexion` = '#{updateDate}' WHERE `idConexion`=#{idConexion};")
    con.query("UPDATE `Navigator`.`tblInserts` SET `Estado` = 1 WHERE `idInsert`=#{idInsert};")

  end
  
  def storePagePng strDT
    folderpng = "/volArchivoPNG/20" + strDT[0,2] + "/" + strDT[2,2] + "/" + strDT.gsub("_","")[0..8] + "X"
    begin
      old_umask = File.umask
      File.umask 0
      Dir::mkdir(folderpng, 0777) if not File.directory?(folderpng)
    ensure
      File.umask old_umask
    end
    screenshot = "/tmp/" + strDT + ".png"
    
    reintentos = 5
    begin
      reintentos += -1
      @browser.driver.save_screenshot(screenshot)
    rescue Exception => e
      puts 'screenshot fallido: ' + e.message    ; $stdout.flush
      if reintentos>0
        retry
      end
    end
  
    embed screenshot, 'image/png'
    FileUtils.cp screenshot, folderpng + "/"
    FileUtils.rm screenshot
  end
  
  def storePageHtml idLaunch, idCaptura, strDT
    
    folderCaptura = "/volHTML/" + idLaunch + "/" + idCaptura + "/" 
# INI actualizar xml##############################################################

    subdoc = Document.new("<Pagina />")
    subdoc.root.attributes["id"] = @numPag
    eFechaHora = subdoc.root.add_element "FechaHora"
    eFechaHora.text = strDT
    eURL = subdoc.root.add_element "URL"
    eURL.text = @browser.url
    
    capturaXml = folderCaptura + "captura.xml"
    file = File.new(capturaXml)
    doc = Document.new(file)
    doc.root.elements.add(subdoc.root)
    
    File.open(capturaXml,"w") do |data|
      data<<doc
    end

# FIN actualizar xml################################################################

    htmFile = folderCaptura + strDT + ".htm"
    
    aFile = File.new(htmFile, "w")
    aFile.write(@browser.html)
    aFile.close

  end
  
  def initialize browser, page_metrics, visit = false
    @browser = browser
    goto if visit
    
    expected_element if respond_to? :expected_element
    has_expected_title? if respond_to? :has_expected_title?
 
    # @browser.with_performance{|performance| page_metrics.add_page self.class, performance} unless visit
  end
  
  def method_missing sym, *args, &block
    @browser.send sym, *args, &block
  end







  def launchTAReviews idLaunch, descripcion, url
      nextlink = '//div[@class="pgLinks"]/a[contains(@class,"sprite-pageNext")]'
      checkPageCompleted = '//*[@id="FOOT"]'
      checkPageLoading = ''
      
      reintentos = 3
      begin
        reintentos += -1
        puts '@browser.goto.Retries:' + reintentos.to_s ; $stdout.flush
        @browser.goto url 
      rescue
        if reintentos>0
          retry
        end
      end
      
      @browser.element(:xpath,checkPageCompleted).wait_until_present
      if @browser.element(:xpath,'//*[@id="selFilterAll"]').exists?
        @browser.element(:xpath,'//*[@id="selFilterAll"]').click
      end

    
    idCaptura = prepararCaptura idLaunch, descripcion, url, nextlink, checkPageCompleted #cambiar el anterior por otro proceso que verifique el ultimo indice utilizado registrado en un xml

    @numPag = 0
    loop do
      @numPag += 1
      break if @numPag>5 #SOLO PARA TESTS, COMPROBANDO QUE NO EMPIEZA A PAGINAR HASTA EL INFINITO
      
      sleep 2
      @browser.element(:xpath,checkPageCompleted).wait_until_present
      if @browser.element(:xpath,'//span[@class="partnerRvw"]/span[contains(@class,"moreLink")]').exists?
        @browser.element(:xpath,'//span[@class="partnerRvw"]/span[contains(@class,"moreLink")]').click
        @browser.element(:xpath,'//div[starts-with(@class,"review dyn_full_review")]').wait_until_present
      end
  
      storePage idLaunch, idCaptura
      
      puts url; $stdout.flush
      puts checkPageCompleted; $stdout.flush
      ttt = @browser.element(:xpath,checkPageCompleted).text
      puts ttt; $stdout.flush
      
      reintentos = 5
      begin
        reintentos += -1
        puts descripcion + '.chkNEXT.Pag:' + @numPag.to_s + '.Retries:' + reintentos.to_s ;$stdout.flush
      rescue
        break if reintentos<=0
        retry
      end
      break if nextlink==''
      break if !@browser.element(:xpath,nextlink).exists?
      
      reintentos = 3
      begin
        reintentos += -1
        puts '@browser.element(:xpath,nextlink).click.Retries:' + reintentos.to_s ; $stdout.flush
        @browser.element(:xpath,nextlink).click
      rescue
        if reintentos>0
          retry
        end
      end
    end 
    #para empaquetar previo ftp, usar este comando en consola
    # zip -r 00001.zip 00001/
    #
    #para empaquetar todos los xml de captura:
    #zip FullCapt.zip -r */captura.xml
    #
    #para empaquetar varias carpetas de html:
    #zip FullHTML.zip -r 00000009/ 00000010/(ETC.ETC.ETC.ETC.ETC.ETC.ETC.)
    
    #para sincronizar carpeta trabajo y carpeta de publicacion 
    # sudo rsync -a /var/lib/jenkins/BotStoring/png /vol/BotStoring/
  end
  

end
