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

      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

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
    
      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.timeout = 180
    profile = Selenium::WebDriver::Firefox::Profile.new
    if system("netstat -anltp|grep :9050")
      profile['network.proxy.socks'] = 'localhost'
      profile['network.proxy.socks_port'] = 9050
      profile['network.proxy.type'] = 1
    end
    if descripcion.include?('TAListMobile_') || descripcion.include?('DespegarMobile_') || descripcion.include?('TAFichaMobile_') || descripcion.include?('TRIPADVISOR_MobileMap') 
      #profile['general.useragent.override']='Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_2_1 like Mac OS X; da-dk) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8C148 Safari/6533.18.5'
      profile['general.useragent.override']='Mozilla/5.0 (iPhone; CPU iPhone OS 5_1_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9B206 Safari/7534.48.3'
    elsif descripcion.include?('GPlus_About.')
      profile['general.useragent.override']='Mozilla/5.0 (Linux; U; Android 3.0.1; en-us; GT-P7100 Build/HRI83) AppleWebkit/534.13 (KHTML, like Gecko) Version/4.0 Safari/534.13'
    elsif descripcion.include?('GMapsPlaceReviews.')
      profile['general.useragent.override']='Mozilla/5.0 (Linux; U; Android 1.6; es-es; SonyEricssonX10i Build/R1FA016) AppleWebKit/528.5 (KHTML, like Gecko) Version/3.1.2 Mobile Safari/525.20.1'      
    elsif descripcion.include?('GMapsPlaceFull.')
      profile['general.useragent.override']='Mozilla/5.0 (compatible; Googlebot/2.1; http://www.google.com/bot.html)'      
    elsif descripcion.include?('InstagramTest')
      profile['general.useragent.override']='Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36'      
    elsif descripcion.include?('S8Browser')
      profile['general.useragent.override']='Mozilla/5.0 (Linux; Android 8.0.0; SAMSUNG SM-G950F Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/7.2 Chrome/59.0.3071.125 Mobile Safari/537.36'
    elsif descripcion.include?('OperaMiniBrowser')
      profile['general.useragent.override']='Opera/9.80 (Android; Opera Mini/7.5.33361/34.818; U; en) Presto/2.8.119 Version/11.1010'
    elsif descripcion.include?('TestUABrowser')
      profile['general.useragent.override']='Mozilla/5.0 (Linux; U; Android 2.2; en-ca; GT-P1000M Build/FROYO) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1'
    end
    @browser = Watir::Browser.new DRIVER, :profile => profile, :http_client => client
    #@browser.window.resize_to(1024, 768)
    if descripcion.include?('TAListMobile_') || descripcion.include?('DespegarMobile_') || descripcion.include?('TAFichaMobile_')
      @browser.window.resize_to(640, 1136)
    else
      @browser.window.resize_to(1280, 1024)
    end
    #@browser.driver.manage.timeouts.implicit_wait = 2

      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      reintentos = 3
      begin
        reintentos += -1
        puts '@browser.goto.Retries:' + reintentos.to_s ; $stdout.flush
        puts 'URL Original: ' + url
        if descripcion.include? 'BOOKING_HotelFicha.'
          @browser.goto "https://www.booking.com/"
          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          @browser.element(:xpath,"//*[@id='booking-footer']").wait_until_present
          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          bksesion = @browser.element(:xpath,"//link[@rel='help']").attribute_value('href')
          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          bksesion = "?" + bksesion.scan(/\?(.*)$/).first.first
          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          if url.include? "#"
            bksesion = bksesion + '#'
            url = url.gsub! '#', bksesion 
          else
            url = url + bksesion            
          end
          puts 'URL Original2: ' + url
          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        end
        @browser.goto url
        #@browser.goto 'https://www.google.es/maps/@42.4589632,-2.4481047,21z' 
        sleep 3
        puts 'URL Final: ' + @browser.url

      puts "Buscando ventana principal..."
      titulo = @browser.title
      puts(titulo)


        ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
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

  
      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

  
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

#      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
#
#      if url.include?('ShowUserReviews-') && not(descripcion.include?('.IDRev')) && not(descripcion.include?('.S8Browser.'))
#        puts 'en showusersreviews'; $stdout.flush
#          while @browser.element(:xpath,'//*[@id="REVIEWS"]//div[@class="pageNumbers"]/a[@data-page-number="1"]').exists?
#            puts 'go click page 1'; $stdout.flush
#            @browser.element(:xpath,'//*[@id="REVIEWS"]//div[@class="pageNumbers"]/a[@data-page-number="1"]').click
#            puts 'clicked'; $stdout.flush
#            
#            closeModal = '//*[@class="ui_close_x" and not(ancestor-or-self::*[contains(@class,"hidden")])]'
#            if @browser.element(:xpath,closeModal).exists?
#              if @browser.element(:xpath,closeModal).visible?
#               puts 'ventana modal'; $stdout.flush
#               @browser.element(:xpath,closeModal).click
#               puts 'click modal'; $stdout.flush
#              end
#            end
#            
#            sleep 3
#            puts 'waited 3'; $stdout.flush
#          end    
#          puts 'end page1'; $stdout.flush
#
#      end

      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

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

      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush


      if descripcion.include? 'EuroRelais_ReviewList.'
        begin
          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
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

      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

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

      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      if descripcion.include? 'BOOKING_HotelFicha.'
        begin
          @browser.element(:xpath,"//*[@class='language_filter_checkbox']").wait_until_present
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
        rescue
          #fallo
        end

      

      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

        if @browser.element(:xpath,'//*[@id="review_sort"]').exists?
          if @browser.element(:xpath,'//*[@id="review_sort"]').visible?
            @browser.select_list(:id => 'review_sort').select_value('f_recent_desc')
            sleep 3
          end
        end
          
#        rescue
#          #fallo
#        end

      end

      if descripcion.include? 'ElTenedor_RestFicha.'
        begin
          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          
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
    
      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      reintentos = 0
      if url.include?('tripadvisor')
        reintentos = 5
      end
      begin
        reintentos += -1
        @browser.element(:xpath,checkPageCompleted).wait_until_present
      rescue
        #archivandoTraza; 
        puts "FALLO #{reintentos}"
        if @browser.element(:xpath,checkPageCompleted).exists?
          puts "Existe"
        else
          puts "No existe"
        end
        if @browser.element(:xpath,checkPageCompleted).present?
          puts "Presente"
        else
          puts "No presente"
        end
        
        puts "offsetHeight: "
        puts "#{@browser.element(:xpath,checkPageCompleted).offsetHeight}"

        ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        raise 'FALLO checkPageCompleted' if reintentos<=0
        retry
      end

      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

    if (descripcion.include? '.GoToFirstReview.') && !($keep_on_paging_in_progress)
      firstreviewlink = "(//*[@id='REVIEWS']//div[starts-with(@id,'review_')]/div[not(@style='display: none;')]//div[starts-with(@class,'quote')]/a)[1]"
      if @browser.element(:xpath,firstreviewlink).exists?
        @browser.element(:xpath,firstreviewlink).click
        sleep 3
        maxPage = maxPage * 2 
        @browser.element(:xpath,checkPageCompleted).wait_until_present        
      end
    end

       ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

     #Agregado para reorganizar opiniones de TA a más recientes primero sin preferencia de idioma
      if @browser.element(:xpath,'//option[@id="selFilterAll"]').exists?
      	if @browser.element(:xpath,'//option[@id="selFilterAll"]').visible?
          @browser.element(:xpath,'//option[@id="selFilterAll"]').click
        end
      end
      

      #sleep 1
      #puts "Organizando ventanas..."
      #puts(@browser.title )
      #if @browser.title != titulo
      #  @browser.window(:title, titulo).use
      #end
      
      
      allLangRadioButton = '(//*[contains(@name,"filterLang") and @value="ALL"])[1]/following::label[1]'
      if @browser.element(:xpath,allLangRadioButton).exists?
        if @browser.element(:xpath,allLangRadioButton).visible?
          @browser.element(:xpath,allLangRadioButton).click
          sleep 2
        end

        if descripcion.include? '.KeepOnPaging.'
          @browser.goto url
        end

      end

      #sleep 1
      #puts "Organizando ventanas..."
      #puts(@browser.title )
      #if @browser.title != titulo
      #  @browser.window(:title, titulo).use
      #end

       ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
     
    if descripcion.include? '.KeepOnPaging.'
      if @browser.element(:xpath,"//form[contains(@action,'SetReviewFilter')]/button[@class='clear']").exists?
        raise 'FALLO EN PAGINADO'
      end
    end

      
      
       #Desactivando filtro activo si lo si hay
       ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
       if @browser.element(:xpath,'//button[@class="clear"]').exists?
        if @browser.element(:xpath,'//button[@class="clear"]').visible?
           ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
           @browser.element(:xpath,'//button[@class="clear"]').click
          
           begin
            ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
            Timeout.timeout(60) do
              ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
              while (@browser.element(:xpath,"//button[@class='clear']").exists? ||
                     @browser.element(:xpath,".//*[@class='loadingBox' and not(ancestor-or-self::*[contains(translate(@style,' ',''),'display:none')])]").exists?)
                 sleep 1
              end
              ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
            end
           rescue Timeout::Error
            puts 'timeout para quitar filtro'
           end
        end
      end
      
      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      if descripcion.include? '.TAFilterSegment' 
       ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
       
      puts("Ventanas: #{@browser.windows.count}")
      puts("Titulo:   #{@browser.title}")
       begin
        @browser.element(:xpath,"(//*[@id='filterControls']/form/div[contains(@class,'segment')] | //*[@data-param='filterSegment'])[1]").wait_until_present
       rescue 
        puts 'timeout esperando filtro'
       end

#archivandoTraza

      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
       if @browser.element(:xpath,"(//*[@id='filterControls']/form/div[contains(@class,'segment')] | //*[@data-param='filterSegment'])[1]").exists?
        filternumber = descripcion[/.*\.TAFilterSegment_(.*)\./,1]
        filterpath = "(//*[@name='filterSegment' and @value='#{filternumber}']/.. | //*[@data-param='filterSegment']/div[@data-value='#{filternumber}'])[1]"
        puts filterpath
      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        
        begin
          #archivandoTraza; 
          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          puts("Ventanas: #{@browser.windows.count}")
          puts("Titulo:   #{@browser.title}")
      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          
          # wrrev = @browser.element(:xpath,"//a[contains(@class,'write_review')]")
          fe = @browser.element(:xpath,filterpath)
          @browser.execute_script('arguments[0].scrollIntoView();', fe)
       ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
         
          fe.send_keys :arrow_up
          fe.send_keys :arrow_up

          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          if @browser.element(:xpath,"(#{filterpath}/label)[1]").present?
            @browser.element(:xpath,"(#{filterpath}/label)[1]").click
          else
            @browser.element(:xpath,"(#{filterpath}/input)[1]").click
          end
          reintentos = 5
          begin
            reintentos += -1

            #archivandoTraza; 
          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
            @browser.wait 5
            chkdfilterpath = "//*[@class='loadingBox' and not(ancestor-or-self::*[contains(@class,'hidden')])]"
            @browser.element(:xpath,chkdfilterpath).wait_while_present
            raise "fallo" if @browser.element(:xpath,"#{filterpath}/input").attribute_value('checked').nil?
          rescue
            puts "FALLO #{reintentos}"
            puts("Ventanas: #{@browser.windows.count}")
            puts("Titulo:   #{@browser.title}")
            ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
            raise 'FALLO Filter Checked' if reintentos<=0
            retry
          end


          #archivandoTraza; 
          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          

          
        rescue => error
          puts("ERROR:")
          puts("Error.class: #{error.class}")
          puts("Error.msg: #{error.message}")
          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        
#          aFile = File.new("/volHTML/debug/" + Time.now.strftime("%y%m%d_%H%M%S_%9N") + ".htm", "w")
#          htmlPage=@browser.html
#          aFile.write(htmlPage)
#          aFile.close
        
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

     ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush


    if descripcion.include? '.GotoTAPag'
      newurl = @browser.url
      newurl = newurl.gsub('-Reviews-','-Reviews-or' + descripcion.scan(/\.GotoTAPag(.*)\./)[0][0] + '-')
      @browser.goto newurl
      sleep 1
      @browser.element(:xpath,checkPageCompleted).wait_until_present
    end

     ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

    if (descripcion.include? '.GotoTAFirstPage.') && !($keep_on_paging_in_progress)
      sleep 1
      enlacePrimeraPagina = "//*[@id='REVIEWS']//div[contains(@class,'pageNumbers')]/a[@data-page-number='1']"
      if @browser.element(:xpath,enlacePrimeraPagina).exists?
        @browser.element(:xpath,enlacePrimeraPagina).click
        sleep 1
      end
    end

     ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

    if descripcion.include? '.GotoTALastVisitPage.'
      raise "No hay pagina configurada para 'GotoTALastVisitPage'" if con.query("select count(*) from tblLastPage").fetch_row.first.to_i == 0
      lastpage = con.query("select lastpage from tblLastPage").fetch_row.first
      newurl = @browser.url
      newurl = newurl.gsub('-Reviews-','-Reviews-or' + lastpage + '0-')
      @browser.goto newurl
      sleep 1
      @browser.element(:xpath,checkPageCompleted).wait_until_present
    end

     ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

    if descripcion.include? 'Facebook_Ficha.'
      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      #codigoestrella = @browser.element(:xpath,".//h1/../../../..//div[@class='clearfix']").outer_html
      #puts codigoestrella
      #sleep 10
      #ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      if @browser.element(:xpath,"//div[starts-with(@class,'lfloat')]//*[@tabindex]/span").exists?
        @browser.element(:xpath,"//div[starts-with(@class,'lfloat')]//*[@tabindex]/span").click
        sleep 3
      end
    end

     ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    
    if descripcion.include? 'GMapsLoc.ID'
      if(@browser.url.split(//).last(3).join==',4z')
        raise 'FALLO DE CARGA URL GMAPS'
      end
      sleep 5
      @browser.screenshot.save '/tmp/preclick.png'
      elemento = @browser.driver.find_element(:xpath, '//body')
      @browser.driver.action.move_to(elemento, 640, 476).perform
      @browser.driver.action.click.perform
      sleep 5
      @browser.screenshot.save '/tmp/postclick.png'
    end
    
    if descripcion.include? 'GMapsPlaceFull.ID' 
      puts "In GMapsPlace"
      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      div_scrollable_y = @browser.element(:xpath,"//*[contains(@class,'scrollable-y') or ./div/@id='ml-panes-entity']")
      scroll_top_script = 'arguments[0].scrollTop = arguments[0].scrollHeight'
      #div_scrollable_y.browser.execute_script(scroll_top_script, div_scrollable_y)
       
      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      enlaceReviews = "(//*[@jsaction='pane.rating.moreReviews' or ((contains(@jsaction,'pane.reviewChart.moreReviews') or contains(@jsaction,'entity.mobile.seeMoreReviews')) and not(ancestor::*[contains(@class,'write-review')]))])[1]"
      
      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

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

      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      
      boton = @browser.element(:xpath,enlaceReviews)
      # @browser.execute_script('arguments[0].scrollIntoView();', boton)
      # boton.wd.location_once_scrolled_into_view
      # @browser.send_keys :page_up
       
      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      puts "go clicking enlaceReviews"    ; $stdout.flush
      if @browser.element(:xpath,enlaceReviews).visible?
        clickboton = 5
        while clickboton > 0
          begin
            puts "clicking enlaceReviews"    ; $stdout.flush
            @browser.element(:xpath,enlaceReviews).click
            sleep 5
            puts "waiting reviews"
            ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
            @browser.element(:xpath,"//*[text()='Sort by:']").wait_until_present
            clickboton = 0
          rescue Exception => e
            puts "fallo enlaceReviews"    ; $stdout.flush
            puts e.message    ; $stdout.flush
            clickboton += -1
          end
        end
   
        ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        sleep 3
        div_with_scroll = @browser.element(:xpath,"//*[contains(@class,'section-scrollbox')]")
        ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        scroll_top_script = 'arguments[0].scrollTop = arguments[0].scrollTop + 25'
        repeatscroll = 0
        ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        oldscrollheight = @browser.execute_script('return arguments[0].scrollHeight', div_with_scroll) 
        ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        begin
        while @browser.element(:xpath,"//*[contains(@class,'section-loading') and not(ancestor-or-self::*[contains(translate(@style,' ',''),'display:none')])]").exists?
          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          puts "scrolling down"
#          puts("Repeat scroll: #{repeatscroll}")
#          puts("Scroll Top: #{@browser.execute_script('return arguments[0].scrollTop', div_with_scroll)}")
#          puts("Scroll Height: #{@browser.execute_script('return arguments[0].scrollHeight', div_with_scroll)}")
#          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
#          div_with_scroll.browser.execute_script(scroll_top_script, div_with_scroll)
#          sleep 1
#          if oldscrollheight == @browser.execute_script('return arguments[0].scrollHeight', div_with_scroll)
#            repeatscroll += 1
#            if repeatscroll > 300
#              stDT = Time.now.strftime("%y%m%d_%H%M%S_%9N") 
#              aFile = File.new("/volHTML/debug/" + stDT + ".htm", "w")
#              htmlPage=@browser.html
#              aFile.write(htmlPage)
#              aFile.close
#              storePagePng stDT
#              raise "SCROLL FALLIDO"
#             end
#           else
#             repeatscroll = 0
#             oldscrollheight = @browser.execute_script('return arguments[0].scrollHeight', div_with_scroll)
#           end

          puts("Scroll Top: #{@browser.execute_script('return arguments[0].scrollTop', div_with_scroll)}")
          puts("Scroll Height: #{@browser.execute_script('return arguments[0].scrollHeight', div_with_scroll)}")
          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          oldscrollheight = @browser.execute_script('return arguments[0].scrollHeight', div_with_scroll) 

          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

          div_with_scroll.send_keys [:control, :end]
          repeatscroll = 0
          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          while oldscrollheight == @browser.execute_script('return arguments[0].scrollHeight', div_with_scroll)
            ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
            repeatscroll += 1
            sleep 5
            if repeatscroll > 20
              ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
              raise "SCROLL FALLIDO"
            end
          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          end
          
          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        end
        rescue Exception => e
          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          puts e.message    ; $stdout.flush
          if (defined?(@scrollfailscount)).nil? 
            @scrollfailscount = 1
          else
            @scrollfailscount += 1
          end
          puts("SCROLLFAILCOUNT: #{@scrollfailscount}")   ; $stdout.flush
          if @scrollfailscount > 5
            ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
            raise "SCROLL FALLIDO"
          end
        end
          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      end
          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    end

          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

    repeatPageCountDownMax = 30
    repeatPageCountDown = repeatPageCountDownMax
    
    @numPag = 0
    loop do
      @numPag += 1
      
      #archivandoTraza; 
          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      if descripcion.include? '.ManualPaging.' 
        @browser.goto "#{url}#{@numPag}"
      end
      
      #archivandoTraza; 
          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      if descripcion.include? 'GMapsPlaceReviews.ID' 
        ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        sleep 60
        puts "In GMapsPlaceReviews"
        
        retries = 10
        while retries > 0
          retries += -1
          
          todoOk = true
          begin
            @browser.element(:xpath,"//*[@class='_n0j']").wait_until_present
            @browser.element(:xpath,"(//*[@class='gws-plugins-local-reviews-client-basic-reviews_leaf_page__dialog-list']//g-review-stars)[1]").wait_until_present
            if @browser.element(:xpath,"//*[text()='Next >']").exists?
              @browser.element(:xpath,"(//*[@class='gws-plugins-local-reviews-client-basic-reviews_leaf_page__dialog-list']//g-review-stars)[10]").wait_until_present
            end
          rescue
            todoOk = false
            puts("Faltan elementos por cargar. Refresh!")
            ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
            @browser.refresh
            @browser.wait 60
          end
          if todoOk
            @browser.element(:xpath,nextlink).wd.location_once_scrolled_into_view
            retries = 0
          end
        end
      end
    
      recargar = false
      sigueprobando=true
      reintentos = 5
      begin
        while sigueprobando
          reintentos += -1
        ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        puts descripcion + '.chkLOAD.Pag:' + @numPag.to_s + '.Retries:' + reintentos.to_s ; $stdout.flush
          
          if recargar
            @browser.refresh
            @browser.wait 60
          end
          recargar = false
          
       ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

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

      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

          closeModal = '//*[@class="ui_close_x" and not(ancestor-or-self::*[contains(@class,"hidden")])]'
          if @browser.element(:xpath,closeModal).exists?
            if @browser.element(:xpath,closeModal).visible?
              @browser.element(:xpath,closeModal).click
            end
          end
          

      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          
         @browser.element(:xpath,checkPageCompleted).wait_until_present
          
      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

          break if checkPageLoading==''
          
      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

          if descripcion.include? 'Airbnb_PlaceList.'
             sleep 10
          end
          sleep 5
          if !@browser.element(:xpath,checkPageLoading).exists?
            break
          end

      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

          if reintentos<=0  
            sigueprobando = false
          end
        end
      rescue Exception => e
        ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
		    strDT = Time.now.strftime("%y%m%d_%H%M%S_%9N")
        puts strDT + ": " + e.message; $stdout.flush

        #storePageDebugHtml stDT 

#        aFile = File.new("/volHTML/debug/" + strDT + ".htm", "w")
#        htmlPage=@browser.html
#        aFile.write(htmlPage)
#        aFile.close
        
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
      
      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
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

      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
     puts 'Ejecutando htmlPage = @browser.html'; $stdout.flush
  
     sigueprobando=true
     reintentos = 5
     while sigueprobando
       begin 
          puts 'Intento #' + reintentos.to_s; $stdout.flush
          reintentos += -1
      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          htmlPage = @browser.html
      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
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

      
      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      
      sleep 2
      @browser.element(:xpath,checkPageCompleted).wait_until_present
      
      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      #archivandoTraza; 
          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      closeModal = '//*[@class="ui_close_x" and not(ancestor-or-self::*[contains(@class,"hidden")])]'
      if @browser.element(:xpath,closeModal).exists?
        if @browser.element(:xpath,closeModal).visible?
          @browser.element(:xpath,closeModal).click
        end
      end

      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      
      buttonNoTranslation = '//*[@id="REVIEWS"]/div[starts-with(@id,"review_")]/div[not(@style="display: none;")]//form[@class="translationOptionForm"]/label/input[@value="false" and not(@checked)]'
      reintentos = 10
      while @browser.element(:xpath,buttonNoTranslation).exists?
        reintentos += -1
        break if reintentos<0
        @browser.element(:xpath,buttonNoTranslation).click
        sleep 2

        ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
  
        closeModal = '//*[@class="ui_close_x" and not(ancestor-or-self::*[contains(@class,"hidden")])]'
        if @browser.element(:xpath,closeModal).exists?
          if @browser.element(:xpath,closeModal).visible?
            @browser.element(:xpath,closeModal).click
          end
        end

        ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      end

      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      
      begin
        
        buttonNoTranslation = '//*[@id="REVIEWS"]//form[@class=\'translationOptionForm\']//*[@id=\'radioNo\' and not(@checked)]'
        reintentos = 10
        while @browser.element(:xpath,buttonNoTranslation).exists?
          reintentos += -1
          break if reintentos<0
          @browser.element(:xpath,buttonNoTranslation).fire_event('onclick')
          sleep 1
          @browser.element(:xpath,checkPageCompleted).wait_until_present
          sleep 1
   
          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    
          closeModal = '//*[@class="ui_close_x" and not(ancestor-or-self::*[contains(@class,"hidden")])]'
          if @browser.element(:xpath,closeModal).exists?
            if @browser.element(:xpath,closeModal).visible?
              @browser.element(:xpath,closeModal).click
            end
          end
  
          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        end
      rescue Exception => e
        puts("ERROR:")
        puts("Error.class: #{e.class}")
        puts("Error.msg: #{e.message}")
        ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      end

      #archivandoTraza; 
          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      if @browser.element(:xpath,'//div[@class="xCloseGreen"]').exists?
        sleep 30
        ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        @browser.element(:xpath,'//body').click
        #@browser.iframe(:id,"overlayRegFrame").element(:xpath,".//div[starts-with(@class,'submitBtn')]").wait_until_present
        #@browser.iframe(:id,"overlayRegFrame").text_field(:id,"email").set SecureRandom.hex[0..(8+rand(3))] + "@gmail.com"
        #@browser.iframe(:id,"overlayRegFrame").element(:xpath,".//div[starts-with(@class,'submitBtn')]").click
        sleep 2
      end

      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      linkMore = '//*[@id="REVIEWS"]//div[starts-with(@id,"review_")]//span[contains(@class,"taLnk") and contains(text(),"More") and not(ancestor-or-self::*[contains(translate(@style," ",""),"display:none")])]'
      if descripcion.include?('.TAFilterSegment') || descripcion.include?('.TANoMore.')
        linkMore = '/nada'
      end
      reintentos = 50
      while @browser.element(:xpath,linkMore).exists?
        ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        if (reintentos<25 and linkMore.split(//).last(3).join=='[1]') 
          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          puts 'linkMore BEFORE:' + linkMore
          linkMore = linkMore[0..(linkMore.length-4)] + '[last()]'
          puts 'linkMore AFTER:' + linkMore
        end
        ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        reintentos += -1
        if reintentos<0
#          stDT = Time.now.strftime("%y%m%d_%H%M%S_%9N") 
#          aFile = File.new("/volHTML/debug/" + stDT + ".htm", "w")
#          htmlPage=@browser.html
#          aFile.write(htmlPage)
#          aFile.close
#          storePagePng stDT
 
          break
        end
        @browser.element(:xpath,linkMore).wd.location_once_scrolled_into_view
        @browser.send_keys :page_up
        @browser.element(:xpath,linkMore).click
        sleep 2
        if @browser.element(:xpath,'//div[@class="xCloseGreen"]').exists?
          sleep 30
          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          @browser.iframe(:id,"overlayRegFrame").element(:xpath,".//*[@id='regSignIn']").wait_until_present
          @browser.element(:xpath,'//body').click
          #@browser.iframe(:id,"overlayRegFrame").element(:xpath,".//div[starts-with(@class,'submitBtn')]").wait_until_present
          #@browser.iframe(:id,"overlayRegFrame").text_field(:id,"email").set SecureRandom.hex[0..(8+rand(3))] + "@gmail.com"
          #@browser.iframe(:id,"overlayRegFrame").element(:xpath,".//div[starts-with(@class,'submitBtn')]").click
          sleep 2
        end
        ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        closeModal = '//*[@class="ui_close_x" and not(ancestor-or-self::*[contains(@class,"hidden")])]'
        if @browser.element(:xpath,closeModal).exists?
          if @browser.element(:xpath,closeModal).visible?
            sleep 5
            ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
            @browser.element(:xpath,closeModal).click
          end
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

      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      if @browser.element(:xpath,'//div[@class="xCloseGreen"]').exists?
        sleep 30
        @browser.iframe(:id,"overlayRegFrame").element(:xpath,".//div[starts-with(@class,'submitBtn')]").wait_until_present
        @browser.iframe(:id,"overlayRegFrame").text_field(:id,"email").set SecureRandom.hex[0..(8+rand(3))] + "@gmail.com"
        @browser.iframe(:id,"overlayRegFrame").element(:xpath,".//div[starts-with(@class,'submitBtn')]").click
        sleep 2
      end

      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

## se anula esta parte del código pensada en la versión antigua de reviews de Booking, donde se veia la página completa y había que desplegar las respuestas
#      linkMore = './/*[@class="review_item_response_more"]'
#      reintentos = 10
#      while @browser.element(:xpath,linkMore).exists?
#        reintentos += -1
#        break if reintentos<0
#        @browser.element(:xpath,linkMore).wd.location_once_scrolled_into_view
#        @browser.send_keys :page_up
#        @browser.element(:xpath,linkMore).click
#        sleep 2
#      end

      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

     if @browser.element(:xpath,'//div[@class="wrap more"]/a[contains(@class,"set_reviewExpand")]').exists?
        @browser.element(:xpath,'//div[@class="wrap more"]/a[contains(@class,"set_reviewExpand")]').click
        begin
          @browser.element(:xpath,'//div[@class="note"]').wait_until_present
        rescue
          #fallo
        end
      end

      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

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

      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
		
		if estoprural
			@browser.goto @browser.url.gsub('#page','?page=')
		    sleep 1
		    @browser.element(:xpath,checkPageCompleted).wait_until_present
		end

      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

		begin
		  while @browser.element(:xpath,'//*[@id="moreExperiencesContainer" and not(@style="display: none;")]').exists?
			@browser.element(:xpath,'//*[@id="moreExperiencesContainer" and not(@style="display: none;")]').click
			sleep 2
		  end
		rescue
		  #fallo
		end

      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      begin
        while @browser.element(:xpath,'//*[@id="edsModal"]//*[@id="modalCloseButton"]').exists?
          @browser.element(:xpath,'//*[@id="edsModal"]//*[@id="modalCloseButton"]').click
          sleep 2
        end
      rescue
        #fallo
      end

      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

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

      if descripcion.include?('.KeepOnPaging.')
        currentpage = 0
        lastsavedpage = 1
        begin
          lastsavedpage = con.query("SELECT page FROM tblKeepOnPaging WHERE idTarget = #{idTarget};").fetch_row.first.to_i
          puts("lastsavedpage: #{lastsavedpage}")
          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

          xpathcurrentpage = "//*[@id='REVIEWS']//*[@class='pageNumbers']/*[contains(@class,'current')]"
          currentpage = @browser.element(:xpath,xpathcurrentpage).text.strip.to_i
          puts("currentpage: #{currentpage}")
          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        rescue Exception => e
          puts("ERROR:")
          puts("Error.class: #{e.class}")
          puts("Error.msg: #{e.message}")
          
#          archivandoTraza
        end
             
          
        ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

        raise "RETROCESO EN PAGINADO!" if currentpage<lastsavedpage
        
      end

      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      
#begin
      if descripcion.include? '.TAIdsOnDB.'
        placeName = ""
        reviewTotalCount = ""
        currentPage = ""
        langSelected = ""
        segmSelected = ""
        filterSegment = ""
        filterCount = ""
        langFromRadioButtons = ""
        sorting = ""
        travellerTypeSel = ""
        pagDetails = ""
        valPeine5 = "null"
        valPeine4 = "null"
        valPeine3 = "null"
        valPeine2 = "null"
        valPeine1 = "null"
        ignore_exception { placeName = @browser.element(:xpath,"//*[@id='HEADING']").text }
        placeName = placeName.gsub! '\'', '\\\''
        ignore_exception { reviewTotalCount = @browser.element(:xpath,"//*[@property='count' or @class='reviewCount']").text }
        ignore_exception { currentPage = @browser.element(:xpath,"//*[@class='pageNumbers']/*[contains(@class,'current')]").text }
        ignore_exception { langSelected = @browser.element(:xpath,"//*[@id='filterControls']//*[contains(@class,'language')]/ul/li[./span/input/@checked]/label").text }
        ignore_exception { segmSelected = @browser.element(:xpath,"(//*[@id='filterControls']//*[contains(@class,'segment')]/ul/li[./span/input/@checked] | //*[@data-param='filterSegment']/div[input/@checked])[1]/label").text }
        ignore_exception { filterSegment = @browser.element(:xpath,"//span[@class='filter']/text()").text }
        ignore_exception { filterCount = @browser.element(:xpath,"//span[@class='filter']/preceding-sibling::b[1]").text }
        ignore_exception { langFromRadioButtons = @browser.element(:xpath,"//*[contains(@class,'language')]//*[./input/@checked]/label").text }
        ignore_exception { sorting = @browser.element(:xpath,"//fieldset/span[contains(@class,'selected')]").text }
        ignore_exception { travellerTypeSel = @browser.element(:xpath,"//li[./span/input/@name='filterSegment' and ./span/input/@checked]/label").text }
        ignore_exception { pagDetails = @browser.element(:xpath,"//*[@class='pagination-details']").text }
        ignore_exception { valPeine5 = @browser.element(:xpath,"(//*[@id='ratingFilter']/ul/li/label/span[2] | (//*[@data-name='ta_rating'])[1]/div/span[2])[1]").text }
        ignore_exception { valPeine4 = @browser.element(:xpath,"(//*[@id='ratingFilter']/ul/li/label/span[2] | (//*[@data-name='ta_rating'])[1]/div/span[2])[2]").text }
        ignore_exception { valPeine3 = @browser.element(:xpath,"(//*[@id='ratingFilter']/ul/li/label/span[2] | (//*[@data-name='ta_rating'])[1]/div/span[2])[3]").text }
        ignore_exception { valPeine2 = @browser.element(:xpath,"(//*[@id='ratingFilter']/ul/li/label/span[2] | (//*[@data-name='ta_rating'])[1]/div/span[2])[4]").text }
        ignore_exception { valPeine1 = @browser.element(:xpath,"(//*[@id='ratingFilter']/ul/li/label/span[2] | (//*[@data-name='ta_rating'])[1]/div/span[2])[5]").text }
#         con.query("INSERT tblLastPage (lastpage) VALUES ('#{@browser.element(:xpath,"//*[@id='REVIEWS']//*[contains(@class,'pageNum current')]").text.strip}');")
        sqlInsert = "INSERT INTO `Navigator`.`tblTASegmentFicha` (idTarget, Description, URL, MaxPages, NumPag, PlaceName, reviewTotalCount2, CurrentPage, " +
                                                                 "LangSelected, SegmSelected, FilterSegment, FilterCount, LangFromRadioButtons, " +
                                                                 "Sorting, TravellerTypeSel, PagDetails, valPeine5, valPeine4, valPeine3, valPeine2, valPeine1) " +
                    "VALUES (#{idTarget}, '#{descripcion}', '#{url}', '#{maxPage}', '#{@numPag}', '#{placeName}', '#{reviewTotalCount}', '#{currentPage}', " +
                            "'#{langSelected}', '#{segmSelected}', '#{filterSegment}', '#{filterCount}', '#{langFromRadioButtons}', " +
                            "'#{sorting}', '#{travellerTypeSel}', '#{pagDetails}', #{valPeine5}, #{valPeine4}, #{valPeine3}, #{valPeine2}, #{valPeine1})"
        puts(sqlInsert)
        ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

        con.query(sqlInsert)
        
        int_id = con.query("select last_insert_id()").fetch_row.first.to_i
        idTASegmentFicha = "%08d" % int_id
        
        ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        posNode = 0
        nodes = @browser.divs(:xpath, "//*[@id='REVIEWS']//div[starts-with(@id,'review_')]")
        
        puts("Node count: #{nodes.size}")
        ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        nodes.each do |node|
          posNode += 1
          puts("posNode: #{posNode}")
          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          idTAReview = node.attribute_value('id')
          sqlInsert = "INSERT INTO `Navigator`.`tblTASegmentIndiv` (IdTASegmentFicha, Posicion, ReviewWebId) " +
                      "VALUES (#{idTASegmentFicha}, #{posNode}, '#{idTAReview}')"
          con.query(sqlInsert)
        end
      elsif descripcion.include? '.BKDimIndivsOnDB.'
        placeName = ""
        reviewTotalCount = ""
        currentPage = ""
        langSelected = ""
        ignore_exception { placeName = @browser.element(:xpath,"//h1/a").text }
        placeName = placeName.gsub! '\'', '\\\''
        ignore_exception { reviewTotalCount = @browser.element(:xpath,"//*[@id='review_list_score']/p").text }
        ignore_exception { currentPage = @browser.element(:xpath,"(//*[@id='review_list_page_container']//p[contains(@class,'page_showing')])[1]").text }
        ignore_exception { langSelected = @browser.element(:xpath,"//*[@id='language']/option[@selected]").text }

        sqlInsert = "INSERT INTO `Navigator`.`tblBKReviewsFicha` (idTarget, Description, URL, MaxPages, NumPag, PlaceName, reviewTotalCount2, CurrentPage, LangSelected)"  +
                    "VALUES (#{idTarget}, '#{descripcion}', '#{url}', '#{maxPage}', '#{@numPag}', '#{placeName}', '#{reviewTotalCount}', '#{currentPage}', '#{langSelected}')"
        puts(sqlInsert)
        ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

        con.query(sqlInsert)
        
        int_id = con.query("select last_insert_id()").fetch_row.first.to_i
        idBKReviewsFicha = "%08d" % int_id
        
        ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        posNode = 0
        nodes = @browser.lis(:xpath, "//ul[@class='review_list']/li[starts-with(@class,'review_')]")
        
        puts("Node count: #{nodes.size}")
        ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        nodes.each do |node|
          posNode += 1
          puts("posNode: #{posNode}")
          ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

          reviewerName = ""
          nacionality = ""
          reviewDate = ""
          score = ""
          quote = ""
          reviewInfoTag01 = ""
          reviewInfoTag02 = ""
          reviewInfoTag03 = ""
          reviewInfoTag04 = ""
          reviewInfoTag05 = ""
          reviewInfoTag06 = ""
          reviewInfoTag07 = ""
          reviewInfoTag08 = ""
          
          ignore_exception { reviewerName = con.quote(node.element(:xpath,".//*[@class='reviewer_name']/span").text) }
          ignore_exception { nacionality = con.quote(node.element(:xpath,".//span[@itemprop='nationality']/span").text) }
          ignore_exception { reviewDate = con.quote(node.element(:xpath,"./p[@class='review_item_date']").text) }
          ignore_exception { score = con.quote(node.element(:xpath,".//*[@class='review-score-badge']").text) }
          ignore_exception { quote = con.quote(node.element(:xpath,".//*[contains(@class,'review_item_header')]//*[@itemprop='name']").text) }
          ignore_exception { reviewInfoTag01 = con.quote(node.element(:xpath,".//ul[@class='review_item_info_tags']/li[1]").text) }
          ignore_exception { reviewInfoTag02 = con.quote(node.element(:xpath,".//ul[@class='review_item_info_tags']/li[2]").text) }
          ignore_exception { reviewInfoTag03 = con.quote(node.element(:xpath,".//ul[@class='review_item_info_tags']/li[3]").text) }
          ignore_exception { reviewInfoTag04 = con.quote(node.element(:xpath,".//ul[@class='review_item_info_tags']/li[4]").text) }
          ignore_exception { reviewInfoTag05 = con.quote(node.element(:xpath,".//ul[@class='review_item_info_tags']/li[5]").text) }
          ignore_exception { reviewInfoTag06 = con.quote(node.element(:xpath,".//ul[@class='review_item_info_tags']/li[6]").text) }
          ignore_exception { reviewInfoTag07 = con.quote(node.element(:xpath,".//ul[@class='review_item_info_tags']/li[7]").text) }
          ignore_exception { reviewInfoTag08 = con.quote(node.element(:xpath,".//ul[@class='review_item_info_tags']/li[8]").text) }
          sqlInsert = "INSERT INTO `Navigator`.`tblBKReviewsIndiv` (IdBKReviewsFicha, Posicion, reviewerName, nacionality, score, quote, " +
                                                                   "reviewInfoTag01, reviewInfoTag02, reviewInfoTag03, reviewInfoTag04," +
                                                                   "reviewInfoTag05, reviewInfoTag06, reviewInfoTag07, reviewInfoTag08) " +
                                                          "VALUES (#{idBKReviewsFicha}, #{posNode}, '#{reviewerName}', " +
                                                                 "'#{nacionality}', '#{score}', '#{quote}', " +
                                                                 "'#{reviewInfoTag01}', '#{reviewInfoTag02}', '#{reviewInfoTag03}', '#{reviewInfoTag04}'," +
                                                                 "'#{reviewInfoTag05}', '#{reviewInfoTag06}', '#{reviewInfoTag07}', '#{reviewInfoTag08}')"
          con.query(sqlInsert)
        end
      else

        storePage con, idTarget, idConexion, idLaunch, idCaptura, @numPag
      end
      
      #abort("Aborting to check fail")
#rescue => e
#  puts e.inspect
#  puts e.backtrace
#end 

      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      if descripcion.include? '.SurfTALangs'
        puts "SurfTALangs!!!!"; $stdout.flush

      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

        langList = descripcion.scan(/\.SurfTALangs-(.*)\./)[0][0]
        langs = langList.split('-')
        langs.each do |lang|
          begin
            @browser.goto url
            @browser.element(:xpath,checkPageCompleted).wait_until_present


            puts "  Surfing Lang #{lang}"; $stdout.flush
            langSuccess = 0
            langpath = "//*[@id='REVIEWS']/div[contains(@id,'filter')]//input[not(ancestor::*[contains(@class,'hidden')])]/.[contains(@name,'filterLang') and @value='#{lang}']"
            if @browser.element(:xpath,langpath).exists?
              puts "  Click Level 1 Lang #{lang}"; $stdout.flush
             langpathnotchecked = "//*[@id='REVIEWS']/div[contains(@id,'filter')]//input[not(ancestor::*[contains(@class,'hidden')])]/.[contains(@name,'filterLang') and not(@checked) and @value='#{lang}']"
             if @browser.element(:xpath,langpathnotchecked).exists?
               @browser.element(:xpath,langpathnotchecked).click
               sleep 3
             end
              
              langchkdpath = "//*[@id='REVIEWS']/div[contains(@id,'filter')]//input[not(ancestor::*[contains(@class,'hidden')])]/.[contains(@name,'filterLang') and @checked and @value='#{lang}']"
              reintentos = 20
              until @browser.element(:xpath,langchkdpath).exists? && !@browser.element(:xpath,"//*[@class='loadingBox']").visible?
                reintentos += -1
                break if reintentos<0
                sleep 3
              end
              
              langSuccess = 1
            else
              langpath = "//*[@id='REVIEWS']/div[contains(@id,'filter')]//*[contains(text(),'More languages')]"
              if @browser.element(:xpath,langpath).exists?
                puts "  Click Access Level 2 Lang #{lang}"; $stdout.flush
                @browser.element(:xpath,langpath).click
                sleep 2
                langpath = "//*[contains(@class,'modal')]//input[contains(@name,'filterLang') and @value='#{lang}']"
                if @browser.element(:xpath,langpath).exists?
                  puts "  Click Level 2 Lang #{lang}"; $stdout.flush
                  @browser.element(:xpath,langpath).click
                  sleep 3

                  langchkdpath = "//*[@id='REVIEWS']/div[contains(@id,'filter')]//input[not(ancestor::*[contains(@class,'hidden')])]/.[contains(@name,'filterLang') and @checked and @value='#{lang}']"
                   reintentos = 20
                  until @browser.element(:xpath,langchkdpath).exists? && !@browser.element(:xpath,"//*[@class='loadingBox']").visible?
                    reintentos += -1
                    break if reintentos<0
                    sleep 3
                  end

                  langSuccess = 1
                end
              end            
            end
          rescue
            puts "FALLO LANG"
            ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
            #fallo
          end
          if langSuccess == 1
            storePage con, idTarget, idConexion, idLaunch, idCaptura, @numPag
            ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          end
        end
      end

      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      if descripcion.include? '.SurfPeineNotas'
        puts "SurfPeineNotas!!!!"; $stdout.flush
        
        titlepath = "//*[contains(text(),'ler rating')]"
        if @browser.element(:xpath,titlepath).exists?
          @browser.element(:xpath,titlepath).wd.location_once_scrolled_into_view
          (1..5).each do |ipeine|
            puts "  Peine. Paso #{ipeine}"; $stdout.flush
            peineactivo = "(//*[contains(text(),'ler rating')]/..//input[not(ancestor-or-self::*[@class='hidden' or @type='hidden']) and @checked])[1]"
            while @browser.element(:xpath,peineactivo).exists?
              puts "  Desactivando peine activo"; $stdout.flush
              @browser.element(:xpath,"#{peineactivo}/following::label[1]").click
                sleep 1
     
                reintentos = 20
                while @browser.element(:xpath,"//*[@class='loadingBox']").visible?
                reintentos += -1
                break if reintentos<0
                sleep 3
              end
              raise 'FALLO loadingBox' if reintentos<=0
            end
    
            puts "  Activando peine"; $stdout.flush
    #            pathactivarpeine = "(//*[contains(text(),'ler rating')]/..//input[not(ancestor-or-self::*[@class='hidden' or @type='hidden'])])[#{ipeine}]"
            pathactivarpeine = "(//*[contains(text(),'ler rating')]/..//input/following::label[1])[#{ipeine}]"
            puts "  pathactivarpeine = #{pathactivarpeine}"; $stdout.flush
            @browser.element(:xpath,pathactivarpeine).click
            sleep 1
            
    #            peinechkdpath = "(//*[contains(text(),'ler rating')]/..//input[not(ancestor-or-self::*[@class='hidden' or @type='hidden'])])[#{ipeine}][@checked]"
            peinechkdpath = "(//*[contains(text(),'ler rating')]/..//input)[#{ipeine}][@checked]"
            reintentos = 20
            until @browser.element(:xpath,peinechkdpath).exists? && !@browser.element(:xpath,"//*[@class='loadingBox']").visible?
              reintentos += -1
              break if reintentos<0
              sleep 3
            end
            storePage con, idTarget, idConexion, idLaunch, idCaptura, @numPag
            
          end
        end
      end
      
      puts url; $stdout.flush
      #puts checkPageCompleted
      #ttt = @browser.element(:xpath,checkPageCompleted).text
      #puts ttt
      
      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      if descripcion.include? '.GotoTALastVisitPage.'
        con.query("DELETE FROM tblLastPage;")
      end
      break if @numPag>=maxPage

	  if descripcion.include? 'Hotels_Ficha.'
		xpage = '//div[1]/div/ul/li/em'
		break if !@browser.element(:xpath,xpage).exists?
		indicepagina = @browser.element(:xpath,xpage).text
		postotal = 4 + (indicepagina.index ' de ')
		ptotal = indicepagina[postotal..-1].to_i
		break if @numPag >= ptotal
	  end	  

      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      reintentos = 5
      begin
        reintentos += -1
        puts descripcion + '.chkNEXT.Pag:' + @numPag.to_s + '.Retries:' + reintentos.to_s ; $stdout.flush
      rescue
        break if reintentos<=0
        retry
      end

        ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      
      #Tratamiento KeepOnPaging especial para capturas de fichas con muchas paginas que suelen caer en mitad de proceso.
      if descripcion.include?('.KeepOnPaging.')
        ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        if @browser.element(:xpath,nextlink).exists?
        ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          urlNextLink = @browser.element(:xpath,nextlink).attribute_value('href')
        ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          unless urlNextLink.include? 'www.tripadvisor.' 
        ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
            urlNextLink = 'https://www.tripadvisor.es#{urlNextLink}'
          end
        ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          updateDate = Time.now.strftime("%Y-%m-%d %H:%M:%S")  #vigilar que no haya que meterlo en utc Time.now.utc.to_s(:db)
        ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          con.query("UPDATE tblKeepOnPaging SET nextLink = '#{urlNextLink}', updatetime = '#{updateDate}', page = #{@browser.element(:xpath,"//*[@id='REVIEWS']//*[@class='pageNumbers']/*[contains(@class,'current')]").text.strip} WHERE idTarget = #{idTarget};")
          $keep_on_paging_in_progress = true
        ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        else
        ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          con.query("DELETE FROM tblKeepOnPaging WHERE idTarget = #{idTarget};")
        end
      end

      unless descripcion.include? '.ManualPaging.' 
        break if nextlink==''
        break if !@browser.element(:xpath,nextlink).exists?
        
        if descripcion.include? '.GotoTALastVisitPage.'
          con.query("INSERT tblLastPage (lastpage) VALUES ('#{@browser.element(:xpath,"//*[@id='REVIEWS']//*[contains(@class,'pageNum current')]").text.strip}');")
        end

        ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
  
        reintentos = 3
        begin
          reintentos += -1
          puts '@browser.element(:xpath,nextlink).click.Retries:' + reintentos.to_s ; $stdout.flush
          @browser.element(:xpath,nextlink).wd.location_once_scrolled_into_view
          begin
            @browser.send_keys :page_up
          rescue
            puts("NoPageUP")
          end
          
      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

#          if descripcion.include? 'GMapsPlaceSearchLocalReviews.'
#            nextpageurl = @browser.element(:xpath,nextlink).attribute_value('href')
#            @browser.goto nextpageurl
#            @browser.element(:xpath,checkPageCompleted).wait_until_present
#          else
            @browser.element(:xpath,nextlink).click
#          end
          sleep 2
        rescue Exception
          puts $!, $@
          if reintentos>0
            retry
          end
        end
      end

      ahora = Time.now;  tiempopasado = ahora.to_f - lasttime; lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

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
  
  def archivandoTraza
    begin
      stDT = Time.now.strftime("%y%m%d_%H%M%S_%9N") 
      storePageDebugHtml stDT
      storePagePng stDT
      puts("Archivando Traza (#{stDT})")
    rescue
      puts("Fallo ArchivandoTraza")
    end
  end
  
  def storePageDebugHtml strDT

    htmFile = "/volHTML/debug/" + strDT + ".htm"
    aFile = File.new(htmFile, "w")
    aFile.write(@browser.html)
    aFile.close

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
    
    $htmlStoreCountDown += -1

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




  def ignore_exception
     begin
       yield  
     rescue Exception
     end
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

