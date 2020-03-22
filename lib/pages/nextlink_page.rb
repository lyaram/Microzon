class NextLinkPage

  #include WatirPageHelper
 
  #si al final hay que instalar gem, considerar Hpricot
  require 'rexml/document'
  include REXML 

require 'net/http'
require 'net/https'
require 'open-uri'
require 'json'

    
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

 def launchDataTA con, idTarget, idConexion, idLaunch, descripcion, url, nextlink, checkPageCompleted, checkPageLoading, maxPage
   
    @lasttime = Time.now.to_f
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    idCaptura = prepararCaptura idLaunch, descripcion, url, nextlink, checkPageCompleted

    url = url.gsub('.com/','.com.sg/')
    url = url.gsub('.es/','.com.sg/')
    url = url.gsub('.co.uk/','.com.sg/')

#    uri = URI.parse(url)
#    http = Net::HTTP.new(uri.host, uri.port)
#    http.use_ssl = true
    html = open(url).read

#      File.open("/volHTML/debug/httppage.htm", 'w') { |file| file.write(html) }

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    uid = html.scan(/"uid":"(.[^"]*)"/i).first.first
    rid = html.scan(/data-reviewid="(.[^"]*)"/i).first.first
    puts "uid #{uid}"
    puts "rid #{rid}"
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    url = url.gsub("-Reviews-", "-r#{rid}-")
    url = url.gsub("/Hotel_Review-", "/ShowUserReviews-")
    url = url.gsub("/Attraction_Review-", "/ShowUserReviews-")
    url = url.gsub("/Restaurant_Review-", "/ShowUserReviews-")
    puts "new url #{url}"
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    filtro = ""
    if descripcion.include?('.RE.')
      filtro = "filterRating"
    else
      filtro = "trating"
    end
    (0..5).each do |ipeine|
      puts "  Peine. Paso #{ipeine}"; $stdout.flush
      uri = URI.parse(url)
      puts "uri.host   #{uri.host}"
      puts "uri.port   #{uri.port}"
      puts "uri.path   #{uri.path}"
      puts "uri.request_uri   #{uri.request_uri}"
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.read_timeout = 15
      
      request = Net::HTTP::Post.new(uri.request_uri)
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      if ipeine==0
        form_data = URI.encode_www_form({ :filterLang => 'all', :isLastPoll => 'false', :reqNum => '1', :changeSet => 'REVIEW_LIST',
          :paramSeqId => '3', :waitTime => '11', :puid => "#{uid}"})
      else
        if filtro=="trating"
          form_data = URI.encode_www_form({ :filterLang => 'all', :isLastPoll => 'false', :reqNum => '1', :changeSet => 'REVIEW_LIST',
            :paramSeqId => '3', :waitTime => '11', :puid => "#{uid}", :trating => "#{ipeine}"})
        else
          form_data = URI.encode_www_form({ :filterLang => 'all', :isLastPoll => 'false', :reqNum => '1', :changeSet => 'REVIEW_LIST',
            :paramSeqId => '3', :waitTime => '11', :puid => "#{uid}", :filterRating => "#{ipeine}"})
        end
      end
      request.body = form_data
      request.add_field('Accept' , 'text/html, */*')
      request.add_field('Accept-Language' , 'es-ES,es;q=0.8,en-US;q=0.5,en;q=0.3')
      request.add_field('Content-Type' , 'application/x-www-form-urlencoded; charset=utf-8' )
      request.add_field('X-Requested-With' , 'XMLHttpRequest' )
      request.add_field('X-Puid' , "#{uid}")
      request.add_field('DNT' , '1')
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      response = http.request(request)
      sleep 1
      retHttp = "<html><head></head><body>" + response.body + "</body></html>"
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      File.open("/tmp/httppage.htm", 'w') { |file| file.write(retHttp) }
      @browser.goto 'file:///tmp/httppage.htm'
      storePage       con, idTarget, idConexion, idLaunch, idCaptura, ipeine, descripcion, url
#      storeDirectPage con, idTarget, idConexion, idLaunch, idCaptura, ipeine, retHttp

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    end
  end








  def launch con, idTarget, idConexion, idLaunch, descripcion, url, nextlink, checkPageCompleted, checkPageLoading, maxPage
    @lasttime = Time.now.to_f

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

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
    
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.timeout = 180
    profile = Selenium::WebDriver::Firefox::Profile.new
    if system("netstat -anltp|grep :9050")
      profile['network.proxy.socks'] = 'localhost'
      profile['network.proxy.socks_port'] = 9050
      profile['network.proxy.type'] = 1
    else
      ipwebproxy = ""
      begin
        
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

        ipwebproxy = con.query("select IPWebProxy from tblConfig").fetch_row.first

        puts "Probando con webproxy: #{ipwebproxy}"
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

        if ipwebproxy != ""
          profile['intl.accept_languages'] = "es-es, es"

          profile['network.proxy.share_proxy_settings'] = true
          profile['network.proxy.http'] = ipwebproxy
          profile['network.proxy.http_port'] = 3928
          profile['network.proxy.ssl'] = ipwebproxy
          profile['network.proxy.ssl_port'] = 3928
          profile['network.proxy.ftp'] = ipwebproxy
          profile['network.proxy.ftp_port'] = 3928
          profile['network.proxy.socks'] = ipwebproxy
          profile['network.proxy.socks_port'] = 3928
          profile['network.proxy.type'] = 1
        end
        
        puts "Profile WebProxy montado!"
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      rescue 
        puts "ERROR WEBPROXY!!!!!!!!"
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      end
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
    
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    
    if descripcion.include?('.NoImage.')  
      profile['permissions.default.image']=2
    end

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

    @browser = Watir::Browser.new DRIVER, :profile => profile, :http_client => client
    #@browser.window.resize_to(1024, 768)
    if descripcion.include?('TAListMobile_') || descripcion.include?('DespegarMobile_') || descripcion.include?('TAFichaMobile_')
      @browser.window.resize_to(640, 1136)
    else
      @browser.window.resize_to(1280, 1024)
    end
    #@browser.driver.manage.timeouts.implicit_wait = 2

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      reintentos = 3
      begin
        reintentos += -1
        puts '@browser.goto.Retries:' + reintentos.to_s ; $stdout.flush
        puts 'URL Original: ' + url
        if descripcion.include? 'BOOKING_HotelFicha.' and not(url.include? 'file:///')
          @browser.goto "https://www.booking.com/"
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          @browser.element(:xpath,"//*[@id='booking-footer']").wait_until_present
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          bksesion = @browser.element(:xpath,"//link[@rel='help']").attribute_value('href')
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          bksesion = "?" + bksesion.scan(/\?(.*)$/).first.first
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          if url.include? "#"
            bksesion = bksesion + '#'
            url = url.gsub! '#', bksesion 
          else
            url = url + bksesion            
          end
          puts 'URL Original2: ' + url
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        end
        @browser.goto url
        #@browser.goto 'https://www.google.es/maps/@42.4589632,-2.4481047,21z' 
        sleep 3
        puts 'URL Final: ' + @browser.url

      puts "Buscando ventana principal..."
      titulo = @browser.title
      puts(titulo)


ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
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

  
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

  
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

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      if (descripcion.include? 'TRIPADVISOR_UserReviews.') &&  !(url.include? 'file:///')
        begin
          clickMas = '//*[contains(text(),"Mostrar m")]'
          while @browser.element(:xpath,clickMas).exists?
            @browser.element(:xpath,clickMas).wd.location_once_scrolled_into_view
puts("Click more")
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
            @browser.element(:xpath,clickMas).click
            sleep 3
          end
        rescue
          #fallo
        end
        
        begin
          lastReview = '//*[contains(@class,"social-skeletons-FeedLoadingSkeleton__container")]'
          while @browser.element(:xpath,lastReview).exists?
            nReviews = @browser.elements(:xpath,'//div[@id="content"]/div/div').length
puts("ampliando reviews #{nReviews}")

##puts "HAY QUE BORRAR ESTO!!"
##archivandoTraza;
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

            @browser.element(:xpath,lastReview).wd.location_once_scrolled_into_view
            sleep 3
          end
        rescue
          #fallo
        end

      end

#ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
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

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

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

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush


      if descripcion.include? 'EuroRelais_ReviewList.'
        begin
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
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

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

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

      if descripcion.include? 'Airbnb_ExperienceList.'
        begin
          numItems = 0
          while @browser.elements(:xpath, "//*[@itemprop='itemListElement']").length > numItems
            numItems = @browser.elements(:xpath, "//*[@itemprop='itemListElement']").length
            puts "NUMITEMS: #{numItems}"
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
            
            @browser.send_keys [:control, :home]
            sleep 3
            @browser.send_keys [:control, :end]
            sleep 3
          end
        rescue
          #fallo
        end

      end


ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

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

      

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

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
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          
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
    
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      reintentos = 0
      if (descripcion.include? 'GMapsPlaceSearchLocalReviews.') && (url.include? '&start=')
        reintentos = 100
      end
      if url.include?('tripadvisor') || url.include?('getyourguide') || descripcion.include?('TRIPADVISOR_ShowUserReviews.')
        reintentos = 5
      end
      begin
        reintentos += -1
        @browser.element(:xpath,checkPageCompleted).wait_until_present
      rescue
        archivandoTraza;
           
        puts "FALLO #{reintentos}"
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        if @browser.element(:xpath,checkPageCompleted).exists?
          puts "Existe"
        else
          puts "No existe"
        end
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        if @browser.element(:xpath,checkPageCompleted).present?
          puts "Presente"
        else
          puts "No presente"
        end
        
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

        begin
          puts "offsetHeight: "
          puts "#{@browser.element(:xpath,checkPageCompleted).offsetHeight}"
        rescue
          puts "fallo offsetHeight"
        end
        
        
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        raise 'FALLO checkPageCompleted' if reintentos<=0

        if (descripcion.include? 'GMapsPlaceSearchLocalReviews.') && (url.include? '&start=')
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          paginaenlink = (url.match('&start=(.*)')[1]).to_i + 10

          raise 'MaxPage superado' if paginaenlink > (maxPage*10)
          
          puts("paginando google #{paginaenlink}")
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

          url = url.match('(.*)&start=')[1] + '&start=' + paginaenlink.to_s 
          @browser.goto url
          
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          
        end
        retry
      end

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

    if (descripcion.include? '.GoToFirstReview.') && !($keep_on_paging_in_progress)
      firstreviewlink = "(//*[@id='REVIEWS']//div[starts-with(@id,'review_')]/div[not(@style='display: none;')]//div[starts-with(@class,'quote')]/a)[1]"
      if @browser.element(:xpath,firstreviewlink).exists?
        @browser.element(:xpath,firstreviewlink).click
        sleep 3
        maxPage = maxPage * 2 
        @browser.element(:xpath,checkPageCompleted).wait_until_present        
      end
    end

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

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
      
      
      allLangRadioButton = '(//label[contains(@for,"filterLang_ALL")])[1] | //*[contains(@for,"LanguageFilter_0")] | //*[contains(@id,"LanguageFilter_0")]'
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

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
     
    if descripcion.include? '.KeepOnPaging.'
      if @browser.element(:xpath,"//form[contains(@action,'SetReviewFilter')]/button[@class='clear']").exists?
        raise 'FALLO EN PAGINADO'
      end
    end

      
      
       #Desactivando filtro activo si lo si hay
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
       if @browser.element(:xpath,'//button[@class="clear"]').exists?
        if @browser.element(:xpath,'//button[@class="clear"]').visible?
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
           @browser.element(:xpath,'//button[@class="clear"]').click
          
           begin
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
            Timeout.timeout(60) do
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
              while (@browser.element(:xpath,"//button[@class='clear']").exists? ||
                     @browser.element(:xpath,".//*[@class='loadingBox' and not(ancestor-or-self::*[contains(translate(@style,' ',''),'display:none')])]").exists?)
                 sleep 1
              end
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
            end
           rescue Timeout::Error
            puts 'timeout para quitar filtro'
           end
        end
      end
      
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      if descripcion.include? '.TAFilterSegment' 
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
       
      puts("Ventanas: #{@browser.windows.count}")
      puts("Titulo:   #{@browser.title}")
       begin
        @browser.element(:xpath,"(//*[@id='filterControls']/form/div[contains(@class,'segment')] | //*[@data-param='filterSegment'])[1]").wait_until_present
       rescue 
        puts 'timeout esperando filtro'
       end

#archivandoTraza

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
       if @browser.element(:xpath,"(//*[@id='filterControls']/form/div[contains(@class,'segment')] | //*[@data-param='filterSegment'])[1]").exists?
        filternumber = descripcion[/.*\.TAFilterSegment_(.*)\./,1]
        filterpath = "(//*[@name='filterSegment' and @value='#{filternumber}']/.. | //*[@data-param='filterSegment']/div[@data-value='#{filternumber}'])[1]"
        puts filterpath
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        
        begin
          #archivandoTraza; 
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          puts("Ventanas: #{@browser.windows.count}")
          puts("Titulo:   #{@browser.title}")
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          
          # wrrev = @browser.element(:xpath,"//a[contains(@class,'write_review')]")
          fe = @browser.element(:xpath,filterpath)
          @browser.execute_script('arguments[0].scrollIntoView();', fe)
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
         
          fe.send_keys :arrow_up
          fe.send_keys :arrow_up

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          if @browser.element(:xpath,"(#{filterpath}/label)[1]").present?
            @browser.element(:xpath,"(#{filterpath}/label)[1]").click
          else
            @browser.element(:xpath,"(#{filterpath}/input)[1]").click
          end
          reintentos = 5
          begin
            reintentos += -1

            #archivandoTraza; 
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
            @browser.wait 5
            chkdfilterpath = "//*[@class='loadingBox' and not(ancestor-or-self::*[contains(@class,'hidden')])]"
            @browser.element(:xpath,chkdfilterpath).wait_while_present
            raise "fallo" if @browser.element(:xpath,"#{filterpath}/input").attribute_value('checked').nil?
          rescue
            puts "FALLO #{reintentos}"
            puts("Ventanas: #{@browser.windows.count}")
            puts("Titulo:   #{@browser.title}")
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
            raise 'FALLO Filter Checked' if reintentos<=0
            retry
          end


          #archivandoTraza; 
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          

          
        rescue => error
          puts("ERROR:")
          puts("Error.class: #{error.class}")
          puts("Error.msg: #{error.message}")
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        
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

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush


    if descripcion.include? '.GotoTAPag'
      newurl = @browser.url
      newurl = newurl.gsub('-Reviews-','-Reviews-or' + descripcion.scan(/\.GotoTAPag(.*)\./)[0][0] + '-')
      @browser.goto newurl
      sleep 1
      @browser.element(:xpath,checkPageCompleted).wait_until_present
    end

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

    if (descripcion.include? '.GotoTAFirstPage.') && !($keep_on_paging_in_progress)
      sleep 1
      enlacePrimeraPagina = "//*[@id='REVIEWS']//div[contains(@class,'pageNumbers')]/a[@data-page-number='1']"
      if @browser.element(:xpath,enlacePrimeraPagina).exists?
        urlfirstpage = @browser.element(:xpath,enlacePrimeraPagina).attribute_value('href')
        puts "urlfirstpage: #{urlfirstpage}"

        urihtml = URI.parse(urlfirstpage)

        uri = URI.parse(url);
#        urlfirstpagefull = uri.scheme + '://' + uri.host + '/SetLangFilter?returnTo=' + urihtml.path.sub("/", "%2f") + '&filterLang=ALL'
        urlfirstpagefull = 'https://www.tripadvisor.com.sg/SetLangFilter?returnTo=' + urihtml.path.sub("/", "%2f") + '&filterLang=ALL'
        puts "urlfirstpagefull: #{urlfirstpagefull}"
       
        @browser.goto urlfirstpagefull
        sleep 3
        
        archivandoTraza; 

#        puts 'URL Final: ' + @browser.url
#
#       @browser.element(:xpath,enlacePrimeraPagina).click
#        sleep 1
#        checkLangALL = "//div[contains(@data-param,'filterLang')]/div[contains(@data-value,'ALL') and not(./label/input/@checked)]"
#        if @browser.element(:xpath,checkLangALL).exists?
#          sleep 3
#          @browser.element(:xpath,checkLangALL).click
#          sleep 3
#        end
      end
    end

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

    if descripcion.include? '.GotoTALastVisitPage.'
      raise "No hay pagina configurada para 'GotoTALastVisitPage'" if con.query("select count(*) from tblLastPage").fetch_row.first.to_i == 0
      lastpage = con.query("select lastpage from tblLastPage").fetch_row.first
      newurl = @browser.url
      newurl = newurl.gsub('-Reviews-','-Reviews-or' + lastpage + '0-')
      @browser.goto newurl
      sleep 1
      @browser.element(:xpath,checkPageCompleted).wait_until_present
    end

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

    if descripcion.include? 'Facebook_Ficha.'
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      #codigoestrella = @browser.element(:xpath,".//h1/../../../..//div[@class='clearfix']").outer_html
      #puts codigoestrella
      #sleep 10
      #ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      if @browser.element(:xpath,"//div[starts-with(@class,'lfloat')]//*[@tabindex]/span").exists?
        @browser.element(:xpath,"//div[starts-with(@class,'lfloat')]//*[@tabindex]/span").click
        sleep 3
      end
    end

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    
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

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

    if descripcion.include? 'GMapsReviewBox.'
      fid = descripcion.scan(/\.FID([^.]*)\./).first.first
      startpage = descripcion.scan(/\.PAG([^.]*)\./).first.first
      if startpage=='0'
        nextpagetoken=''
      else
        nextpagetoken=startpage
      end
      puts "fid: #{fid}"
      puts "startpage: #{startpage}"
      puts "nextpagetoken: #{nextpagetoken}"
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      urlgetreviews = "https://www.google.com/async/reviewSort?vet=12ahUKEwjYpczB2a7oAhXTYDUKHSsSBPoQxyx6BAgBEA8..i&ved=2ahUKEwjYpczB2a7oAhXTYDUKHSsSBPoQjit6BAgBECE&client=firefox-b-is-oem1&yv=3&async=feature_id:#{fid},review_source:All%20reviews,sort_by:newestFirst,start_index:"
      urlgetreviews = urlgetreviews + startpage + ",is_owner:false,filter_text:,associated_topic:,next_page_token:#{nextpagetoken},_pms:s,_fmt:pc"
      uri = URI.parse(urlgetreviews)
      puts "uri.request_uri   #{uri.request_uri}"
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.read_timeout = 15
      
      request = Net::HTTP::Get.new(uri.request_uri)
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
#      if ipeine==0
#        form_data = URI.encode_www_form({ :filterLang => 'all', :isLastPoll => 'false', :reqNum => '1', :changeSet => 'REVIEW_LIST',
#          :paramSeqId => '3', :waitTime => '11', :puid => "#{uid}"})
#      else
#        if filtro=="trating"
#          form_data = URI.encode_www_form({ :filterLang => 'all', :isLastPoll => 'false', :reqNum => '1', :changeSet => 'REVIEW_LIST',
#            :paramSeqId => '3', :waitTime => '11', :puid => "#{uid}", :trating => "#{ipeine}"})
#        else
#          form_data = URI.encode_www_form({ :filterLang => 'all', :isLastPoll => 'false', :reqNum => '1', :changeSet => 'REVIEW_LIST',
#            :paramSeqId => '3', :waitTime => '11', :puid => "#{uid}", :filterRating => "#{ipeine}"})
#        end
#      end
#      request.body = form_data
#      request.add_field('X-Requested-With' , 'XMLHttpRequest' )
#      request.add_field('DNT' , '1')
#      request.add_field('Accept-Language' , 'es-ES,es;q=0.8,en-US;q=0.5,en;q=0.3')
#      request.add_field('Accept' , 'text/html, */*')
#      request.add_field('Content-Type' , 'application/x-www-form-urlencoded; charset=utf-8' )
#      request.add_field('User-Agent', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko' )
#      request.add_field('DNT' , '1')

      request.add_field('Host' , 'www.google.com')
      request.add_field('User-Agent' , 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko')
      request.add_field('Accept' , 'text/html, */*')
      request.add_field('Accept-Language' , 'es-ES,es;q=0.8,en-US;q=0.5,en;q=0.3')
#      request.add_field('Accept-Encoding' , 'gzip, deflate, br')
      request.add_field('TE' , 'Trailers')


ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      response = http.request(request)
      sleep 1
      respuesta = response.body
      puts "respuesta:"
      puts(respuesta)
      htmlpage = "<style>" + respuesta.scan(/[^>];\<style\>(.*)\<\/div\>4;[^<]/).first.first + "</div>"
      puts "htmlpage:"
      puts(htmlpage)
      retHttp = "<!DOCTYPE html><html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/></head><body>" + htmlpage + "</body></html>"
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      file = File.new "/tmp/httppage.htm", 'wb+'
      file.write Base64.decode64( retHttp )

#      File.open("/tmp/httppage.htm", 'w:UTF-8') { |file| file.write(retHttp) }
      @browser.goto 'file:///tmp/httppage.htm'   
archivandoTraza;       
         
    end
    
    if descripcion.include? 'GMapsPlaceFull.' 
      puts "In GMapsPlace"
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      div_scrollable_y = @browser.element(:xpath,"//*[contains(@class,'scrollable-y') or ./div/@id='ml-panes-entity']")
      scroll_top_script = 'arguments[0].scrollTop = arguments[0].scrollHeight'
      #div_scrollable_y.browser.execute_script(scroll_top_script, div_scrollable_y)
       
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      enlaceReviews = "(//*[@jsaction='pane.rating.moreReviews' or ((contains(@jsaction,'pane.reviewChart.moreReviews') or contains(@jsaction,'entity.mobile.seeMoreReviews')) and not(ancestor::*[contains(@class,'write-review')]))])[1]"
      
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

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

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      
      boton = @browser.element(:xpath,enlaceReviews)
      # @browser.execute_script('arguments[0].scrollIntoView();', boton)
      # boton.wd.location_once_scrolled_into_view
      # @browser.send_keys :page_up
       
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      puts "go clicking enlaceReviews"    ; $stdout.flush
      if @browser.element(:xpath,enlaceReviews).visible?
        clickboton = 5
        while clickboton > 0
          begin
            puts "clicking enlaceReviews"    ; $stdout.flush
            @browser.element(:xpath,enlaceReviews).click
            sleep 5
            puts "waiting reviews"
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
            @browser.element(:xpath,"//*[text()='Sort by:']").wait_until_present
            clickboton = 0
          rescue Exception => e
            puts "fallo enlaceReviews"    ; $stdout.flush
            puts e.message    ; $stdout.flush
            clickboton += -1
          end
        end
   
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        sleep 3
        div_with_scroll = @browser.element(:xpath,"//*[contains(@class,'section-scrollbox')]")
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        scroll_top_script = 'arguments[0].scrollTop = arguments[0].scrollTop + 25'
        repeatscroll = 0
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        oldscrollheight = @browser.execute_script('return arguments[0].scrollHeight', div_with_scroll) 
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        begin
        while @browser.element(:xpath,"//*[contains(@class,'section-loading') and not(ancestor-or-self::*[contains(translate(@style,' ',''),'display:none')])]").exists?
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          puts "scrolling down"
#          puts("Repeat scroll: #{repeatscroll}")
#          puts("Scroll Top: #{@browser.execute_script('return arguments[0].scrollTop', div_with_scroll)}")
#          puts("Scroll Height: #{@browser.execute_script('return arguments[0].scrollHeight', div_with_scroll)}")
#ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
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
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          oldscrollheight = @browser.execute_script('return arguments[0].scrollHeight', div_with_scroll) 

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

          div_with_scroll.send_keys [:control, :end]
          repeatscroll = 0
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          while oldscrollheight == @browser.execute_script('return arguments[0].scrollHeight', div_with_scroll)
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
            repeatscroll += 1
            sleep 5
            if repeatscroll > 20
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
              raise "SCROLL FALLIDO"
            end
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          end
          
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        end
        rescue Exception => e
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          puts e.message    ; $stdout.flush
          if (defined?(@scrollfailscount)).nil? 
            @scrollfailscount = 1
          else
            @scrollfailscount += 1
          end
          puts("SCROLLFAILCOUNT: #{@scrollfailscount}")   ; $stdout.flush
          if @scrollfailscount > 5
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
            raise "SCROLL FALLIDO"
          end
        end
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      end
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    end

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

    repeatPageCountDownMax = 30
    repeatPageCountDown = repeatPageCountDownMax
    
    @numPag = 0
    loop do
      @numPag += 1

      puts("BROWSER URL: #{@browser.url}")
            
      #archivandoTraza; 
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      if descripcion.include? '.ManualPaging.' 
        @browser.goto "#{url}#{@numPag}"
      end
      
      #archivandoTraza; 
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      if descripcion.include? 'GMapsPlaceReviews.ID' 
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
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
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
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
      if (descripcion.include? 'GMapsPlaceSearchLocalReviews.') && (url.include? '&start=')
        reintentos = 100
      end
      begin
        while sigueprobando
          reintentos += -1
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          puts descripcion + '.chkLOAD.Pag:' + @numPag.to_s + '.Retries:' + reintentos.to_s ; $stdout.flush

          if recargar
          @browser.refresh
          @browser.wait 60
          end
          recargar = false

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

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

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

          closeModal = '//*[@class="ui_close_x" and not(ancestor-or-self::*[contains(@class,"hidden")])]'
          if @browser.element(:xpath,closeModal).exists?
            if @browser.element(:xpath,closeModal).visible?
              @browser.element(:xpath,closeModal).click
            end
          end

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

          @browser.element(:xpath,checkPageCompleted).wait_until_present

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

          break if checkPageLoading==''

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

          if descripcion.include? 'Airbnb_PlaceList.'
            sleep 10
          end
          sleep 5
          if !@browser.element(:xpath,checkPageLoading).exists?
          break
          end

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

          if reintentos<=0
          sigueprobando = false
          end
        end
      rescue Exception => e
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        strDT = Time.now.strftime("%y%m%d_%H%M%S_%9N")
        puts strDT + ": " + e.message; $stdout.flush

        if (descripcion.include? 'GMapsPlaceSearchLocalReviews.') && (url.include? '&start=')
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          
          currenturl = @browser.url
          puts(currenturl)
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

          paginaenlink = (currenturl.match('&start=(.*)')[1]).to_i + 10
          puts("paginando google #{paginaenlink}")
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

          currenturl = currenturl.match('(.*)&start=')[1] + '&start=' + paginaenlink.to_s 
          puts(currenturl)
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

          @browser.goto currenturl
          
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          
        end

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
      
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
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

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
     puts 'Ejecutando htmlPage = @browser.html'; $stdout.flush
  
     sigueprobando=true
     reintentos = 5
     while sigueprobando
       begin 
          puts 'Intento #' + reintentos.to_s; $stdout.flush
          reintentos += -1
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          htmlPage = @browser.html
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
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

      
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      
      sleep 2
      @browser.element(:xpath,checkPageCompleted).wait_until_present
      
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      #archivandoTraza; 
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      closeModal = '//*[@class="ui_close_x" and not(ancestor-or-self::*[contains(@class,"hidden")])]'
      if @browser.element(:xpath,closeModal).exists?
        if @browser.element(:xpath,closeModal).visible?
          @browser.element(:xpath,closeModal).click
        end
      end

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      
      buttonNoTranslation = '//*[@id="REVIEWS"]/div[starts-with(@id,"review_")]/div[not(@style="display: none;")]//form[@class="translationOptionForm"]/label/input[@value="false" and not(@checked)]'
      reintentos = 10
      while @browser.element(:xpath,buttonNoTranslation).exists?
        reintentos += -1
        break if reintentos<0
        @browser.element(:xpath,buttonNoTranslation).click
        sleep 2

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
  
        closeModal = '//*[@class="ui_close_x" and not(ancestor-or-self::*[contains(@class,"hidden")])]'
        if @browser.element(:xpath,closeModal).exists?
          if @browser.element(:xpath,closeModal).visible?
            @browser.element(:xpath,closeModal).click
          end
        end

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      end

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      
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
   
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    
          closeModal = '//*[@class="ui_close_x" and not(ancestor-or-self::*[contains(@class,"hidden")])]'
          if @browser.element(:xpath,closeModal).exists?
            if @browser.element(:xpath,closeModal).visible?
              @browser.element(:xpath,closeModal).click
            end
          end
  
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        end
      rescue Exception => e
        puts("ERROR:")
        puts("Error.class: #{e.class}")
        puts("Error.msg: #{e.message}")
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      end

      #archivandoTraza; 
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      if @browser.element(:xpath,'//div[@class="xCloseGreen"]').exists?
        sleep 30
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        @browser.element(:xpath,'//body').click
        #@browser.iframe(:id,"overlayRegFrame").element(:xpath,".//div[starts-with(@class,'submitBtn')]").wait_until_present
        #@browser.iframe(:id,"overlayRegFrame").text_field(:id,"email").set SecureRandom.hex[0..(8+rand(3))] + "@gmail.com"
        #@browser.iframe(:id,"overlayRegFrame").element(:xpath,".//div[starts-with(@class,'submitBtn')]").click
        sleep 2
      end

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      linkMore = '//*[@id="REVIEWS"]//div[starts-with(@id,"review_")]//span[contains(@class,"taLnk") and contains(text(),"More") and not(ancestor-or-self::*[contains(translate(@style," ",""),"display:none")])]'
      if descripcion.include?('.TAFilterSegment') || descripcion.include?('.TANoMore.')
        linkMore = '/nada'
      end
      reintentos = 50
      
      unless descripcion.include?('Repescando.')
        while @browser.element(:xpath,linkMore).exists?
  ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          if (reintentos<25 and linkMore.split(//).last(3).join=='[1]') 
  ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
            puts 'linkMore BEFORE:' + linkMore
            linkMore = linkMore[0..(linkMore.length-4)] + '[last()]'
            puts 'linkMore AFTER:' + linkMore
          end
  ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
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
  ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
            @browser.iframe(:id,"overlayRegFrame").element(:xpath,".//*[@id='regSignIn']").wait_until_present
            @browser.element(:xpath,'//body').click
            #@browser.iframe(:id,"overlayRegFrame").element(:xpath,".//div[starts-with(@class,'submitBtn')]").wait_until_present
            #@browser.iframe(:id,"overlayRegFrame").text_field(:id,"email").set SecureRandom.hex[0..(8+rand(3))] + "@gmail.com"
            #@browser.iframe(:id,"overlayRegFrame").element(:xpath,".//div[starts-with(@class,'submitBtn')]").click
            sleep 2
          end
  ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          closeModal = '//*[@class="ui_close_x" and not(ancestor-or-self::*[contains(@class,"hidden")])]'
          if @browser.element(:xpath,closeModal).exists?
            if @browser.element(:xpath,closeModal).visible?
              sleep 5
  ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
              @browser.element(:xpath,closeModal).click
            end
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

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      if @browser.element(:xpath,'//div[@class="xCloseGreen"]').exists?
        sleep 30
        @browser.iframe(:id,"overlayRegFrame").element(:xpath,".//div[starts-with(@class,'submitBtn')]").wait_until_present
        @browser.iframe(:id,"overlayRegFrame").text_field(:id,"email").set SecureRandom.hex[0..(8+rand(3))] + "@gmail.com"
        @browser.iframe(:id,"overlayRegFrame").element(:xpath,".//div[starts-with(@class,'submitBtn')]").click
        sleep 2
      end

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

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

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

     if @browser.element(:xpath,'//div[@class="wrap more"]/a[contains(@class,"set_reviewExpand")]').exists?
        @browser.element(:xpath,'//div[@class="wrap more"]/a[contains(@class,"set_reviewExpand")]').click
        begin
          @browser.element(:xpath,'//div[@class="note"]').wait_until_present
        rescue
          #fallo
        end
      end

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

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

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
		
		if estoprural
			@browser.goto @browser.url.gsub('#page','?page=')
		    sleep 1
		    @browser.element(:xpath,checkPageCompleted).wait_until_present
		end

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

		begin
		  while @browser.element(:xpath,'//*[@id="moreExperiencesContainer" and not(@style="display: none;")]').exists?
			@browser.element(:xpath,'//*[@id="moreExperiencesContainer" and not(@style="display: none;")]').click
			sleep 2
		  end
		rescue
		  #fallo
		end

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      begin
        while @browser.element(:xpath,'//*[@id="edsModal"]//*[@id="modalCloseButton"]').exists?
          @browser.element(:xpath,'//*[@id="edsModal"]//*[@id="modalCloseButton"]').click
          sleep 2
        end
      rescue
        #fallo
      end

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

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
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

          xpathcurrentpage = "//*[@id='REVIEWS']//*[@class='pageNumbers']/*[contains(@class,'current')]"
          currentpage = @browser.element(:xpath,xpathcurrentpage).text.strip.to_i
          puts("currentpage: #{currentpage}")
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        rescue Exception => e
          puts("ERROR:")
          puts("Error.class: #{e.class}")
          puts("Error.msg: #{e.message}")
          
#          archivandoTraza
        end
             
          
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

        raise "RETROCESO EN PAGINADO!" if currentpage<lastsavedpage
        
      end

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      
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

        valPeine5 = valPeine5.gsub(',', ''); valPeine5 = valPeine5.gsub('.', '') 
        valPeine4 = valPeine4.gsub(',', ''); valPeine4 = valPeine4.gsub('.', '') 
        valPeine3 = valPeine3.gsub(',', ''); valPeine3 = valPeine3.gsub('.', '') 
        valPeine2 = valPeine2.gsub(',', ''); valPeine2 = valPeine2.gsub('.', '') 
        valPeine1 = valPeine1.gsub(',', ''); valPeine1 = valPeine1.gsub('.', '') 
        
#         con.query("INSERT tblLastPage (lastpage) VALUES ('#{@browser.element(:xpath,"//*[@id='REVIEWS']//*[contains(@class,'pageNum current')]").text.strip}');")
        sqlInsert = "INSERT INTO `Navigator`.`tblTASegmentFicha` (idTarget, Description, URL, MaxPages, NumPag, PlaceName, reviewTotalCount2, CurrentPage, " +
                                                                 "LangSelected, SegmSelected, FilterSegment, FilterCount, LangFromRadioButtons, " +
                                                                 "Sorting, TravellerTypeSel, PagDetails, valPeine5, valPeine4, valPeine3, valPeine2, valPeine1) " +
                    "VALUES (#{idTarget}, '#{descripcion}', '#{url}', '#{maxPage}', '#{@numPag}', '#{placeName}', '#{reviewTotalCount}', '#{currentPage}', " +
                            "'#{langSelected}', '#{segmSelected}', '#{filterSegment}', '#{filterCount}', '#{langFromRadioButtons}', " +
                            "'#{sorting}', '#{travellerTypeSel}', '#{pagDetails}', '#{valPeine5}', '#{valPeine4}', '#{valPeine3}', '#{valPeine2}', '#{valPeine1}')"
        puts(sqlInsert)
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

        con.query(sqlInsert)
        
        int_id = con.query("select last_insert_id()").fetch_row.first.to_i
        idTASegmentFicha = "%08d" % int_id
        
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        posNode = 0
        nodes = @browser.divs(:xpath, "//*[@id='REVIEWS']//div[starts-with(@id,'review_')]")
        
        puts("Node count: #{nodes.size}")
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        nodes.each do |node|
          posNode += 1
          puts("posNode: #{posNode}")
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          idTAReview = node.attribute_value('id')
          sqlInsert = "INSERT INTO `Navigator`.`tblTASegmentIndiv` (IdTASegmentFicha, Posicion, ReviewWebId) " +
                      "VALUES (#{idTASegmentFicha}, #{posNode}, '#{idTAReview}')"
          con.query(sqlInsert)
        end






      elsif descripcion.include? '.TAIndivdsOnDB.'
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

        valPeine5 = valPeine5.gsub(',', ''); valPeine5 = valPeine5.gsub('.', '') 
        valPeine4 = valPeine4.gsub(',', ''); valPeine4 = valPeine4.gsub('.', '') 
        valPeine3 = valPeine3.gsub(',', ''); valPeine3 = valPeine3.gsub('.', '') 
        valPeine2 = valPeine2.gsub(',', ''); valPeine2 = valPeine2.gsub('.', '') 
        valPeine1 = valPeine1.gsub(',', ''); valPeine1 = valPeine1.gsub('.', '') 
        
#         con.query("INSERT tblLastPage (lastpage) VALUES ('#{@browser.element(:xpath,"//*[@id='REVIEWS']//*[contains(@class,'pageNum current')]").text.strip}');")
        sqlInsert = "INSERT INTO `Navigator`.`tblTASegmentFicha` (idTarget, Description, URL, MaxPages, NumPag, PlaceName, reviewTotalCount2, CurrentPage, " +
                                                                 "LangSelected, SegmSelected, FilterSegment, FilterCount, LangFromRadioButtons, " +
                                                                 "Sorting, TravellerTypeSel, PagDetails, valPeine5, valPeine4, valPeine3, valPeine2, valPeine1) " +
                    "VALUES (#{idTarget}, '#{descripcion}', '#{url}', '#{maxPage}', '#{@numPag}', '#{placeName}', '#{reviewTotalCount}', '#{currentPage}', " +
                            "'#{langSelected}', '#{segmSelected}', '#{filterSegment}', '#{filterCount}', '#{langFromRadioButtons}', " +
                            "'#{sorting}', '#{travellerTypeSel}', '#{pagDetails}', '#{valPeine5}', '#{valPeine4}', '#{valPeine3}', '#{valPeine2}', '#{valPeine1}')"
        puts(sqlInsert)
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

        con.query(sqlInsert)
        
        int_id = con.query("select last_insert_id()").fetch_row.first.to_i
        idTASegmentFicha = "%08d" % int_id
        
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        posNode = 0
        nodes = @browser.divs(:xpath, "//*[@id='REVIEWS']//div[starts-with(@id,'review_')]")
        
        puts("Node count: #{nodes.size}")
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        nodes.each do |node|
          posNode += 1
          puts("posNode: #{posNode}")
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          score = "null"
          userLoc = "null"
          visitDate = "null"
          userName = "null"
          responseDate = "null"
          responseText = "null"
          idTAReview = node.attribute_value('id')
          ignore_exception { score = node.element(:xpath,".//*[contains(@class,'ui_bubble_rating')]").attribute_value('class') }
          ignore_exception { userLoc = node.element(:xpath,".//*[starts-with(@class,'userLoc')]").text }
          ignore_exception { visitDate = node.element(:xpath,".//*[contains(@class,'reviews_stay_date')]").text }
          ignore_exception { userName = node.element(:xpath,".//div[contains(@class,'member_info')]//div[contains(@class,'info_text')]/div[1]").text }
          ignore_exception { responseDate = node.element(:xpath,".//*[contains(@class,'responseDate')]").text }
          ignore_exception { responseText = node.element(:xpath,".//*[contains(@class,'mgrRspnInline')]//div[contains(@class,'entry')]/p").text }
          sqlInsert = "INSERT INTO `Navigator`.`tblTASegmentIndiv` (IdTASegmentFicha, Posicion, ReviewWebId, Score, UserLoc, VisitDate, UserName, ResponseDate, ResponseText) " +
                      "VALUES (#{idTASegmentFicha}, #{posNode}, '#{idTAReview}', '#{score}', '#{userLoc}', '#{visitDate}', '#{userName}', '#{responseDate}', '#{responseText}')"
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
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

        con.query(sqlInsert)
        
        int_id = con.query("select last_insert_id()").fetch_row.first.to_i
        idBKReviewsFicha = "%08d" % int_id
        
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        posNode = 0
        nodes = @browser.lis(:xpath, "//ul[@class='review_list']/li[starts-with(@class,'review_')]")
        
        puts("Node count: #{nodes.size}")
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        nodes.each do |node|
          posNode += 1
          puts("posNode: #{posNode}")
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

          reviewerName = ""
          nacionality = ""
          userReviewCount = ""
          userAgeGroup = ""
          reviewDate = ""
          reviewDate2 = ""
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
          ignore_exception { userReviewCount = con.quote(node.element(:xpath,".//*[@class='review_item_user_review_count']").text) }
          ignore_exception { userAgeGroup = con.quote(node.element(:xpath,".//*[@class='user_age_group']").text) }
          ignore_exception { reviewDate = con.quote(node.element(:xpath,"./p[@class='review_item_date']").text) }
          ignore_exception { reviewDate2 = con.quote(node.element(:xpath,".//meta[@itemprop='datePublished']").attribute_value('content')) }
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
          ignore_exception { reviewInfoTag08 = con.quote(node.element(:xpath,".//ul[@class='review_item_info_tags']/li[8]").text) }
          ignore_exception { reviewInfoTag08 = con.quote(node.element(:xpath,".//ul[@class='review_item_info_tags']/li[8]").text) }
  
          puts("reviewerName: #{reviewerName}")
          puts("quote: #{quote}")
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          
          sqlInsert = "INSERT INTO `Navigator`.`tblBKReviewsIndiv` (IdBKReviewsFicha, Posicion, reviewerName, nacionality, score, quote, " +
                                                                   "reviewDate, reviewDate2, userReviewCount, userAgeGroup, " +
                                                                   "reviewInfoTag01, reviewInfoTag02, reviewInfoTag03, reviewInfoTag04," +
                                                                   "reviewInfoTag05, reviewInfoTag06, reviewInfoTag07, reviewInfoTag08) " +
                                                          "VALUES (#{idBKReviewsFicha}, #{posNode}, '#{reviewerName}', " +
                                                                 "'#{nacionality}', '#{score}', '#{quote}', '#{reviewDate}', '#{reviewDate2}', " +
                                                                 "'#{userReviewCount}', '#{userAgeGroup}', " +
                                                                 "'#{reviewInfoTag01}', '#{reviewInfoTag02}', '#{reviewInfoTag03}', '#{reviewInfoTag04}'," +
                                                                 "'#{reviewInfoTag05}', '#{reviewInfoTag06}', '#{reviewInfoTag07}', '#{reviewInfoTag08}')"
                        
          puts("sqlInsert: #{sqlInsert}")
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

          con.query(sqlInsert)
        end
      else

        storePage con, idTarget, idConexion, idLaunch, idCaptura, @numPag, descripcion, url
      end
      
      #abort("Aborting to check fail")
#rescue => e
#  puts e.inspect
#  puts e.backtrace
#end 

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      if descripcion.include? '.SurfTALangs'
        puts "SurfTALangs!!!!"; $stdout.flush

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

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
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
            #fallo
          end
          if langSuccess == 1
            storePage con, idTarget, idConexion, idLaunch, idCaptura, @numPag, descripcion, url
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          end
        end
      end

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      if descripcion.include? '.SurfPeineNotas'
        puts "SurfPeineNotas!!!!"; $stdout.flush
        
        titlepath = "//*[contains(text(),'ler rating')]"
        if @browser.element(:xpath,titlepath).exists?
          @browser.element(:xpath,titlepath).wd.location_once_scrolled_into_view
#archivandoTraza
          (1..5).each do |ipeine|
#archivandoTraza
           puts "  Peine. Paso #{ipeine}"; $stdout.flush
            peineactivo = "(//*[@id='REVIEWS']/..//*[contains(text(),'ler rating')]/../..//input[not(ancestor-or-self::*[@class='hidden' or @type='hidden']) and @checked and not(contains(@id,'LanguageFilter'))])[1]"
            while @browser.element(:xpath,peineactivo).exists?
              puts "  Desactivando peine activo"; $stdout.flush
              @browser.element(:xpath,"#{peineactivo}/following::label[1]").click
              sleep 5
   
#archivandoTraza

              reintentos = 20
              while @browser.element(:xpath,"(//*[@class='loadingBox' or contains(@class,'FeedLoadingSkeleton')])[1]").present?
                reintentos += -1
                break if reintentos<0
                sleep 3
              end
              raise 'FALLO loadingBox' if reintentos<=0
            end
    
#archivandoTraza
            puts "  Activando peine"; $stdout.flush
    #            pathactivarpeine = "(//*[contains(text(),'ler rating')]/..//input[not(ancestor-or-self::*[@class='hidden' or @type='hidden'])])[#{ipeine}]"
            pathactivarpeine = "(//*[@id='REVIEWS']/..//*[contains(text(),'ler rating')]/../..//input/following::label[1])[#{ipeine}]"
            puts "  pathactivarpeine = #{pathactivarpeine}"; $stdout.flush
            @browser.element(:xpath,pathactivarpeine).click
            sleep 1
            
    #            peinechkdpath = "(//*[contains(text(),'ler rating')]/..//input[not(ancestor-or-self::*[@class='hidden' or @type='hidden'])])[#{ipeine}][@checked]"
            peinechkdpath = "(//*[contains(text(),'ler rating')]/..//input)[#{ipeine}][@checked]"
            reintentos = 20
            until @browser.element(:xpath,peinechkdpath).exists? && !@browser.element(:xpath,"(//*[@class='loadingBox' or contains(@class,'FeedLoadingSkeleton')])[1]").present?
              reintentos += -1
              break if reintentos<0
              sleep 3
            end
            storePage con, idTarget, idConexion, idLaunch, idCaptura, @numPag, descripcion, url
            
          end
        end
      end
      
      puts url; $stdout.flush
      #puts checkPageCompleted
      #ttt = @browser.element(:xpath,checkPageCompleted).text
      #puts ttt
      
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

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

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      reintentos = 5
      begin
        reintentos += -1
        puts descripcion + '.chkNEXT.Pag:' + @numPag.to_s + '.Retries:' + reintentos.to_s ; $stdout.flush
      rescue
        break if reintentos<=0
        retry
      end

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      
      #Tratamiento KeepOnPaging especial para capturas de fichas con muchas paginas que suelen caer en mitad de proceso.
      if descripcion.include?('.KeepOnPaging.')
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        if @browser.element(:xpath,nextlink).exists?
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          urlNextLink = @browser.element(:xpath,nextlink).attribute_value('href')
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          unless urlNextLink.include? 'www.tripadvisor.' 
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
            urlNextLink = 'https://www.tripadvisor.es#{urlNextLink}'
          end
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          updateDate = Time.now.strftime("%Y-%m-%d %H:%M:%S")  #vigilar que no haya que meterlo en utc Time.now.utc.to_s(:db)
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          con.query("UPDATE tblKeepOnPaging SET nextLink = '#{urlNextLink}', updatetime = '#{updateDate}', page = #{@browser.element(:xpath,"//*[@id='REVIEWS']//*[@class='pageNumbers']/*[contains(@class,'current')]").text.strip} WHERE idTarget = #{idTarget};")
          $keep_on_paging_in_progress = true
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
        else
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
          con.query("DELETE FROM tblKeepOnPaging WHERE idTarget = #{idTarget};")
        end
      end

      unless descripcion.include? '.ManualPaging.' 
        break if nextlink==''
        break if !@browser.element(:xpath,nextlink).exists?
        
        if descripcion.include? '.GotoTALastVisitPage.'
          con.query("INSERT tblLastPage (lastpage) VALUES ('#{@browser.element(:xpath,"//*[@id='REVIEWS']//*[contains(@class,'pageNum current')]").text.strip}');")
        end

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
  
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
          
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

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

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

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

 def storePage con, idTarget, idConexion, idLaunch, idCaptura, page, descripcion, urlOrig
    t = Time.now
    strDT = t.strftime("%y%m%d_%H%M%S_%9N")

    updateDate = Time.now.strftime("%Y-%m-%d %H:%M:%S")  #vigilar que no haya que meterlo en utc Time.now.utc.to_s(:db)
    con.query("UPDATE `Navigator`.`tblConexiones` SET `UltimaConexion` = '#{updateDate}' WHERE `idConexion`=#{idConexion};")

    con.query("INSERT INTO `Navigator`.`tblInserts` (idConexion, idTarget, idLaunch, idCaptura, Pagina, FechaHora, Estado)"\
    " VALUES ('#{idConexion}', '#{idTarget}', '#{idLaunch}', '#{idCaptura}', '#{page}', '#{strDT}', 99);")
    int_idInsert = con.query("select last_insert_id()").fetch_row.first.to_i
    idInsert = "%08d" % int_idInsert

    unless urlOrig.include?('file:///') || urlOrig.include?('.googleapis.com') 
      storePagePng strDT
    end
    unless urlOrig.include? 'file:///'
      storePageHtml idLaunch, idCaptura, strDT
    end

    updateDate = Time.now.strftime("%Y-%m-%d %H:%M:%S")  #vigilar que no haya que meterlo en utc Time.now.utc.to_s(:db)
    con.query("UPDATE `Navigator`.`tblConexiones` SET `UltimaConexion` = '#{updateDate}' WHERE `idConexion`=#{idConexion};")
    con.query("UPDATE `Navigator`.`tblInserts` SET `Estado` = 1 WHERE `idInsert`=#{idInsert};")

      if descripcion.include? '.LoadOnDB.'
        if descripcion.include? 'BOOKING_HotelList.'

          posNode = 0
          nodes = @browser.divs(:xpath, "//*[@id='hotellist_inner']/div[@data-hotelid and not(./preceding::*[contains(@class,'sr_autoextend_divider')])]")
        
          puts("Node count: #{nodes.size}")
          nodes.each do |node|
            posNode += 1
                     
            captura = ""
            numPag = 0
            urlCaptura = ""
            fechaHora = ""
            numEntrada = 0
            placeName = ""
            placeLink = ""
            starRating = ""
            fullAddress = ""
            reviewCount = ""
            globalScore = ""
            geoData = ""
            addedToFavListsCount = ""
            propertyType = ""
            location = ""
            excellentChoice = ""
            priceLevel = ""
            wishListCount = ""
            dealSmart = ""
            srHotelName = ""
            srHotelType = ""
  
            ignore_exception { captura = "#{descripcion}" }
            ignore_exception { urlOrig = "#{urlOrig}" }
            ignore_exception { idLaunch = "#{idLaunch}" }
            ignore_exception { idCaptura = "#{idCaptura}" }
            ignore_exception { numPag = "#{page}" }
            ignore_exception { urlCaptura = @browser.url }
            ignore_exception { fechaHora = "#{strDT}" }
            ignore_exception { numEntrada = "#{posNode}" }
            ignore_exception { placeName = con.quote(node.element(:xpath,".//a[contains(@class,'hotel_name_link')]").text) }
            ignore_exception { placeLink = con.quote(node.element(:xpath,".//a[contains(@class,'hotel_name_link')]").attribute_value('href')) } 
            ignore_exception { starRating = con.quote(node.element(:xpath,".//i[contains(@class,'stars')]").attribute_value('class')) }
            ignore_exception { fullAddress = con.quote(node.element(:xpath,".//*[@class='address']/a").text) }
            ignore_exception { reviewCount = con.quote(node.element(:xpath,".//*[@class='bui-review-score__text']").text) }
            ignore_exception { globalScore = con.quote(node.element(:xpath,".//*[@class='bui-review-score__badge']").text) }
            ignore_exception { geoData = con.quote(node.element(:xpath,".//*[@data-coords]").attribute_value('data-coords')) }
            ignore_exception { addedToFavListsCount = con.quote(node.element(:xpath,"descendant-or-self::*[contains(concat(' ', normalize-space(@class), ' '), ' b-sprite ') and (contains(concat(' ', normalize-space(@class), ' '), ' icon_list_favorites '))]/following-sibling::text()[1]").text) }
            ignore_exception { propertyType = con.quote(node.element(:xpath,"descendant-or-self::*[contains(concat(' ', normalize-space(@class), ' '), ' sr_property_type_icon ')]/text()[last()]").text) }
            ignore_exception { location = con.quote(node.element(:xpath,".//*[@data-coords and @title]").text) }
            ignore_exception { excellentChoice = con.quote(node.element(:xpath,".//*[contains(@class,'vp_hotel_badge')]/span").text) } 
            ignore_exception { priceLevel = con.quote(node.element(:xpath,".//div[contains(@class,'sr_price_estimate')]/*").attribute_value('data-title')) }
            ignore_exception { wishListCount = con.quote(node.element(:xpath,".//i[contains(@class,'stars')]/following-sibling::span/a/*[@aria-hidden]").text) }
            ignore_exception { dealSmart = con.quote(node.element(:xpath,".//*[contains(@class,'icon_deal_smart')]/span").text) }
            ignore_exception { srHotelName = con.quote(node.element(:xpath,".//h3//span[contains(@class,'sr-hotel__name')]").text) }
            ignore_exception { srHotelType = con.quote(node.element(:xpath,".//h3//span[contains(@class,'sr-hotel__type')]").text) }
    
            sqlInsert = "INSERT INTO `Navigator`.`tblDataBKList` (`captura`, `urlOrig`, `idLaunch`, `idCaptura`, `numPag`, `urlCaptura`, `fechaHora`, `numEntrada`, `placeName`, `placeLink`, `starRating`, `fullAddress`, `reviewCount`, `globalScore`, `geoData`, `addedToFavListsCount`, `propertyType`, `location`, `excellentChoice`, `priceLevel`, `wishListCount`, `dealSmart`, `srHotelName`, `srHotelType`) "  +
                        "VALUES ('#{captura}', '#{urlOrig}', '#{idLaunch}', '#{idCaptura}', '#{numPag}', '#{urlCaptura}', '#{fechaHora}', '#{numEntrada}', '#{placeName}', '#{placeLink}', '#{starRating}', '#{fullAddress}', '#{reviewCount}', '#{globalScore}', '#{geoData}', '#{addedToFavListsCount}', '#{propertyType}', '#{location}', '#{excellentChoice}', '#{priceLevel}', '#{wishListCount}', '#{dealSmart}', '#{srHotelName}', '#{srHotelType}')"
            puts(sqlInsert)
  ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    
            con.query(sqlInsert)
          end
        elsif descripcion.include? 'TRIPADVISOR_HotelList.'

          posNode = 0
#INTRODUCIR PATH COLECCIÓN ITEMS
          nodes = @browser.divs(:xpath, "//*[starts-with(@class,'listing') and ./*/@data-index]")
        
          puts("Node count: #{nodes.size}")
          nodes.each do |node|
            posNode += 1
                     
            captura = ""
            numPag = 0
            urlCaptura = ""
            fechaHora = ""
            numEntrada = 0      
            placeName = ""
            placeLink = ""
            precio = ""
            globalScore = ""
            reviewCount = ""
            rank = ""
  
  
            ignore_exception { captura = "#{descripcion}" }
            ignore_exception { urlOrig = "#{urlOrig}" }
            ignore_exception { idLaunch = "#{idLaunch}" }
            ignore_exception { idCaptura = "#{idCaptura}" }
            ignore_exception { numPag = "#{page}" }
            ignore_exception { urlCaptura = @browser.url }
            ignore_exception { fechaHora = "#{strDT}" }
            ignore_exception { numEntrada = "#{posNode}" }
            ignore_exception { placeName = con.quote(node.element(:xpath,".//*[@class='listing_title']/a").text) }
            ignore_exception { placeLink = con.quote(node.element(:xpath,".//*[@class='listing_title']/a").attribute_value('href')) }
            ignore_exception { precio = con.quote(node.element(:xpath,".//*[starts-with(@class,'price-wrap')]/div[starts-with(@class,'price')]").text) }
            ignore_exception { globalScore = con.quote(node.element(:xpath,".//*[starts-with(@class,'ui_bubble_rating')]").attribute_value('class')) }
            ignore_exception { reviewCount = con.quote(node.element(:xpath,".//a[starts-with(@class,'review_count')]").text) }
            ignore_exception { rank = con.quote(node.element(:xpath,".//*[starts-with(@class,'popindex')]").text) }

    
            sqlInsert = "INSERT INTO `Navigator`.`tblDataTAList_ALO` (`captura`, `urlOrig`, `idLaunch`, `idCaptura`, `numPag`, `urlCaptura`, `fechaHora`, `numEntrada`, "  +
                        "`placeName`, `placeLink`, `precio`, `globalScore`, `reviewCount`, `rank`"  +
                        ") VALUES ('#{captura}', '#{urlOrig}', '#{idLaunch}', '#{idCaptura}', '#{numPag}', '#{urlCaptura}', '#{fechaHora}', '#{numEntrada}', "  +
                        "'#{placeName}', '#{placeLink}', '#{precio}', '#{globalScore}', '#{reviewCount}', '#{rank}'"  +
                        ")"
            puts(sqlInsert)

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    
            con.query(sqlInsert)
          end
        elsif descripcion.include? 'TAListMobile_Aloja.'

          posNode = 0
#INTRODUCIR PATH COLECCIÓN ITEMS
          nodes = @browser.divs(:xpath, "//*[contains(@class,'listingsContainer')]/div[contains(@class,'listingContainer')] | //*[@class='relWrap']/*[not(contains(@id,'filtered'))]//*[starts-with(@class,'listing') and ./*/@data-locationid] | //ul[@class='locationList']/li")
        
          puts("Node count: #{nodes.size}")
          nodes.each do |node|
            posNode += 1
                     
            captura = ""
            numPag = 0
            urlCaptura = ""
            fechaHora = ""
            numEntrada = 0
      
            placeName = ""
            placeLink = ""
            rank = ""
            reviewCount = ""
            reviewRating = ""

  
  
            ignore_exception { captura = "#{descripcion}" }
            ignore_exception { urlOrig = "#{urlOrig}" }
            ignore_exception { idLaunch = "#{idLaunch}" }
            ignore_exception { idCaptura = "#{idCaptura}" }
            ignore_exception { numPag = "#{page}" }
            ignore_exception { urlCaptura = @browser.url }
            ignore_exception { fechaHora = "#{strDT}" }
            ignore_exception { numEntrada = "#{posNode}" }
      

            ignore_exception { placeName = con.quote(node.element(:xpath,".//a[contains(@class,'PropertyTitleSection')]").text) }
            ignore_exception { placeLink = con.quote(node.element(:xpath,".//a[contains(@class,'PropertyTitleSection')]").attribute_value('href')) }
            ignore_exception { rank = con.quote(node.element(:xpath,".//*[contains(@class,'popindex')]").text) }
            ignore_exception { reviewCount = con.quote(node.element(:xpath,".//div[contains(@class,'ratingContainer')]//a/span").text) }
            ignore_exception { reviewRating = con.quote(node.element(:xpath,".//div[contains(@class,'ratingContainer')]//a/preceding-sibling::*[1]").attribute_value('class')) }


    
            sqlInsert = "INSERT INTO `Navigator`.`tblDataTAList_AL4` (`captura`, `urlOrig`, `idLaunch`, `idCaptura`, `numPag`, `urlCaptura`, `fechaHora`, `numEntrada`, "  +
                        "`placeName`, `placeLink`, `rank`, `reviewCount`, `reviewRating`"  +
                        ") VALUES ('#{captura}', '#{urlOrig}', '#{idLaunch}', '#{idCaptura}', '#{numPag}', '#{urlCaptura}', '#{fechaHora}', '#{numEntrada}', "  +
                        "'#{placeName}', '#{placeLink}', '#{rank}', '#{reviewCount}', '#{reviewRating}'"  +
                        ")"
            puts(sqlInsert)
  ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    
            con.query(sqlInsert)
          end
        elsif descripcion.include? 'TAListMobile_Rest.'

          posNode = 0
#INTRODUCIR PATH COLECCIÓN ITEMS
          nodes = @browser.divs(:xpath, "//*[@class='relWrap']/*[not(contains(@id,'filtered'))]//*[starts-with(@class,'listing') and ./*/@data-locationid] | //ul[@class='locationList']/li | //div[contains(@class,'restaurants-list-ListCell__cellContainer')]")
        
          puts("Node count: #{nodes.size}")
          nodes.each do |node|
            posNode += 1
                     
            captura = ""
            numPag = 0
            urlCaptura = ""
            fechaHora = ""
            numEntrada = 0
      
            placeName = ""
            placeLink = ""
            rank = ""
            reviewCount = ""
            reviewRating = ""
            price = ""
            offerPrice = ""
            tags = ""


  
  
            ignore_exception { captura = "#{descripcion}" }
            ignore_exception { urlOrig = "#{urlOrig}" }
            ignore_exception { idLaunch = "#{idLaunch}" }
            ignore_exception { idCaptura = "#{idCaptura}" }
            ignore_exception { numPag = "#{page}" }
            ignore_exception { urlCaptura = @browser.url }
            ignore_exception { fechaHora = "#{strDT}" }
            ignore_exception { numEntrada = "#{posNode}" }
      

            ignore_exception { placeName = con.quote(node.element(:xpath,".//*[@class='location'] | .//a[contains(@class,'restaurantName')]").text) }
            ignore_exception { placeLink = con.quote(node.element(:xpath,"./a | .//a[contains(@class,'restaurantName')]").attribute_value('href')) }
            ignore_exception { rank = con.quote(node.element(:xpath,".//*[contains(@class,'popularityLLR')]").text) }
            ignore_exception { reviewCount = con.quote(node.element(:xpath,".//*[contains(@class,'reviewCountLLR')] | .//*[contains(@class,'userReviewCount')]").text) }
            ignore_exception { reviewRating = con.quote(node.element(:xpath,".//*[@class='list_item_rating']/span | .//*[contains(@class,'bubbleRating')]/span").attribute_value('class')) }
            ignore_exception { price = con.quote(node.element(:xpath,".//*[@class='priceClassText'] | .//*[contains(@class,'cuisinePriceMenu')]/span[2]").text) }
            ignore_exception { offerPrice = con.quote(node.element(:xpath,".//*[@class='offer_price']").text) }
            ignore_exception { tags = con.quote(node.element(:xpath,".//*[@class='moreText'] | .//*[contains(@class,'cuisinePriceMenu')]/span[1]").text) }


    
            sqlInsert = "INSERT INTO `Navigator`.`tblDataTAList_RES` (`captura`, `urlOrig`, `idLaunch`, `idCaptura`, `numPag`, `urlCaptura`, `fechaHora`, `numEntrada`, "  +
                        "`placeName`, `placeLink`, `rank`, `reviewCount`, `reviewRating`, `price`, `offerPrice`, `tags`"  +
                        ") VALUES ('#{captura}', '#{urlOrig}', '#{idLaunch}', '#{idCaptura}', '#{numPag}', '#{urlCaptura}', '#{fechaHora}', '#{numEntrada}', "  +
                        "'#{placeName}', '#{placeLink}', '#{rank}', '#{reviewCount}', '#{reviewRating}', '#{price}', '#{offerPrice}', '#{tags}'"  +
                        ")"
            puts(sqlInsert)
  ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    
            con.query(sqlInsert)
          end
        elsif descripcion.include? 'TAListMobile_Atrac.'

          posNode = 0
#INTRODUCIR PATH COLECCIÓN ITEMS
          nodes = @browser.divs(:xpath, "//*[@class='relWrap']/*[not(contains(@id,'filtered'))]//*[starts-with(@class,'listing') and ./*/@data-locationid] | //ul[@class='locationList']/li")
        
          puts("Node count: #{nodes.size}")
          nodes.each do |node|
            posNode += 1
                     
            captura = ""
            numPag = 0
            urlCaptura = ""
            fechaHora = ""
            numEntrada = 0
      
            placeName = ""
            placeLink = ""
            rank = ""
            reviewCount = ""
            reviewRating = ""
            price = ""
            offerPrice = ""
            tags = ""



  
            ignore_exception { captura = "#{descripcion}" }
            ignore_exception { urlOrig = "#{urlOrig}" }
            ignore_exception { idLaunch = "#{idLaunch}" }
            ignore_exception { idCaptura = "#{idCaptura}" }
            ignore_exception { numPag = "#{page}" }
            ignore_exception { urlCaptura = @browser.url }
            ignore_exception { fechaHora = "#{strDT}" }
            ignore_exception { numEntrada = "#{posNode}" }
      

            ignore_exception { placeName = con.quote(node.element(:xpath,".//*[@class='location']").text) }
            ignore_exception { placeLink = con.quote(node.element(:xpath,".//div[@class='main']//a").attribute_value('href')) }
            ignore_exception { rank = con.quote(node.element(:xpath,".//*[contains(@class,'popularityLLR')]").text) }
            ignore_exception { reviewCount = con.quote(node.element(:xpath,".//*[contains(@class,'reviewCountLLR')]").text) }
            ignore_exception { reviewRating = con.quote(node.element(:xpath,".//*[contains(@class,'ratingLLR')]/span").attribute_value('class')) }
            ignore_exception { price = con.quote(node.element(:xpath,".//*[@class='price_from']").text) }
            ignore_exception { offerPrice = con.quote(node.element(:xpath,".//*[@class='offer_price']").text) }
            ignore_exception { tags = con.quote(node.element(:xpath,".//*[@class='moreText']").text) }



    
            sqlInsert = "INSERT INTO `Navigator`.`tblDataTAList_ATR` (`captura`, `urlOrig`, `idLaunch`, `idCaptura`, `numPag`, `urlCaptura`, `fechaHora`, `numEntrada`, "  +
                        "`placeName`, `placeLink`, `rank`, `reviewCount`, `reviewRating`, `price`, `offerPrice`, `tags`"  +
                        ") VALUES ('#{captura}', '#{urlOrig}', '#{idLaunch}', '#{idCaptura}', '#{numPag}', '#{urlCaptura}', '#{fechaHora}', '#{numEntrada}', "  +
                        "'#{placeName}', '#{placeLink}', '#{rank}', '#{reviewCount}', '#{reviewRating}', '#{price}', '#{offerPrice}', '#{tags}'"  +
                        ")"
            puts(sqlInsert)
  ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    
            con.query(sqlInsert)
          end



        elsif descripcion.include? 'TRIPADVISOR_UserReviews.'

          posNode = 0
#INTRODUCIR PATH COLECCIÓN ITEMS
          nodes = @browser.divs(:xpath, "//div[@id='content']/div/div")
        
          puts("Node count: #{nodes.size}")
          nodes.each do |node|
            posNode += 1
                     
            captura = ""
            numPag = 0
            urlCaptura = ""
            fechaHora = ""
            numEntrada = 0
      
            reviewDate = ""
            reviewLink = ""
            score = ""
            title = ""
            text = ""
            dateVisit = ""

  
            ignore_exception { captura = "#{descripcion}" }
            ignore_exception { urlOrig = "#{urlOrig}" }
            ignore_exception { idLaunch = "#{idLaunch}" }
            ignore_exception { idCaptura = "#{idCaptura}" }
            ignore_exception { numPag = "#{page}" }
            ignore_exception { urlCaptura = @browser.url }
            ignore_exception { fechaHora = "#{strDT}" }
            ignore_exception { numEntrada = "#{posNode}" }
      

            ignore_exception { reviewDate = con.quote(node.element(:xpath,".//*[@class='ui_link']").text) }
            ignore_exception { reviewLink = con.quote(node.element(:xpath,".//*[@class='ui_link']").attribute_value('href')) }
            ignore_exception { score = con.quote(node.element(:xpath,".//*[contains(@class,'ReviewSection')]//*[contains(@class,'ui_bubble_rating')]").attribute_value('class')) }
            ignore_exception { title = con.quote(node.element(:xpath,".//div[contains(@class,'social-section-review-ReviewSection__title')]").text) }
            ignore_exception { text = con.quote(node.element(:xpath,".//div[contains(@class,'social-section-review-ReviewSection__body')]").text) }
            ignore_exception { dateVisit = con.quote(node.element(:xpath,".//div[contains(@class,'social-review-info-EventDate__event_date')]").text) }



    
            sqlInsert = "INSERT INTO `Navigator`.`tblDataTAUserReviews` (`captura`, `urlOrig`, `idLaunch`, `idCaptura`, `numPag`, `urlCaptura`, `fechaHora`, `numEntrada`, "  +
                        "`reviewDate`, `reviewLink`, `score`, `title`, `text`, `dateVisit`"  +
                        ") VALUES ('#{captura}', '#{urlOrig}', '#{idLaunch}', '#{idCaptura}', '#{numPag}', '#{urlCaptura}', '#{fechaHora}', '#{numEntrada}', "  +
                        "'#{reviewDate}', '#{reviewLink}', '#{score}', '#{title}', '#{text}', '#{dateVisit}'"  +
                        ")"
            puts(sqlInsert)
  ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    
            con.query(sqlInsert)
          end


        elsif descripcion.include? 'TRIPADVISOR_ShowUserReviews.'

          posNode = 0
#INTRODUCIR PATH COLECCIÓN ITEMS
          nodes = @browser.divs(:xpath, "//*[starts-with(@id,'review_')]")
        
          puts("Node count: #{nodes.size}")
          nodes.each do |node|
            posNode += 1
                     
            captura = ""
            numPag = 0
            urlCaptura = ""
            fechaHora = ""
            numEntrada = 0
      
            idReview = ""
            userName = ""
            location = ""
            score = ""
            replyHeader = ""
            replyDate = ""
            replyText = ""
            visitDate = ""
            tripType = ""

            ignore_exception { captura = "#{descripcion}" }
            ignore_exception { urlOrig = "#{urlOrig}" }
            ignore_exception { idLaunch = "#{idLaunch}" }
            ignore_exception { idCaptura = "#{idCaptura}" }
            ignore_exception { numPag = "#{page}" }
            ignore_exception { urlCaptura = @browser.url }
            ignore_exception { fechaHora = "#{strDT}" }
            ignore_exception { numEntrada = "#{posNode}" }
      

            ignore_exception { idReview = con.quote(node.attribute_value('id')) }
            ignore_exception { userName = con.quote(node.element(:xpath,".//div[@class='member_info']//*[starts-with(@class,'info_text')]/div[1] | .//div[@class='member_info']//*[starts-with(@class,'username')]").text) }
            ignore_exception { location = con.quote(node.element(:xpath,".//div[@class='member_info']//div[@class='userLoc' or @class='location']").text) }
            ignore_exception { score = con.quote(node.element(:xpath,".//*[starts-with(@class,'ui_column') or contains(@class,'reviewItemInline')]/*[starts-with(@class,'ui_bubble_rating')]").attribute_value('class')) }
            ignore_exception { replyHeader = con.quote(node.element(:xpath,".//div[@class='mgrRspnInline']//div[@class='header']").text) }
            ignore_exception { replyDate = con.quote(node.element(:xpath,".//div[@class='mgrRspnInline']//*[@class='responseDate']").text) }
            ignore_exception { replyText = con.quote(node.element(:xpath,".//div[@class='mgrRspnInline']//p[1]").text) }
            ignore_exception { visitDate = con.quote(node.element(:xpath,".//div[@class='prw_rup prw_reviews_stay_date_hsx']").text) }
            ignore_exception { tripType = con.quote(node.element(:xpath,".//span[@class='trip_type_label']/..").text) }


    
            sqlInsert = "INSERT INTO `Navigator`.`tblDataTAShowUserReviews` (`captura`, `urlOrig`, `idLaunch`, `idCaptura`, `numPag`, `urlCaptura`, `fechaHora`, `numEntrada`, "  +
                        "`idReview`, `userName`, `location`, `score`, `replyHeader`, `replyDate`, `replyText`, `visitDate`, `tripType`"  +
                        ") VALUES ('#{captura}', '#{urlOrig}', '#{idLaunch}', '#{idCaptura}', '#{numPag}', '#{urlCaptura}', '#{fechaHora}', '#{numEntrada}', "  +
                        "'#{idReview}', '#{userName}', '#{location}', '#{score}', '#{replyHeader}', '#{replyDate}', '#{replyText}', '#{visitDate}', '#{tripType}'"  +
                        ")"
            puts(sqlInsert)
  ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    
            con.query(sqlInsert)
          end







        elsif descripcion.include? 'TRIPADVISOR_RestFicha.'

          posNode = 0
#INTRODUCIR PATH COLECCIÓN ITEMS
          nodes = @browser.divs(:xpath, "/*")
        
          puts("Node count: #{nodes.size}")
          nodes.each do |node|
            posNode += 1
                     
            captura = ""
            numPag = 0
            urlCaptura = ""
            fechaHora = ""
            numEntrada = 0
      
            placeName = ""
            award_text = ""
            award_class = ""
            certificadoExcelencia = ""
            fullAddress = ""
            postalCode = ""
            locality = ""
            phone = ""
            placeRating = ""
            globalScore = ""
            reviewCount = ""
            infoRanking = ""
            placeType = ""
            geoLat = ""
            geoLng = ""
            linkPrimeraReview = ""
            currentPage = ""
            cuisine = ""
            langList = ""
            langSelected = ""
            segmSelected = ""
            filterSegment = ""
            filterCount = ""
            langFromRadioButtons = ""
            recommendedPercent2 = ""
            sorting = ""
            value5_Count = ""
            value4_Count = ""
            value3_Count = ""
            value2_Count = ""
            value1_Count = ""
            timeOfYear1_Count = ""
            timeOfYear2_Count = ""
            timeOfYear3_Count = ""
            timeOfYear4_Count = ""
            varDimField1 = ""
            varDimField1Val = ""
            varDimField2 = ""
            varDimField2Val = ""
            varDimField3 = ""
            varDimField3Val = ""
            varDimField4 = ""
            varDimField4Val = ""
            varDimField5 = ""
            varDimField5Val = ""
            varDimField6 = ""
            varDimField6Val = ""
            varSegmField1 = ""
            varSegmField1Val = ""
            varSegmField2 = ""
            varSegmField2Val = ""
            varSegmField3 = ""
            varSegmField3Val = ""
            varSegmField4 = ""
            varSegmField4Val = ""
            varSegmField5 = ""
            varSegmField5Val = ""
            varSegmField6 = ""
            varSegmField6Val = ""
            codeMap = ""
            peineNotas5 = ""
            peineNotas4 = ""
            peineNotas3 = ""
            peineNotas2 = ""
            peineNotas1 = ""
            varLangField01 = ""
            varLangField01Val = ""
            varLangField02 = ""
            varLangField02Val = ""
            varLangField03 = ""
            varLangField03Val = ""
            varLangField04 = ""
            varLangField04Val = ""
            varLangField05 = ""
            varLangField05Val = ""
            varLangField06 = ""
            varLangField06Val = ""
            varLangField07 = ""
            varLangField07Val = ""
            varLangField08 = ""
            varLangField08Val = ""
            varLangField09 = ""
            varLangField09Val = ""
            varLangField10 = ""
            varLangField10Val = ""
            varLangField11 = ""
            varLangField11Val = ""
            varLangField12 = ""
            varLangField12Val = ""
            varLangField13 = ""
            varLangField13Val = ""
            varLangField14 = ""
            varLangField14Val = ""
            varLangField15 = ""
            varLangField15Val = ""
            varLangField16 = ""
            varLangField16Val = ""
            varLangField17 = ""
            varLangField17Val = ""
            varLangField18 = ""
            varLangField18Val = ""
            varLangField19 = ""
            varLangField19Val = ""
            varLangField20 = ""
            varLangField20Val = ""
            varLangField21 = ""
            varLangField21Val = ""
            varLangField22 = ""
            varLangField22Val = ""
            varLangField23 = ""
            varLangField23Val = ""
            varLangField24 = ""
            varLangField24Val = ""
            varLangField25 = ""
            varLangField25Val = ""
            varLangField26 = ""
            varLangField26Val = ""
            varLangField27 = ""
            varLangField27Val = ""
            varLangField28 = ""
            varLangField28Val = ""
            varLangField29 = ""
            varLangField29Val = ""
            varLangField30 = ""
            varLangField30Val = ""
            placeName2 = ""
            fullAddress2 = ""
            globalScore2 = ""
            reviewCount2 = ""
            breadcrums = ""
            h11 = ""
            h12 = ""



  
            ignore_exception { captura = "#{descripcion}" }
            ignore_exception { urlOrig = "#{urlOrig}" }
            ignore_exception { idLaunch = "#{idLaunch}" }
            ignore_exception { idCaptura = "#{idCaptura}" }
            ignore_exception { numPag = "#{page}" }
            ignore_exception { urlCaptura = @browser.url }
            ignore_exception { fechaHora = "#{strDT}" }
            ignore_exception { numEntrada = "#{posNode}" }
      
            ignore_exception { placeName = con.quote(node.element(:xpath,"//*[contains(@class,'header')]//h1").text) }
            ignore_exception { award_text = con.quote(node.element(:xpath,"(//img[contains(@class,'Award')])[1]").attribute_value('alt')) }
            ignore_exception { award_class = con.quote(node.element(:xpath,"(//img[contains(@class,'Award')])[1]").attribute_value('class')) }
            ignore_exception { certificadoExcelencia = con.quote(node.element(:xpath,"//*[@data-tab='TABS_OVERVIEW' or @data-tab='TABS_ABOUT']//*[starts-with(@class,'ui_icon certificate-of-excellence')]/..").text) }
            ignore_exception { fullAddress = con.quote(node.element(:xpath,"(.//*[contains(./@class,'blEntry address')] | .//*[contains(./@class,'public-business-listing-ContactInfo')] | //address)[1]").text) }
            ignore_exception { postalCode = con.quote(node.element(:xpath,"(//span[@class='locality'])[1]").text) }
            ignore_exception { locality = con.quote(node.element(:xpath,"(//span[@class='locality'])[1]").text) }
            ignore_exception { phone = con.quote(node.element(:xpath,"//*[contains(@class,'ui_icon phone')]/following-sibling::*[1]").text) }
            ignore_exception { placeRating = con.quote(node.element(:xpath,"//*[starts-with(@class,'starRating')]/div[2]/text() | //span[@class='star']//img").attribute_value('alt')) }
            ignore_exception { globalScore = con.quote(node.element(:xpath,"//*[@class='ratingContainer']//span[contains(@class,'bubble_rating')]").attribute_value('alt')) }
            ignore_exception { reviewCount = con.quote(node.element(:xpath,"//*[@class='ratingContainer']//*[contains(@class,'reviewCount')]").text) }
            ignore_exception { infoRanking = con.quote(node.element(:xpath,"//*[starts-with(@class,'slim_ranking') or starts-with(@class,'header_popularity')]").text) }
            ignore_exception { placeType = con.quote(node.element(:xpath,"//*[@class='placeTypeText']").text) }
            ignore_exception { geoLat = con.quote(node.element(:xpath,"//*[contains(@class,'mapContainer')]").attribute_value('data-lat')) }
            ignore_exception { geoLng = con.quote(node.element(:xpath,"//*[contains(@class,'mapContainer')]").attribute_value('data-lng')) }
            ignore_exception { linkPrimeraReview = con.quote(node.element(:xpath,"(//*[@id='REVIEWS']//div[starts-with(@id,'review_')])[1]/div[not(@style='display: none;')]//a[@id]").attribute_value('href')) }
            ignore_exception { currentPage = con.quote(node.element(:xpath,".//*[@class='pageNum current']").text) }
            ignore_exception { cuisine = con.quote(node.element(:xpath,"//*[starts-with(@class,'header_links')]").text) }
            ignore_exception { langList = con.quote(node.element(:xpath,"//*[@id='filterLang']/option").attribute_value('value')) }
            ignore_exception { langSelected = con.quote(node.element(:xpath,"//div[@data-name='language']//*[@checked]/../label").text) }
            ignore_exception { segmSelected = con.quote(node.element(:xpath,".//*[@id='filterControls']//*[contains(@class,'segment')]/ul/li[./span/input/@checked]/label").text) }
            ignore_exception { filterSegment = con.quote(node.element(:xpath,"//span[@class='filter']").text) }
            ignore_exception { filterCount = con.quote(node.element(:xpath,"//span[@class='filter']/preceding-sibling::b[1]").text) }
            ignore_exception { langFromRadioButtons = con.quote(node.element(:xpath,".//*[contains(@class,'language')]/ul/li[./span/input/@checked]/label").text) }
            ignore_exception { recommendedPercent2 = con.quote(node.element(:xpath,"//fieldset[@class='review_filter_eatery']/div/div[1]/div").text) }
            ignore_exception { sorting = con.quote(node.element(:xpath,"//fieldset/span[contains(@class,'selected')]").text) }
            ignore_exception { value5_Count = con.quote(node.element(:xpath,"//*[@for='ReviewRatingFilter_5' or @for='filters_detail_checkbox_trating__5']/../span[contains(@class,'row_num')]").text) }
            ignore_exception { value4_Count = con.quote(node.element(:xpath,"//*[@for='ReviewRatingFilter_4' or @for='filters_detail_checkbox_trating__4']/../span[contains(@class,'row_num')]").text) }
            ignore_exception { value3_Count = con.quote(node.element(:xpath,"//*[@for='ReviewRatingFilter_3' or @for='filters_detail_checkbox_trating__3']/../span[contains(@class,'row_num')]").text) }
            ignore_exception { value2_Count = con.quote(node.element(:xpath,"//*[@for='ReviewRatingFilter_2' or @for='filters_detail_checkbox_trating__2']/../span[contains(@class,'row_num')]").text) }
            ignore_exception { value1_Count = con.quote(node.element(:xpath,"//*[@for='ReviewRatingFilter_1' or @for='filters_detail_checkbox_trating__1']/../span[contains(@class,'row_num')]").text) }
            ignore_exception { timeOfYear1_Count = con.quote(node.element(:xpath,"//*[starts-with(@class,'col season')]/ul/li[1]/label").text) }
            ignore_exception { timeOfYear2_Count = con.quote(node.element(:xpath,"//*[starts-with(@class,'col season')]/ul/li[2]/label").text) }
            ignore_exception { timeOfYear3_Count = con.quote(node.element(:xpath,"//*[starts-with(@class,'col season')]/ul/li[3]/label").text) }
            ignore_exception { timeOfYear4_Count = con.quote(node.element(:xpath,"//*[starts-with(@class,'col season')]/ul/li[4]/label").text) }
            ignore_exception { varDimField1 = con.quote(node.element(:xpath,"(//*[contains(@class,'restaurants-detail-overview-cards-RatingsOverviewCard__ratingQuestionRow')])[1]/span[2]").text) }
            ignore_exception { varDimField1Val = con.quote(node.element(:xpath,"(//*[contains(@class,'restaurants-detail-overview-cards-RatingsOverviewCard__ratingQuestionRow')])[1]/span[3]/span").attribute_value('class')) }
            ignore_exception { varDimField2 = con.quote(node.element(:xpath,"(//*[contains(@class,'restaurants-detail-overview-cards-RatingsOverviewCard__ratingQuestionRow')])[2]/span[2]").text) }
            ignore_exception { varDimField2Val = con.quote(node.element(:xpath,"(//*[contains(@class,'restaurants-detail-overview-cards-RatingsOverviewCard__ratingQuestionRow')])[2]/span[3]/span").attribute_value('class')) }
            ignore_exception { varDimField3 = con.quote(node.element(:xpath,"(//*[contains(@class,'restaurants-detail-overview-cards-RatingsOverviewCard__ratingQuestionRow')])[3]/span[2]").text) }
            ignore_exception { varDimField3Val = con.quote(node.element(:xpath,"(//*[contains(@class,'restaurants-detail-overview-cards-RatingsOverviewCard__ratingQuestionRow')])[3]/span[3]/span").attribute_value('class')) }
            ignore_exception { varDimField4 = con.quote(node.element(:xpath,"(//*[contains(@class,'restaurants-detail-overview-cards-RatingsOverviewCard__ratingQuestionRow')])[4]/span[2]").text) }
            ignore_exception { varDimField4Val = con.quote(node.element(:xpath,"(//*[contains(@class,'restaurants-detail-overview-cards-RatingsOverviewCard__ratingQuestionRow')])[4]/span[3]/span").attribute_value('class')) }
            ignore_exception { varDimField5 = con.quote(node.element(:xpath,"(//*[contains(@class,'restaurants-detail-overview-cards-RatingsOverviewCard__ratingQuestionRow')])[5]/span[2]").text) }
            ignore_exception { varDimField5Val = con.quote(node.element(:xpath,"(//*[contains(@class,'restaurants-detail-overview-cards-RatingsOverviewCard__ratingQuestionRow')])[5]/span[3]/span").attribute_value('class')) }
            ignore_exception { varDimField6 = con.quote(node.element(:xpath,"(//*[contains(@class,'restaurants-detail-overview-cards-RatingsOverviewCard__ratingQuestionRow')])[6]/span[2]").text) }
            ignore_exception { varDimField6Val = con.quote(node.element(:xpath,"(//*[contains(@class,'restaurants-detail-overview-cards-RatingsOverviewCard__ratingQuestionRow')])[6]/span[3]/span").attribute_value('class')) }
            ignore_exception { varSegmField1 = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[1]/div/div[1]").text) }
            ignore_exception { varSegmField1Val = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[1]/div/div[2]").text) }
            ignore_exception { varSegmField2 = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[2]/div/div[1]").text) }
            ignore_exception { varSegmField2Val = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[2]/div/div[2]").text) }
            ignore_exception { varSegmField3 = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[3]/div/div[1]").text) }
            ignore_exception { varSegmField3Val = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[3]/div/div[2]").text) }
            ignore_exception { varSegmField4 = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[4]/div/div[1]").text) }
            ignore_exception { varSegmField4Val = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[4]/div/div[2]").text) }
            ignore_exception { varSegmField5 = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[5]/div/div[1]").text) }
            ignore_exception { varSegmField5Val = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[5]/div/div[2]").text) }
            ignore_exception { varSegmField6 = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[6]/div/div[1]").text) }
            ignore_exception { varSegmField6Val = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[6]/div/div[2]").text) }
            ignore_exception { codeMap = con.quote(node.element(:xpath,"//*[contains(@src,'center=')]").attribute_value('src')) }
            ignore_exception { peineNotas5 = con.quote(node.element(:xpath,"(//*[contains(text(),'ler rating')]/..//div[@data-value])[1]/span[last()]").text) }
            ignore_exception { peineNotas4 = con.quote(node.element(:xpath,"(//*[contains(text(),'ler rating')]/..//div[@data-value])[2]/span[last()]").text) }
            ignore_exception { peineNotas3 = con.quote(node.element(:xpath,"(//*[contains(text(),'ler rating')]/..//div[@data-value])[3]/span[last()]").text) }
            ignore_exception { peineNotas2 = con.quote(node.element(:xpath,"(//*[contains(text(),'ler rating')]/..//div[@data-value])[4]/span[last()]").text) }
            ignore_exception { peineNotas1 = con.quote(node.element(:xpath,"(//*[contains(text(),'ler rating')]/..//div[@data-value])[5]/span[last()]").text) }
            ignore_exception { varLangField01 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[01]").attribute_value('value')) }
            ignore_exception { varLangField01Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[01]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField02 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[02]").attribute_value('value')) }
            ignore_exception { varLangField02Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[02]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField03 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[03]").attribute_value('value')) }
            ignore_exception { varLangField03Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[03]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField04 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[04]").attribute_value('value')) }
            ignore_exception { varLangField04Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[04]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField05 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[05]").attribute_value('value')) }
            ignore_exception { varLangField05Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[05]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField06 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[06]").attribute_value('value')) }
            ignore_exception { varLangField06Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[06]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField07 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[07]").attribute_value('value')) }
            ignore_exception { varLangField07Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[07]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField08 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[08]").attribute_value('value')) }
            ignore_exception { varLangField08Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[08]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField09 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[09]").attribute_value('value')) }
            ignore_exception { varLangField09Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[09]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField10 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[10]").attribute_value('value')) }
            ignore_exception { varLangField10Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[10]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField11 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[11]").attribute_value('value')) }
            ignore_exception { varLangField11Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[11]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField12 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[12]").attribute_value('value')) }
            ignore_exception { varLangField12Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[12]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField13 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[13]").attribute_value('value')) }
            ignore_exception { varLangField13Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[13]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField14 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[14]").attribute_value('value')) }
            ignore_exception { varLangField14Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[14]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField15 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[15]").attribute_value('value')) }
            ignore_exception { varLangField15Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[15]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField16 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[16]").attribute_value('value')) }
            ignore_exception { varLangField16Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[16]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField17 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[17]").attribute_value('value')) }
            ignore_exception { varLangField17Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[17]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField18 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[18]").attribute_value('value')) }
            ignore_exception { varLangField18Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[18]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField19 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[19]").attribute_value('value')) }
            ignore_exception { varLangField19Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[19]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField20 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[20]").attribute_value('value')) }
            ignore_exception { varLangField20Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[20]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField21 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[21]").attribute_value('value')) }
            ignore_exception { varLangField21Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[21]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField22 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[22]").attribute_value('value')) }
            ignore_exception { varLangField22Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[22]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField23 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[23]").attribute_value('value')) }
            ignore_exception { varLangField23Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[23]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField24 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[24]").attribute_value('value')) }
            ignore_exception { varLangField24Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[24]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField25 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[25]").attribute_value('value')) }
            ignore_exception { varLangField25Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[25]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField26 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[26]").attribute_value('value')) }
            ignore_exception { varLangField26Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[26]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField27 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[27]").attribute_value('value')) }
            ignore_exception { varLangField27Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[27]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField28 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[28]").attribute_value('value')) }
            ignore_exception { varLangField28Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[28]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField29 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[29]").attribute_value('value')) }
            ignore_exception { varLangField29Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[29]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField30 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[30]").attribute_value('value')) }
            ignore_exception { varLangField30Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[30]/..//following-sibling::label[1]").text) }
            ignore_exception { placeName2 = con.quote(node.element(:xpath,"//ul[@class='breadcrumbs']/li[last()]").text) }
            ignore_exception { fullAddress2 = con.quote(node.element(:xpath,"//*[contains(@class,'ContactCard__contactRow') and contains(./span/@class,'map-pin')]").text) }
            ignore_exception { globalScore2 = con.quote(node.element(:xpath,"//*[contains(@class,'CompanyProfileContainer')]//*[contains(@class,'bubble_rating')]").attribute_value('class')) }
            ignore_exception { reviewCount2 = con.quote(node.element(:xpath,"//span[@class='reviews_header_count']").text) }
            ignore_exception { breadcrums = con.quote(node.element(:xpath,"//ul[@class='breadcrums']").text) }
            ignore_exception { h11 = con.quote(node.element(:xpath,"(//h1)[1]").text) }
            ignore_exception { h12 = con.quote(node.element(:xpath,"(//h1)[2]").text) }





    
            sqlInsert = "INSERT INTO `Navigator`.`tblDataTAFicha_RES` (`captura`, `urlOrig`, `idLaunch`, `idCaptura`, `numPag`, `urlCaptura`, `fechaHora`, `numEntrada`, "  +
                        "`placeName`, `award_text`, `award_class`, `certificadoExcelencia`, `fullAddress`, `postalCode`, `locality`, `phone`, `placeRating`, `globalScore`, `reviewCount`, `infoRanking`, `placeType`, `geoLat`, `geoLng`, `linkPrimeraReview`, `currentPage`, `cuisine`, `langList`, `langSelected`, `segmSelected`, `filterSegment`, `filterCount`, `langFromRadioButtons`, `recommendedPercent2`, `sorting`, `value5_Count`, `value4_Count`, `value3_Count`, `value2_Count`, `value1_Count`, `timeOfYear1_Count`, `timeOfYear2_Count`, `timeOfYear3_Count`, `timeOfYear4_Count`, `varDimField1`, `varDimField1Val`, `varDimField2`, `varDimField2Val`, `varDimField3`, `varDimField3Val`, `varDimField4`, `varDimField4Val`, `varDimField5`, `varDimField5Val`, `varDimField6`, `varDimField6Val`, `varSegmField1`, `varSegmField1Val`, `varSegmField2`, `varSegmField2Val`, `varSegmField3`, `varSegmField3Val`, `varSegmField4`, `varSegmField4Val`, `varSegmField5`, `varSegmField5Val`, `varSegmField6`, `varSegmField6Val`, `codeMap`, `peineNotas5`, `peineNotas4`, `peineNotas3`, `peineNotas2`, `peineNotas1`, `varLangField01`, `varLangField01Val`, `varLangField02`, `varLangField02Val`, `varLangField03`, `varLangField03Val`, `varLangField04`, `varLangField04Val`, `varLangField05`, `varLangField05Val`, `varLangField06`, `varLangField06Val`, `varLangField07`, `varLangField07Val`, `varLangField08`, `varLangField08Val`, `varLangField09`, `varLangField09Val`, `varLangField10`, `varLangField10Val`, `varLangField11`, `varLangField11Val`, `varLangField12`, `varLangField12Val`, `varLangField13`, `varLangField13Val`, `varLangField14`, `varLangField14Val`, `varLangField15`, `varLangField15Val`, `varLangField16`, `varLangField16Val`, `varLangField17`, `varLangField17Val`, `varLangField18`, `varLangField18Val`, `varLangField19`, `varLangField19Val`, `varLangField20`, `varLangField20Val`, `varLangField21`, `varLangField21Val`, `varLangField22`, `varLangField22Val`, `varLangField23`, `varLangField23Val`, `varLangField24`, `varLangField24Val`, `varLangField25`, `varLangField25Val`, `varLangField26`, `varLangField26Val`, `varLangField27`, `varLangField27Val`, `varLangField28`, `varLangField28Val`, `varLangField29`, `varLangField29Val`, `varLangField30`, `varLangField30Val`, `placeName2`, `fullAddress2`, `globalScore2`, `reviewCount2`, `breadcrums`, `h1-1`, `h1-2`"  +
                        ") VALUES ('#{captura}', '#{urlOrig}', '#{idLaunch}', '#{idCaptura}', '#{numPag}', '#{urlCaptura}', '#{fechaHora}', '#{numEntrada}', "  +
                        "'#{placeName}', '#{award_text}', '#{award_class}', '#{certificadoExcelencia}', '#{fullAddress}', '#{postalCode}', '#{locality}', '#{phone}', '#{placeRating}', '#{globalScore}', '#{reviewCount}', '#{infoRanking}', '#{placeType}', '#{geoLat}', '#{geoLng}', '#{linkPrimeraReview}', '#{currentPage}', '#{cuisine}', '#{langList}', '#{langSelected}', '#{segmSelected}', '#{filterSegment}', '#{filterCount}', '#{langFromRadioButtons}', '#{recommendedPercent2}', '#{sorting}', '#{value5_Count}', '#{value4_Count}', '#{value3_Count}', '#{value2_Count}', '#{value1_Count}', '#{timeOfYear1_Count}', '#{timeOfYear2_Count}', '#{timeOfYear3_Count}', '#{timeOfYear4_Count}', '#{varDimField1}', '#{varDimField1Val}', '#{varDimField2}', '#{varDimField2Val}', '#{varDimField3}', '#{varDimField3Val}', '#{varDimField4}', '#{varDimField4Val}', '#{varDimField5}', '#{varDimField5Val}', '#{varDimField6}', '#{varDimField6Val}', '#{varSegmField1}', '#{varSegmField1Val}', '#{varSegmField2}', '#{varSegmField2Val}', '#{varSegmField3}', '#{varSegmField3Val}', '#{varSegmField4}', '#{varSegmField4Val}', '#{varSegmField5}', '#{varSegmField5Val}', '#{varSegmField6}', '#{varSegmField6Val}', '#{codeMap}', '#{peineNotas5}', '#{peineNotas4}', '#{peineNotas3}', '#{peineNotas2}', '#{peineNotas1}', '#{varLangField01}', '#{varLangField01Val}', '#{varLangField02}', '#{varLangField02Val}', '#{varLangField03}', '#{varLangField03Val}', '#{varLangField04}', '#{varLangField04Val}', '#{varLangField05}', '#{varLangField05Val}', '#{varLangField06}', '#{varLangField06Val}', '#{varLangField07}', '#{varLangField07Val}', '#{varLangField08}', '#{varLangField08Val}', '#{varLangField09}', '#{varLangField09Val}', '#{varLangField10}', '#{varLangField10Val}', '#{varLangField11}', '#{varLangField11Val}', '#{varLangField12}', '#{varLangField12Val}', '#{varLangField13}', '#{varLangField13Val}', '#{varLangField14}', '#{varLangField14Val}', '#{varLangField15}', '#{varLangField15Val}', '#{varLangField16}', '#{varLangField16Val}', '#{varLangField17}', '#{varLangField17Val}', '#{varLangField18}', '#{varLangField18Val}', '#{varLangField19}', '#{varLangField19Val}', '#{varLangField20}', '#{varLangField20Val}', '#{varLangField21}', '#{varLangField21Val}', '#{varLangField22}', '#{varLangField22Val}', '#{varLangField23}', '#{varLangField23Val}', '#{varLangField24}', '#{varLangField24Val}', '#{varLangField25}', '#{varLangField25Val}', '#{varLangField26}', '#{varLangField26Val}', '#{varLangField27}', '#{varLangField27Val}', '#{varLangField28}', '#{varLangField28Val}', '#{varLangField29}', '#{varLangField29Val}', '#{varLangField30}', '#{varLangField30Val}', '#{placeName2}', '#{fullAddress2}', '#{globalScore2}', '#{reviewCount2}', '#{breadcrums}', '#{h11}', '#{h12}'"  +
                        ")"
            puts(sqlInsert)
  ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    
            con.query(sqlInsert)
          end
        elsif descripcion.include? 'TRIPADVISOR_HotelFicha.'

          posNode = 0
#INTRODUCIR PATH COLECCIÓN ITEMS
          nodes = @browser.divs(:xpath, "/*")
        
          puts("Node count: #{nodes.size}")
          nodes.each do |node|
            posNode += 1
                     
            captura = ""
            numPag = 0
            urlCaptura = ""
            fechaHora = ""
            numEntrada = 0
      
            placeName = ""
            titulo = ""
            award_text = ""
            award_class = ""
            certificadoExcelencia = ""
            fullAddress = ""
            postalCode = ""
            locality = ""
            phone = ""
            placeRating = ""
            globalScore = ""
            reviewCount = ""
            infoRanking = ""
            placeType = ""
            geoLat = ""
            geoLng = ""
            linkPrimeraReview = ""
            currentPage = ""
            cuisine = ""
            langList = ""
            langSelected = ""
            segmSelected = ""
            filterSegment = ""
            filterCount = ""
            langFromRadioButtons = ""
            recommendedPercent2 = ""
            sorting = ""
            value5_Count = ""
            value4_Count = ""
            value3_Count = ""
            value2_Count = ""
            value1_Count = ""
            timeOfYear1_Count = ""
            timeOfYear2_Count = ""
            timeOfYear3_Count = ""
            timeOfYear4_Count = ""
            varDimField1 = ""
            varDimField1Val = ""
            varDimField2 = ""
            varDimField2Val = ""
            varDimField3 = ""
            varDimField3Val = ""
            varDimField4 = ""
            varDimField4Val = ""
            varDimField5 = ""
            varDimField5Val = ""
            varDimField6 = ""
            varDimField6Val = ""
            varDimField7 = ""
            varDimField7Val = ""
            varDimField8 = ""
            varDimField8Val = ""
            varDimField9 = ""
            varDimField9Val = ""
            varDimField10 = ""
            varDimField10Val = ""
            varDimField11 = ""
            varDimField11Val = ""
            varDimField12 = ""
            varDimField12Val = ""
            varSegmField1 = ""
            varSegmField1Val = ""
            varSegmField2 = ""
            varSegmField2Val = ""
            varSegmField3 = ""
            varSegmField3Val = ""
            varSegmField4 = ""
            varSegmField4Val = ""
            varSegmField5 = ""
            varSegmField5Val = ""
            varSegmField6 = ""
            varSegmField6Val = ""
            codeMap = ""
            peineNotas5 = ""
            peineNotas4 = ""
            peineNotas3 = ""
            peineNotas2 = ""
            peineNotas1 = ""
            varLangField01 = ""
            varLangField01Val = ""
            varLangField02 = ""
            varLangField02Val = ""
            varLangField03 = ""
            varLangField03Val = ""
            varLangField04 = ""
            varLangField04Val = ""
            varLangField05 = ""
            varLangField05Val = ""
            varLangField06 = ""
            varLangField06Val = ""
            varLangField07 = ""
            varLangField07Val = ""
            varLangField08 = ""
            varLangField08Val = ""
            varLangField09 = ""
            varLangField09Val = ""
            varLangField10 = ""
            varLangField10Val = ""
            varLangField11 = ""
            varLangField11Val = ""
            varLangField12 = ""
            varLangField12Val = ""
            varLangField13 = ""
            varLangField13Val = ""
            varLangField14 = ""
            varLangField14Val = ""
            varLangField15 = ""
            varLangField15Val = ""
            varLangField16 = ""
            varLangField16Val = ""
            varLangField17 = ""
            varLangField17Val = ""
            varLangField18 = ""
            varLangField18Val = ""
            varLangField19 = ""
            varLangField19Val = ""
            varLangField20 = ""
            varLangField20Val = ""
            varLangField21 = ""
            varLangField21Val = ""
            varLangField22 = ""
            varLangField22Val = ""
            varLangField23 = ""
            varLangField23Val = ""
            varLangField24 = ""
            varLangField24Val = ""
            varLangField25 = ""
            varLangField25Val = ""
            varLangField26 = ""
            varLangField26Val = ""
            varLangField27 = ""
            varLangField27Val = ""
            varLangField28 = ""
            varLangField28Val = ""
            varLangField29 = ""
            varLangField29Val = ""
            varLangField30 = ""
            varLangField30Val = ""
            langSelected2 = ""
            nom = ""
            varDomField1 = ""
            varDomField1Val = ""
            varDomField2 = ""
            varDomField2Val = ""
            varDomField3 = ""
            varDomField3Val = ""
            varDomField4 = ""
            varDomField4Val = ""
            varDomField5 = ""
            varDomField5Val = ""
            varDomField6 = ""
            varDomField6Val = ""
            varDomField7 = ""
            varDomField7Val = ""
            varDomField8 = ""
            varDomField8Val = ""
            varDamField1 = ""
            varDamField1Val = ""
            varDamField2 = ""
            varDamField2Val = ""
            varDamField3 = ""
            varDamField3Val = ""
            varDamField4 = ""
            varDamField4Val = ""
            varDamField5 = ""
            varDamField5Val = ""
            varDamField6 = ""
            varDamField6Val = ""
            placeName2 = ""
            fullAddress2 = ""
            globalScore2 = ""
            reviewCount2 = ""
            breadcrums = ""
            h11 = ""
            h12 = ""
            recommendedPercent = ""
            recommendedType = ""
            certificado = ""
            langCol1 = ""
            langCol2 = ""
            langCol3 = ""
            langMoreBox01 = ""
            langMoreBox02 = ""
            langMoreBox03 = ""
            langMoreBox04 = ""
            langMoreBox05 = ""
            langMoreBox06 = ""
            langMoreBox07 = ""
            langMoreBox08 = ""
            langMoreBox09 = ""
            langMoreBox10 = ""
            langMoreBox11 = ""
            langMoreBox12 = ""
            langMoreBox13 = ""
            langMoreBox14 = ""
            langMoreBox15 = ""
            langMoreBox16 = ""
            langMoreBox17 = ""
            langMoreBox18 = ""
            langMoreBox19 = ""
            gmaploc = ""



  
            ignore_exception { captura = "#{descripcion}" }
            ignore_exception { urlOrig = "#{urlOrig}" }
            ignore_exception { idLaunch = "#{idLaunch}" }
            ignore_exception { idCaptura = "#{idCaptura}" }
            ignore_exception { numPag = "#{page}" }
            ignore_exception { urlCaptura = @browser.url }
            ignore_exception { fechaHora = "#{strDT}" }
            ignore_exception { numEntrada = "#{posNode}" }
            
            ignore_exception { placeName = con.quote(node.element(:xpath,"//*[@id='HEADING'] | //h1[contains(@class,'propertyHeading')]").text) }
            ignore_exception { titulo = con.quote(node.element(:xpath,"//title").text) }
            ignore_exception { award_text = con.quote(node.element(:xpath,"(//img[contains(@class,'Award')])[1]").attribute_value('alt')) }
            ignore_exception { award_class = con.quote(node.element(:xpath,"(//img[contains(@class,'Award')])[1]").attribute_value('class')) }
            ignore_exception { certificadoExcelencia = con.quote(node.element(:xpath,"//*[@data-tab='TABS_OVERVIEW' or @data-tab='TABS_ABOUT']//*[starts-with(@class,'ui_icon certificate-of-excellence')]/..").text) }
            ignore_exception { fullAddress = con.quote(node.element(:xpath,"(.//*[contains(./@class,'blEntry address')] | .//*[contains(./@class,'public-business-listing-ContactInfo')] | //address)[1]").text) }
            ignore_exception { postalCode = con.quote(node.element(:xpath,"(//span[@class='locality'])[1]").text) }
            ignore_exception { locality = con.quote(node.element(:xpath,"(//span[@class='locality'])[1]").text) }
            ignore_exception { phone = con.quote(node.element(:xpath,"//*[contains(@class,'ui_icon phone')]/following-sibling::*[1]").text) }
            ignore_exception { placeRating = con.quote(node.element(:xpath,"//*[contains(@class,'GoodToKnow')]//*[contains(@class,'ui_star_rating')]").attribute_value('class')) }
            ignore_exception { globalScore = con.quote(node.element(:xpath,"//*[@class='ratingContainer' or contains(@id,'header')]//span[contains(@class,'bubble_rating')]").attribute_value('class')) }
            if globalScore==''
              ignore_exception { globalScore = con.quote(node.element(:xpath,"//div[contains(@class,'header')]//span[contains(@class,'ui_bubble_rating')]").attribute_value('class')) }
            end
            ignore_exception { reviewCount = con.quote(node.element(:xpath,"//*[contains(@class,'ratingContainer')]//*[contains(@class,'reviewCount')] | //*[@class='ratingContainer' or contains(@id,'header')]//*[contains(@class,'reviewCount')]").text) }
            ignore_exception { infoRanking = con.quote(node.element(:xpath,"//div[contains(@class,'hotels-hotel-review-atf-info-parts-PopIndex__')]").text) }
            ignore_exception { placeType = con.quote(node.element(:xpath,"//*[@class='placeTypeText']").text) }
            ignore_exception { geoLat = con.quote(node.element(:xpath,"//*[contains(@class,'mapContainer')]").attribute_value('data-lat')) }
            ignore_exception { geoLng = con.quote(node.element(:xpath,"//*[contains(@class,'mapContainer')]").attribute_value('data-lng')) }
            ignore_exception { linkPrimeraReview = con.quote(node.element(:xpath,"(//*[contains(@id,'community_content')]//*[contains(@href,'ShowUserReviews')])[1]").attribute_value('href')) }
            ignore_exception { currentPage = con.quote(node.element(:xpath,".//*[@class='pageNum current']").text) }
            ignore_exception { cuisine = con.quote(node.element(:xpath,"//*[starts-with(@class,'header_links')]").text) }
            ignore_exception { langList = con.quote(node.element(:xpath,"//*[@id='filterLang']/option").attribute_value('value')) }
            ignore_exception { langSelected = con.quote(node.element(:xpath,".//*[@id='filterControls']//*[contains(@class,'language')]/ul/li[./span/input/@checked]/label").text) }
            ignore_exception { segmSelected = con.quote(node.element(:xpath,".//*[@id='filterControls']//*[contains(@class,'segment')]/ul/li[./span/input/@checked]/label").text) }
            ignore_exception { filterSegment = con.quote(node.element(:xpath,"//span[@class='filter']").text) }
            ignore_exception { filterCount = con.quote(node.element(:xpath,"//span[@class='filter']/preceding-sibling::b[1]").text) }
            ignore_exception { langFromRadioButtons = con.quote(node.element(:xpath,".//*[contains(@class,'language')]/ul/li[./span/input/@checked]/label").text) }
            ignore_exception { recommendedPercent2 = con.quote(node.element(:xpath,"//fieldset[@class='review_filter_eatery']/div/div[1]/div").text) }
            ignore_exception { sorting = con.quote(node.element(:xpath,"//fieldset/span[contains(@class,'selected')]").text) }
            ignore_exception { value5_Count = con.quote(node.element(:xpath,"//*[@for='ReviewRatingFilter_5' or @for='filters_detail_checkbox_trating__5']/../span[contains(@class,'row_num')]").text) }
            ignore_exception { value4_Count = con.quote(node.element(:xpath,"//*[@for='ReviewRatingFilter_4' or @for='filters_detail_checkbox_trating__4']/../span[contains(@class,'row_num')]").text) }
            ignore_exception { value3_Count = con.quote(node.element(:xpath,"//*[@for='ReviewRatingFilter_3' or @for='filters_detail_checkbox_trating__3']/../span[contains(@class,'row_num')]").text) }
            ignore_exception { value2_Count = con.quote(node.element(:xpath,"//*[@for='ReviewRatingFilter_2' or @for='filters_detail_checkbox_trating__2']/../span[contains(@class,'row_num')]").text) }
            ignore_exception { value1_Count = con.quote(node.element(:xpath,"//*[@for='ReviewRatingFilter_1' or @for='filters_detail_checkbox_trating__1']/../span[contains(@class,'row_num')]").text) }
            ignore_exception { timeOfYear1_Count = con.quote(node.element(:xpath,"//*[starts-with(@class,'col season')]/ul/li[1]/label").text) }
            ignore_exception { timeOfYear2_Count = con.quote(node.element(:xpath,"//*[starts-with(@class,'col season')]/ul/li[2]/label").text) }
            ignore_exception { timeOfYear3_Count = con.quote(node.element(:xpath,"//*[starts-with(@class,'col season')]/ul/li[3]/label").text) }
            ignore_exception { timeOfYear4_Count = con.quote(node.element(:xpath,"//*[starts-with(@class,'col season')]/ul/li[4]/label").text) }
            ignore_exception { varDimField1 = con.quote(node.element(:xpath,"(//div[contains(@class,'subratingRow')])[1]/div[2]").text) }
            ignore_exception { varDimField1Val = con.quote(node.element(:xpath,"(//div[contains(@class,'subratingRow')])[1]/div[1]/span").attribute_value('class')) }
            ignore_exception { varDimField2 = con.quote(node.element(:xpath,"(//div[contains(@class,'subratingRow')])[2]/div[2]").text) }
            ignore_exception { varDimField2Val = con.quote(node.element(:xpath,"(//div[contains(@class,'subratingRow')])[2]/div[1]/span").attribute_value('class')) }
            ignore_exception { varDimField3 = con.quote(node.element(:xpath,"(//div[contains(@class,'subratingRow')])[3]/div[2]").text) }
            ignore_exception { varDimField3Val = con.quote(node.element(:xpath,"(//div[contains(@class,'subratingRow')])[3]/div[1]/span").attribute_value('class')) }
            ignore_exception { varDimField4 = con.quote(node.element(:xpath,"(//div[contains(@class,'subratingRow')])[4]/div[2]").text) }
            ignore_exception { varDimField4Val = con.quote(node.element(:xpath,"(//div[contains(@class,'subratingRow')])[4]/div[1]/span").attribute_value('class')) }
            ignore_exception { varDimField5 = con.quote(node.element(:xpath,"(//div[contains(@class,'subratingRow')])[5]/div[2]").text) }
            ignore_exception { varDimField5Val = con.quote(node.element(:xpath,"(//div[contains(@class,'subratingRow')])[5]/div[1]/span").attribute_value('class')) }
            ignore_exception { varDimField6 = con.quote(node.element(:xpath,"(//div[contains(@class,'subratingRow')])[6]/div[2]").text) }
            ignore_exception { varDimField6Val = con.quote(node.element(:xpath,"(//div[contains(@class,'subratingRow')])[6]/div[1]/span").attribute_value('class')) }
            ignore_exception { varDimField7 = con.quote(node.element(:xpath,"(//div[contains(@class,'subratingRow')])[7]").text) }
            ignore_exception { varDimField7Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[7]").attribute_value('alt')) }
            ignore_exception { varDimField8 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[8]").text) }
            ignore_exception { varDimField8Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[8]").attribute_value('alt')) }
            ignore_exception { varDimField9 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[9]").text) }
            ignore_exception { varDimField9Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[9]").attribute_value('alt')) }
            ignore_exception { varDimField10 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[10]").text) }
            ignore_exception { varDimField10Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[10]").attribute_value('alt')) }
            ignore_exception { varDimField11 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[11]").text) }
            ignore_exception { varDimField11Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[11]").attribute_value('alt')) }
            ignore_exception { varDimField12 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[12]").text) }
            ignore_exception { varDimField12Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[12]").attribute_value('alt')) }
            ignore_exception { varSegmField1 = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[1]/div/div[1]").text) }
            ignore_exception { varSegmField1Val = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[1]/div/div[2]").text) }
            ignore_exception { varSegmField2 = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[2]/div/div[1]").text) }
            ignore_exception { varSegmField2Val = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[2]/div/div[2]").text) }
            ignore_exception { varSegmField3 = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[3]/div/div[1]").text) }
            ignore_exception { varSegmField3Val = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[3]/div/div[2]").text) }
            ignore_exception { varSegmField4 = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[4]/div/div[1]").text) }
            ignore_exception { varSegmField4Val = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[4]/div/div[2]").text) }
            ignore_exception { varSegmField5 = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[5]/div/div[1]").text) }
            ignore_exception { varSegmField5Val = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[5]/div/div[2]").text) }
            ignore_exception { varSegmField6 = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[6]/div/div[1]").text) }
            ignore_exception { varSegmField6Val = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[6]/div/div[2]").text) }
            ignore_exception { codeMap = con.quote(node.element(:xpath,"//*[contains(@src,'center=')]").attribute_value('src')) }
            ignore_exception { peineNotas5 = con.quote(node.element(:xpath,"(//*[contains(text(),'ler rating')]/..//input[1])[1]").attribute_value('checked')) }
            ignore_exception { peineNotas4 = con.quote(node.element(:xpath,"(//*[contains(text(),'ler rating')]/..//input[1])[2]").attribute_value('checked')) }
            ignore_exception { peineNotas3 = con.quote(node.element(:xpath,"(//*[contains(text(),'ler rating')]/..//input[1])[3]").attribute_value('checked')) }
            ignore_exception { peineNotas2 = con.quote(node.element(:xpath,"(//*[contains(text(),'ler rating')]/..//input[1])[4]").attribute_value('checked')) }
            ignore_exception { peineNotas1 = con.quote(node.element(:xpath,"(//*[contains(text(),'ler rating')]/..//input[1])[5]").attribute_value('checked')) }
            ignore_exception { varLangField01 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[01]").attribute_value('value')) }
            ignore_exception { varLangField01Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[01]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField02 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[02]").attribute_value('value')) }
            ignore_exception { varLangField02Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[02]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField03 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[03]").attribute_value('value')) }
            ignore_exception { varLangField03Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[03]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField04 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[04]").attribute_value('value')) }
            ignore_exception { varLangField04Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[04]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField05 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[05]").attribute_value('value')) }
            ignore_exception { varLangField05Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[05]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField06 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[06]").attribute_value('value')) }
            ignore_exception { varLangField06Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[06]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField07 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[07]").attribute_value('value')) }
            ignore_exception { varLangField07Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[07]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField08 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[08]").attribute_value('value')) }
            ignore_exception { varLangField08Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[08]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField09 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[09]").attribute_value('value')) }
            ignore_exception { varLangField09Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[09]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField10 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[10]").attribute_value('value')) }
            ignore_exception { varLangField10Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[10]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField11 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[11]").attribute_value('value')) }
            ignore_exception { varLangField11Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[11]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField12 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[12]").attribute_value('value')) }
            ignore_exception { varLangField12Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[12]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField13 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[13]").attribute_value('value')) }
            ignore_exception { varLangField13Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[13]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField14 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[14]").attribute_value('value')) }
            ignore_exception { varLangField14Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[14]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField15 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[15]").attribute_value('value')) }
            ignore_exception { varLangField15Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[15]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField16 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[16]").attribute_value('value')) }
            ignore_exception { varLangField16Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[16]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField17 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[17]").attribute_value('value')) }
            ignore_exception { varLangField17Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[17]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField18 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[18]").attribute_value('value')) }
            ignore_exception { varLangField18Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[18]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField19 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[19]").attribute_value('value')) }
            ignore_exception { varLangField19Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[19]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField20 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[20]").attribute_value('value')) }
            ignore_exception { varLangField20Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[20]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField21 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[21]").attribute_value('value')) }
            ignore_exception { varLangField21Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[21]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField22 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[22]").attribute_value('value')) }
            ignore_exception { varLangField22Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[22]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField23 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[23]").attribute_value('value')) }
            ignore_exception { varLangField23Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[23]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField24 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[24]").attribute_value('value')) }
            ignore_exception { varLangField24Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[24]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField25 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[25]").attribute_value('value')) }
            ignore_exception { varLangField25Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[25]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField26 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[26]").attribute_value('value')) }
            ignore_exception { varLangField26Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[26]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField27 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[27]").attribute_value('value')) }
            ignore_exception { varLangField27Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[27]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField28 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[28]").attribute_value('value')) }
            ignore_exception { varLangField28Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[28]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField29 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[29]").attribute_value('value')) }
            ignore_exception { varLangField29Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[29]/..//following-sibling::label[1]").text) }
            ignore_exception { varLangField30 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[30]").attribute_value('value')) }
            ignore_exception { varLangField30Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[30]/..//following-sibling::label[1]").text) }
            ignore_exception { langSelected2 = con.quote(node.element(:xpath,"//*[@data-name='language']/div[./input/@checked]/label").text) }
            ignore_exception { nom = con.quote(node.element(:xpath,"(//li[contains(@class,'breadcrumb')])[last()]").text) }
            ignore_exception { varDomField1 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[1]").text) }
            ignore_exception { varDomField1Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[1]").attribute_value('alt')) }
            ignore_exception { varDomField2 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[2]").text) }
            ignore_exception { varDomField2Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[2]").attribute_value('alt')) }
            ignore_exception { varDomField3 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[3]").text) }
            ignore_exception { varDomField3Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[3]").attribute_value('alt')) }
            ignore_exception { varDomField4 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[4]").text) }
            ignore_exception { varDomField4Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[4]").attribute_value('alt')) }
            ignore_exception { varDomField5 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[5]").text) }
            ignore_exception { varDomField5Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[5]").attribute_value('alt')) }
            ignore_exception { varDomField6 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[6]").text) }
            ignore_exception { varDomField6Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[6]").attribute_value('alt')) }
            ignore_exception { varDomField7 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[7]").text) }
            ignore_exception { varDomField7Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[7]").attribute_value('alt')) }
            ignore_exception { varDomField8 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[8]").text) }
            ignore_exception { varDomField8Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[8]").attribute_value('alt')) }
            ignore_exception { varDamField1 = con.quote(node.element(:xpath,"//*[contains(@class,'questionRatings')]/div[2]/span[2]").text) }
            ignore_exception { varDamField1Val = con.quote(node.element(:xpath,"//*[contains(@class,'questionRatings')]/div[2]/span[1]").attribute_value('class')) }
            ignore_exception { varDamField2 = con.quote(node.element(:xpath,"//*[contains(@class,'questionRatings')]/div[3]/span[2]").text) }
            ignore_exception { varDamField2Val = con.quote(node.element(:xpath,"//*[contains(@class,'questionRatings')]/div[3]/span[1]").attribute_value('class')) }
            ignore_exception { varDamField3 = con.quote(node.element(:xpath,"//*[contains(@class,'questionRatings')]/div[4]/span[2]").text) }
            ignore_exception { varDamField3Val = con.quote(node.element(:xpath,"//*[contains(@class,'questionRatings')]/div[4]/span[1]").attribute_value('class')) }
            ignore_exception { varDamField4 = con.quote(node.element(:xpath,"//*[contains(@class,'questionRatings')]/div[5]/span[2]").text) }
            ignore_exception { varDamField4Val = con.quote(node.element(:xpath,"//*[contains(@class,'questionRatings')]/div[5]/span[1]").attribute_value('class')) }
            ignore_exception { varDamField5 = con.quote(node.element(:xpath,"//*[contains(@class,'questionRatings')]/div[6]/span[2]").text) }
            ignore_exception { varDamField5Val = con.quote(node.element(:xpath,"//*[contains(@class,'questionRatings')]/div[6]/span[1]").attribute_value('class')) }
            ignore_exception { varDamField6 = con.quote(node.element(:xpath,"//*[contains(@class,'questionRatings')]/div[7]/span[2]").text) }
            ignore_exception { varDamField6Val = con.quote(node.element(:xpath,"//*[contains(@class,'questionRatings')]/div[7]/span[1]").attribute_value('class')) }
            ignore_exception { placeName2 = con.quote(node.element(:xpath,"//ul[@class='breadcrumbs']/li[last()]").text) }
            ignore_exception { fullAddress2 = con.quote(node.element(:xpath,"//*[contains(@class,'ContactCard__contactRow') and contains(./span/@class,'map-pin')]").text) }
            ignore_exception { globalScore2 = con.quote(node.element(:xpath,"//*[contains(@class,'CompanyProfileContainer')]//*[contains(@class,'bubble_rating')]").attribute_value('class')) }
            ignore_exception { reviewCount2 = con.quote(node.element(:xpath,"//span[@class='reviews_header_count']").text) }
            ignore_exception { breadcrums = con.quote(node.element(:xpath,"//ul[@class='breadcrums']").text) }
            ignore_exception { h11 = con.quote(node.element(:xpath,"(//h1)[1]").text) }
            ignore_exception { h12 = con.quote(node.element(:xpath,"(//h1)[2]").text) }
            ignore_exception { recommendedPercent = con.quote(node.element(:xpath,"//div[@class='locationContent']//div[@class='recommendedPercent']/span").text) }
            ignore_exception { recommendedType = con.quote(node.element(:xpath,"//div[@class='locationContent']//div[@class='recommendedPercent']/img").attribute_value('class')) }
            ignore_exception { certificado = con.quote(node.element(:xpath,".//*[@class='coeBadgeDiv']").text) }
            ignore_exception { langCol1 = con.quote(node.element(:xpath,"//*[starts-with(@class,'col language')]/ul/li[2]/label").text) }
            ignore_exception { langCol2 = con.quote(node.element(:xpath,"//*[starts-with(@class,'col language')]/ul/li[3]/label").text) }
            ignore_exception { langCol3 = con.quote(node.element(:xpath,"//*[starts-with(@class,'col language')]/ul/li[4]/label").text) }
            ignore_exception { langMoreBox01 = con.quote(node.element(:xpath,"(//li[./span/input/@name='filterLang_more']/label)[1]").text) }
            ignore_exception { langMoreBox02 = con.quote(node.element(:xpath,"(//li[./span/input/@name='filterLang_more']/label)[2]").text) }
            ignore_exception { langMoreBox03 = con.quote(node.element(:xpath,"(//li[./span/input/@name='filterLang_more']/label)[3]").text) }
            ignore_exception { langMoreBox04 = con.quote(node.element(:xpath,"(//li[./span/input/@name='filterLang_more']/label)[4]").text) }
            ignore_exception { langMoreBox05 = con.quote(node.element(:xpath,"(//li[./span/input/@name='filterLang_more']/label)[5]").text) }
            ignore_exception { langMoreBox06 = con.quote(node.element(:xpath,"(//li[./span/input/@name='filterLang_more']/label)[6]").text) }
            ignore_exception { langMoreBox07 = con.quote(node.element(:xpath,"(//li[./span/input/@name='filterLang_more']/label)[7]").text) }
            ignore_exception { langMoreBox08 = con.quote(node.element(:xpath,"(//li[./span/input/@name='filterLang_more']/label)[8]").text) }
            ignore_exception { langMoreBox09 = con.quote(node.element(:xpath,"(//li[./span/input/@name='filterLang_more']/label)[9]").text) }
            ignore_exception { langMoreBox10 = con.quote(node.element(:xpath,"(//li[./span/input/@name='filterLang_more']/label)[10]").text) }
            ignore_exception { langMoreBox11 = con.quote(node.element(:xpath,"(//li[./span/input/@name='filterLang_more']/label)[11]").text) }
            ignore_exception { langMoreBox12 = con.quote(node.element(:xpath,"(//li[./span/input/@name='filterLang_more']/label)[12]").text) }
            ignore_exception { langMoreBox13 = con.quote(node.element(:xpath,"(//li[./span/input/@name='filterLang_more']/label)[13]").text) }
            ignore_exception { langMoreBox14 = con.quote(node.element(:xpath,"(//li[./span/input/@name='filterLang_more']/label)[14]").text) }
            ignore_exception { langMoreBox15 = con.quote(node.element(:xpath,"(//li[./span/input/@name='filterLang_more']/label)[15]").text) }
            ignore_exception { langMoreBox16 = con.quote(node.element(:xpath,"(//li[./span/input/@name='filterLang_more']/label)[16]").text) }
            ignore_exception { langMoreBox17 = con.quote(node.element(:xpath,"(//li[./span/input/@name='filterLang_more']/label)[17]").text) }
            ignore_exception { langMoreBox18 = con.quote(node.element(:xpath,"(//li[./span/input/@name='filterLang_more']/label)[18]").text) }
            ignore_exception { langMoreBox19 = con.quote(node.element(:xpath,"(//li[./span/input/@name='filterLang_more']/label)[19]").text) }
            ignore_exception { gmaploc = con.quote(node.element(:xpath,"//a[contains(@href,'maps.google.com/maps')]").attribute_value('href')) }

            sqlInsert = "INSERT INTO `Navigator`.`tblDataTAFicha_ALO` (`captura`, `urlOrig`, `idLaunch`, `idCaptura`, `numPag`, `urlCaptura`, `fechaHora`, `numEntrada`, "  +
                        "`placeName`, `titulo`, `award_text`, `award_class`, `certificadoExcelencia`, `fullAddress`, `postalCode`, `locality`, `phone`, `placeRating`, `globalScore`, `reviewCount`, `infoRanking`, `placeType`, `geoLat`, `geoLng`, `linkPrimeraReview`, `currentPage`, `cuisine`, `langList`, `langSelected`, `segmSelected`, `filterSegment`, `filterCount`, `langFromRadioButtons`, `recommendedPercent2`, `sorting`, `value5_Count`, `value4_Count`, `value3_Count`, `value2_Count`, `value1_Count`, `timeOfYear1_Count`, `timeOfYear2_Count`, `timeOfYear3_Count`, `timeOfYear4_Count`, `varDimField1`, `varDimField1Val`, `varDimField2`, `varDimField2Val`, `varDimField3`, `varDimField3Val`, `varDimField4`, `varDimField4Val`, `varDimField5`, `varDimField5Val`, `varDimField6`, `varDimField6Val`, `varDimField7`, `varDimField7Val`, `varDimField8`, `varDimField8Val`, `varDimField9`, `varDimField9Val`, `varDimField10`, `varDimField10Val`, `varDimField11`, `varDimField11Val`, `varDimField12`, `varDimField12Val`, `varSegmField1`, `varSegmField1Val`, `varSegmField2`, `varSegmField2Val`, `varSegmField3`, `varSegmField3Val`, `varSegmField4`, `varSegmField4Val`, `varSegmField5`, `varSegmField5Val`, `varSegmField6`, `varSegmField6Val`, `codeMap`, `peineNotas5`, `peineNotas4`, `peineNotas3`, `peineNotas2`, `peineNotas1`, `varLangField01`, `varLangField01Val`, `varLangField02`, `varLangField02Val`, `varLangField03`, `varLangField03Val`, `varLangField04`, `varLangField04Val`, `varLangField05`, `varLangField05Val`, `varLangField06`, `varLangField06Val`, `varLangField07`, `varLangField07Val`, `varLangField08`, `varLangField08Val`, `varLangField09`, `varLangField09Val`, `varLangField10`, `varLangField10Val`, `varLangField11`, `varLangField11Val`, `varLangField12`, `varLangField12Val`, `varLangField13`, `varLangField13Val`, `varLangField14`, `varLangField14Val`, `varLangField15`, `varLangField15Val`, `varLangField16`, `varLangField16Val`, `varLangField17`, `varLangField17Val`, `varLangField18`, `varLangField18Val`, `varLangField19`, `varLangField19Val`, `varLangField20`, `varLangField20Val`, `varLangField21`, `varLangField21Val`, `varLangField22`, `varLangField22Val`, `varLangField23`, `varLangField23Val`, `varLangField24`, `varLangField24Val`, `varLangField25`, `varLangField25Val`, `varLangField26`, `varLangField26Val`, `varLangField27`, `varLangField27Val`, `varLangField28`, `varLangField28Val`, `varLangField29`, `varLangField29Val`, `varLangField30`, `varLangField30Val`, `langSelected2`, `nom`, `varDomField1`, `varDomField1Val`, `varDomField2`, `varDomField2Val`, `varDomField3`, `varDomField3Val`, `varDomField4`, `varDomField4Val`, `varDomField5`, `varDomField5Val`, `varDomField6`, `varDomField6Val`, `varDomField7`, `varDomField7Val`, `varDomField8`, `varDomField8Val`, `varDamField1`, `varDamField1Val`, `varDamField2`, `varDamField2Val`, `varDamField3`, `varDamField3Val`, `varDamField4`, `varDamField4Val`, `varDamField5`, `varDamField5Val`, `varDamField6`, `varDamField6Val`, `placeName2`, `fullAddress2`, `globalScore2`, `reviewCount2`, `breadcrums`, `h1-1`, `h1-2`, `recommendedPercent`, `recommendedType`, `certificado`, `langCol1`, `langCol2`, `langCol3`, `langMoreBox01`, `langMoreBox02`, `langMoreBox03`, `langMoreBox04`, `langMoreBox05`, `langMoreBox06`, `langMoreBox07`, `langMoreBox08`, `langMoreBox09`, `langMoreBox10`, `langMoreBox11`, `langMoreBox12`, `langMoreBox13`, `langMoreBox14`, `langMoreBox15`, `langMoreBox16`, `langMoreBox17`, `langMoreBox18`, `langMoreBox19`, `gmaploc` "  +
                        ") VALUES ('#{captura}', '#{urlOrig}', '#{idLaunch}', '#{idCaptura}', '#{numPag}', '#{urlCaptura}', '#{fechaHora}', '#{numEntrada}', "  +
                        "'#{placeName}', '#{titulo}', '#{award_text}', '#{award_class}', '#{certificadoExcelencia}', '#{fullAddress}', '#{postalCode}', '#{locality}', '#{phone}', '#{placeRating}', '#{globalScore}', '#{reviewCount}', '#{infoRanking}', '#{placeType}', '#{geoLat}', '#{geoLng}', '#{linkPrimeraReview}', '#{currentPage}', '#{cuisine}', '#{langList}', '#{langSelected}', '#{segmSelected}', '#{filterSegment}', '#{filterCount}', '#{langFromRadioButtons}', '#{recommendedPercent2}', '#{sorting}', '#{value5_Count}', '#{value4_Count}', '#{value3_Count}', '#{value2_Count}', '#{value1_Count}', '#{timeOfYear1_Count}', '#{timeOfYear2_Count}', '#{timeOfYear3_Count}', '#{timeOfYear4_Count}', '#{varDimField1}', '#{varDimField1Val}', '#{varDimField2}', '#{varDimField2Val}', '#{varDimField3}', '#{varDimField3Val}', '#{varDimField4}', '#{varDimField4Val}', '#{varDimField5}', '#{varDimField5Val}', '#{varDimField6}', '#{varDimField6Val}', '#{varDimField7}', '#{varDimField7Val}', '#{varDimField8}', '#{varDimField8Val}', '#{varDimField9}', '#{varDimField9Val}', '#{varDimField10}', '#{varDimField10Val}', '#{varDimField11}', '#{varDimField11Val}', '#{varDimField12}', '#{varDimField12Val}', '#{varSegmField1}', '#{varSegmField1Val}', '#{varSegmField2}', '#{varSegmField2Val}', '#{varSegmField3}', '#{varSegmField3Val}', '#{varSegmField4}', '#{varSegmField4Val}', '#{varSegmField5}', '#{varSegmField5Val}', '#{varSegmField6}', '#{varSegmField6Val}', '#{codeMap}', '#{peineNotas5}', '#{peineNotas4}', '#{peineNotas3}', '#{peineNotas2}', '#{peineNotas1}', '#{varLangField01}', '#{varLangField01Val}', '#{varLangField02}', '#{varLangField02Val}', '#{varLangField03}', '#{varLangField03Val}', '#{varLangField04}', '#{varLangField04Val}', '#{varLangField05}', '#{varLangField05Val}', '#{varLangField06}', '#{varLangField06Val}', '#{varLangField07}', '#{varLangField07Val}', '#{varLangField08}', '#{varLangField08Val}', '#{varLangField09}', '#{varLangField09Val}', '#{varLangField10}', '#{varLangField10Val}', '#{varLangField11}', '#{varLangField11Val}', '#{varLangField12}', '#{varLangField12Val}', '#{varLangField13}', '#{varLangField13Val}', '#{varLangField14}', '#{varLangField14Val}', '#{varLangField15}', '#{varLangField15Val}', '#{varLangField16}', '#{varLangField16Val}', '#{varLangField17}', '#{varLangField17Val}', '#{varLangField18}', '#{varLangField18Val}', '#{varLangField19}', '#{varLangField19Val}', '#{varLangField20}', '#{varLangField20Val}', '#{varLangField21}', '#{varLangField21Val}', '#{varLangField22}', '#{varLangField22Val}', '#{varLangField23}', '#{varLangField23Val}', '#{varLangField24}', '#{varLangField24Val}', '#{varLangField25}', '#{varLangField25Val}', '#{varLangField26}', '#{varLangField26Val}', '#{varLangField27}', '#{varLangField27Val}', '#{varLangField28}', '#{varLangField28Val}', '#{varLangField29}', '#{varLangField29Val}', '#{varLangField30}', '#{varLangField30Val}', '#{langSelected2}', '#{nom}', '#{varDomField1}', '#{varDomField1Val}', '#{varDomField2}', '#{varDomField2Val}', '#{varDomField3}', '#{varDomField3Val}', '#{varDomField4}', '#{varDomField4Val}', '#{varDomField5}', '#{varDomField5Val}', '#{varDomField6}', '#{varDomField6Val}', '#{varDomField7}', '#{varDomField7Val}', '#{varDomField8}', '#{varDomField8Val}', '#{varDamField1}', '#{varDamField1Val}', '#{varDamField2}', '#{varDamField2Val}', '#{varDamField3}', '#{varDamField3Val}', '#{varDamField4}', '#{varDamField4Val}', '#{varDamField5}', '#{varDamField5Val}', '#{varDamField6}', '#{varDamField6Val}', '#{placeName2}', '#{fullAddress2}', '#{globalScore2}', '#{reviewCount2}', '#{breadcrums}', '#{h11}', '#{h12}', '#{recommendedPercent}', '#{recommendedType}', '#{certificado}', '#{langCol1}', '#{langCol2}', '#{langCol3}', '#{langMoreBox01}', '#{langMoreBox02}', '#{langMoreBox03}', '#{langMoreBox04}', '#{langMoreBox05}', '#{langMoreBox06}', '#{langMoreBox07}', '#{langMoreBox08}', '#{langMoreBox09}', '#{langMoreBox10}', '#{langMoreBox11}', '#{langMoreBox12}', '#{langMoreBox13}', '#{langMoreBox14}', '#{langMoreBox15}', '#{langMoreBox16}', '#{langMoreBox17}', '#{langMoreBox18}', '#{langMoreBox19}', '#{gmaploc}'"  +
                        ")"
            puts(sqlInsert)
  ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    
            con.query(sqlInsert)
          end

        elsif descripcion.include? 'TRIPADVISOR_AtraccFicha.'

          posNode = 0
#INTRODUCIR PATH COLECCIÓN ITEMS
          nodes = @browser.divs(:xpath, "/*")
        
          puts("Node count: #{nodes.size}")
          nodes.each do |node|
            posNode += 1
                     
            captura = ""
            numPag = 0
            urlCaptura = ""
            fechaHora = ""
            numEntrada = 0



      placeName = ""
      award_text = ""
      award_class = ""
      certificadoExcelencia = ""
      fullAddress = ""
      postalCode = ""
      locality = ""
      phone = ""
      placeRating = ""
      globalScore = ""
      reviewCount = ""
      infoRanking = ""
      placeType = ""
      geoLat = ""
      geoLng = ""
      linkPrimeraReview = ""
      currentPage = ""
      placeType2 = ""
      langList = ""
      langSelected = ""
      segmSelected = ""
      filterSegment = ""
      filterCount = ""
      langFromRadioButtons = ""
      recommendedPercent2 = ""
      sorting = ""
      value5_Count = ""
      value4_Count = ""
      value3_Count = ""
      value2_Count = ""
      value1_Count = ""
      timeOfYear1_Count = ""
      timeOfYear2_Count = ""
      timeOfYear3_Count = ""
      timeOfYear4_Count = ""
      varDimField1 = ""
      varDimField1Val = ""
      varDimField2 = ""
      varDimField2Val = ""
      varDimField3 = ""
      varDimField3Val = ""
      varDimField4 = ""
      varDimField4Val = ""
      varDimField5 = ""
      varDimField5Val = ""
      varDimField6 = ""
      varDimField6Val = ""
      varDimField7 = ""
      varDimField7Val = ""
      varDimField8 = ""
      varDimField8Val = ""
      varDimField9 = ""
      varDimField9Val = ""
      varDimField10 = ""
      varDimField10Val = ""
      varDimField11 = ""
      varDimField11Val = ""
      varDimField12 = ""
      varDimField12Val = ""
      varSegmField1 = ""
      varSegmField1Val = ""
      varSegmField2 = ""
      varSegmField2Val = ""
      varSegmField3 = ""
      varSegmField3Val = ""
      varSegmField4 = ""
      varSegmField4Val = ""
      varSegmField5 = ""
      varSegmField5Val = ""
      varSegmField6 = ""
      varSegmField6Val = ""
      codeMap = ""
      peineNotas5 = ""
      peineNotas4 = ""
      peineNotas3 = ""
      peineNotas2 = ""
      peineNotas1 = ""
      varLangField01 = ""
      varLangField01Val = ""
      varLangField02 = ""
      varLangField02Val = ""
      varLangField03 = ""
      varLangField03Val = ""
      varLangField04 = ""
      varLangField04Val = ""
      varLangField05 = ""
      varLangField05Val = ""
      varLangField06 = ""
      varLangField06Val = ""
      varLangField07 = ""
      varLangField07Val = ""
      varLangField08 = ""
      varLangField08Val = ""
      varLangField09 = ""
      varLangField09Val = ""
      varLangField10 = ""
      varLangField10Val = ""
      varLangField11 = ""
      varLangField11Val = ""
      varLangField12 = ""
      varLangField12Val = ""
      varLangField13 = ""
      varLangField13Val = ""
      varLangField14 = ""
      varLangField14Val = ""
      varLangField15 = ""
      varLangField15Val = ""
      varLangField16 = ""
      varLangField16Val = ""
      varLangField17 = ""
      varLangField17Val = ""
      varLangField18 = ""
      varLangField18Val = ""
      varLangField19 = ""
      varLangField19Val = ""
      varLangField20 = ""
      varLangField20Val = ""
      varLangField21 = ""
      varLangField21Val = ""
      varLangField22 = ""
      varLangField22Val = ""
      varLangField23 = ""
      varLangField23Val = ""
      varLangField24 = ""
      varLangField24Val = ""
      varLangField25 = ""
      varLangField25Val = ""
      varLangField26 = ""
      varLangField26Val = ""
      varLangField27 = ""
      varLangField27Val = ""
      varLangField28 = ""
      varLangField28Val = ""
      varLangField29 = ""
      varLangField29Val = ""
      varLangField30 = ""
      varLangField30Val = ""
      placeName2 = ""
      fullAddress2 = ""
      globalScore2 = ""
      reviewCount2 = ""
      breadcrums = ""
      h11 = ""
      h12 = ""

            
  


  
            ignore_exception { captura = "#{descripcion}" }
            ignore_exception { urlOrig = "#{urlOrig}" }
            ignore_exception { idLaunch = "#{idLaunch}" }
            ignore_exception { idCaptura = "#{idCaptura}" }
            ignore_exception { numPag = "#{page}" }
            ignore_exception { urlCaptura = @browser.url }
            ignore_exception { fechaHora = "#{strDT}" }
            ignore_exception { numEntrada = "#{posNode}" }
      
          ignore_exception { placeName = con.quote(node.element(:xpath,"//*[@id='HEADING']").text) }
          ignore_exception { award_text = con.quote(node.element(:xpath,"(//img[contains(@class,'Award')])[1]").attribute_value('alt')) }
          ignore_exception { award_class = con.quote(node.element(:xpath,"(//img[contains(@class,'Award')])[1]").attribute_value('class')) }
          ignore_exception { certificadoExcelencia = con.quote(node.element(:xpath,"//*[@data-tab='TABS_OVERVIEW' or @data-tab='TABS_ABOUT']//*[starts-with(@class,'ui_icon certificate-of-excellence')]/..").text) }
          ignore_exception { fullAddress = con.quote(node.element(:xpath,"(.//*[contains(./@class,'blEntry address')] | .//*[contains(./@class,'public-business-listing-ContactInfo')] | //address)[1]").text) }
          ignore_exception { postalCode = con.quote(node.element(:xpath,"(//*[contains(@property,'postal-code') or contains(@property,'postalCode')])[1]").text) }
          ignore_exception { locality = con.quote(node.element(:xpath,"//*[contains(@class,'blRow')]//*[@class='locality']").text) }
          ignore_exception { phone = con.quote(node.element(:xpath,"//*[contains(@class,'ui_icon phone')]/following-sibling::*[1]").text) }
          ignore_exception { placeRating = con.quote(node.element(:xpath,"//*[starts-with(@class,'starRating')]/div[2]/text() | //span[@class='star']//img").attribute_value('alt')) }
          ignore_exception { globalScore = con.quote(node.element(:xpath,"(//*[contains(@class,'header')]//*[contains(@class,'ratingContainer') or contains(@class,'rs rating')]//span[contains(@class,'ui_bubble_rating')])").attribute_value('alt')) }
          ignore_exception { reviewCount = con.quote(node.element(:xpath,"//*[contains(@class,'ratingContainer') or contains(@class,'rs rating')]//a").text) }
          ignore_exception { infoRanking = con.quote(node.element(:xpath,"//*[starts-with(@class,'slim_ranking') or starts-with(@class,'header_popularity')]").text) }
          ignore_exception { placeType = con.quote(node.element(:xpath,"//*[contains(@class,'attractionCategories')]").text) }
          ignore_exception { geoLat = con.quote(node.element(:xpath,"//*[contains(@class,'mapContainer')]").attribute_value('data-lat')) }
          ignore_exception { geoLng = con.quote(node.element(:xpath,"//*[contains(@class,'mapContainer')]").attribute_value('data-lng')) }
          ignore_exception { linkPrimeraReview = con.quote(node.element(:xpath,"(//*[@data-reviewid]//a)[1]").attribute_value('href')) }
          ignore_exception { currentPage = con.quote(node.element(:xpath,".//*[@class='pageNum current']").text) }
          ignore_exception { placeType2 = con.quote(node.element(:xpath,"//*[starts-with(@class,'header_detail')]").text) }
          ignore_exception { langList = con.quote(node.element(:xpath,"//*[@id='filterLang']/option/@value").attribute_value('value')) }
          ignore_exception { langSelected = con.quote(node.element(:xpath,"//*[@data-prwidget-name='filters_detail_language' or @class='ui_column is-3 language']//input[./@checked and not(ancestor-or-self::*[contains(./@class,'hidden')])]/following::label[1]").text) }
          ignore_exception { segmSelected = con.quote(node.element(:xpath,".//*[@id='filterControls']//*[contains(@class,'segment')]/ul/li[./span/input/@checked]/label").text) }
          ignore_exception { filterSegment = con.quote(node.element(:xpath,"//span[@class='filter']").text) }
          ignore_exception { filterCount = con.quote(node.element(:xpath,"//span[@class='filter']/preceding-sibling::b[1]").text) }
          ignore_exception { langFromRadioButtons = con.quote(node.element(:xpath,".//*[contains(@class,'language')]/ul/li[./span/input/@checked]/label").text) }
          ignore_exception { recommendedPercent2 = con.quote(node.element(:xpath,"//fieldset[@class='review_filter_eatery']/div/div[1]/div").text) }
          ignore_exception { sorting = con.quote(node.element(:xpath,"//fieldset/span[contains(@class,'selected')]").text) }
          ignore_exception { value5_Count = con.quote(node.element(:xpath,"//*[@for='ReviewRatingFilter_5' or @for='filters_detail_checkbox_trating__5']/../span[contains(@class,'row_num')]").text) }
          ignore_exception { value4_Count = con.quote(node.element(:xpath,"//*[@for='ReviewRatingFilter_4' or @for='filters_detail_checkbox_trating__4']/../span[contains(@class,'row_num')]").text) }
          ignore_exception { value3_Count = con.quote(node.element(:xpath,"//*[@for='ReviewRatingFilter_3' or @for='filters_detail_checkbox_trating__3']/../span[contains(@class,'row_num')]").text) }
          ignore_exception { value2_Count = con.quote(node.element(:xpath,"//*[@for='ReviewRatingFilter_2' or @for='filters_detail_checkbox_trating__2']/../span[contains(@class,'row_num')]").text) }
          ignore_exception { value1_Count = con.quote(node.element(:xpath,"//*[@for='ReviewRatingFilter_1' or @for='filters_detail_checkbox_trating__1']/../span[contains(@class,'row_num')]").text) }
          ignore_exception { timeOfYear1_Count = con.quote(node.element(:xpath,"//*[starts-with(@class,'col season')]/ul/li[1]/label").text) }
          ignore_exception { timeOfYear2_Count = con.quote(node.element(:xpath,"//*[starts-with(@class,'col season')]/ul/li[2]/label").text) }
          ignore_exception { timeOfYear3_Count = con.quote(node.element(:xpath,"//*[starts-with(@class,'col season')]/ul/li[3]/label").text) }
          ignore_exception { timeOfYear4_Count = con.quote(node.element(:xpath,"//*[starts-with(@class,'col season')]/ul/li[4]/label").text) }
          ignore_exception { varDimField1 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[1]").text) }
          ignore_exception { varDimField1Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[1]").attribute_value('alt')) }
          ignore_exception { varDimField2 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[2]").text) }
          ignore_exception { varDimField2Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[2]").attribute_value('alt')) }
          ignore_exception { varDimField3 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[3]").text) }
          ignore_exception { varDimField3Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[3]").attribute_value('alt')) }
          ignore_exception { varDimField4 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[4]").text) }
          ignore_exception { varDimField4Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[4]").attribute_value('alt')) }
          ignore_exception { varDimField5 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[5]").text) }
          ignore_exception { varDimField5Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[5]").attribute_value('alt')) }
          ignore_exception { varDimField6 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[6]").text) }
          ignore_exception { varDimField6Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[6]").attribute_value('alt')) }
          ignore_exception { varDimField7 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[7]").text) }
          ignore_exception { varDimField7Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[7]").attribute_value('alt')) }
          ignore_exception { varDimField8 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[8]").text) }
          ignore_exception { varDimField8Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[8]").attribute_value('alt')) }
          ignore_exception { varDimField9 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[9]").text) }
          ignore_exception { varDimField9Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[9]").attribute_value('alt')) }
          ignore_exception { varDimField10 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[10]").text) }
          ignore_exception { varDimField10Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[10]").attribute_value('alt')) }
          ignore_exception { varDimField11 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[11]").text) }
          ignore_exception { varDimField11Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[11]").attribute_value('alt')) }
          ignore_exception { varDimField12 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[12]").text) }
          ignore_exception { varDimField12Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[12]").attribute_value('alt')) }
          ignore_exception { varSegmField1 = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[1]/div/div[1]").text) }
          ignore_exception { varSegmField1Val = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[1]/div/div[2]").text) }
          ignore_exception { varSegmField2 = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[2]/div/div[1]").text) }
          ignore_exception { varSegmField2Val = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[2]/div/div[2]").text) }
          ignore_exception { varSegmField3 = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[3]/div/div[1]").text) }
          ignore_exception { varSegmField3Val = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[3]/div/div[2]").text) }
          ignore_exception { varSegmField4 = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[4]/div/div[1]").text) }
          ignore_exception { varSegmField4Val = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[4]/div/div[2]").text) }
          ignore_exception { varSegmField5 = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[5]/div/div[1]").text) }
          ignore_exception { varSegmField5Val = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[5]/div/div[2]").text) }
          ignore_exception { varSegmField6 = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[6]/div/div[1]").text) }
          ignore_exception { varSegmField6Val = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[6]/div/div[2]").text) }
          ignore_exception { codeMap = con.quote(node.element(:xpath,"//*[contains(@src,'center=')]").attribute_value('src')) }
          ignore_exception { peineNotas5 = con.quote(node.element(:xpath,"(//*[contains(text(),'ler rating')]/..//input[1])[1]").attribute_value('checked')) }
          ignore_exception { peineNotas4 = con.quote(node.element(:xpath,"(//*[contains(text(),'ler rating')]/..//input[1])[2]").attribute_value('checked')) }
          ignore_exception { peineNotas3 = con.quote(node.element(:xpath,"(//*[contains(text(),'ler rating')]/..//input[1])[3]").attribute_value('checked')) }
          ignore_exception { peineNotas2 = con.quote(node.element(:xpath,"(//*[contains(text(),'ler rating')]/..//input[1])[4]").attribute_value('checked')) }
          ignore_exception { peineNotas1 = con.quote(node.element(:xpath,"(//*[contains(text(),'ler rating')]/..//input[1])[5]").attribute_value('checked')) }
          ignore_exception { varLangField01 = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[01]").attribute_value('value')) }
          ignore_exception { varLangField01Val = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[01]/following::label[1]").text) }
          ignore_exception { varLangField02 = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[02]").attribute_value('value')) }
          ignore_exception { varLangField02Val = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[02]/following::label[1]").text) }
          ignore_exception { varLangField03 = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[03]").attribute_value('value')) }
          ignore_exception { varLangField03Val = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[03]/following::label[1]").text) }
          ignore_exception { varLangField04 = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[04]").attribute_value('value')) }
          ignore_exception { varLangField04Val = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[04]/following::label[1]").text) }
          ignore_exception { varLangField05 = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[05]").attribute_value('value')) }
          ignore_exception { varLangField05Val = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[05]/following::label[1]").text) }
          ignore_exception { varLangField06 = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[06]").attribute_value('value')) }
          ignore_exception { varLangField06Val = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[06]/following::label[1]").text) }
          ignore_exception { varLangField07 = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[07]").attribute_value('value')) }
          ignore_exception { varLangField07Val = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[07]/following::label[1]").text) }
          ignore_exception { varLangField08 = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[08]").attribute_value('value')) }
          ignore_exception { varLangField08Val = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[08]/following::label[1]").text) }
          ignore_exception { varLangField09 = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[09]").attribute_value('value')) }
          ignore_exception { varLangField09Val = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[09]/following::label[1]").text) }
          ignore_exception { varLangField10 = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[10]").attribute_value('value')) }
          ignore_exception { varLangField10Val = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[10]/following::label[1]").text) }
          ignore_exception { varLangField11 = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[11]").attribute_value('value')) }
          ignore_exception { varLangField11Val = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[11]/following::label[1]").text) }
          ignore_exception { varLangField12 = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[12]").attribute_value('value')) }
          ignore_exception { varLangField12Val = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[12]/following::label[1]").text) }
          ignore_exception { varLangField13 = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[13]").attribute_value('value')) }
          ignore_exception { varLangField13Val = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[13]/following::label[1]").text) }
          ignore_exception { varLangField14 = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[14]").attribute_value('value')) }
          ignore_exception { varLangField14Val = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[14]/following::label[1]").text) }
          ignore_exception { varLangField15 = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[15]").attribute_value('value')) }
          ignore_exception { varLangField15Val = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[15]/following::label[1]").text) }
          ignore_exception { varLangField16 = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[16]").attribute_value('value')) }
          ignore_exception { varLangField16Val = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[16]/following::label[1]").text) }
          ignore_exception { varLangField17 = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[17]").attribute_value('value')) }
          ignore_exception { varLangField17Val = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[17]/following::label[1]").text) }
          ignore_exception { varLangField18 = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[18]").attribute_value('value')) }
          ignore_exception { varLangField18Val = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[18]/following::label[1]").text) }
          ignore_exception { varLangField19 = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[19]").attribute_value('value')) }
          ignore_exception { varLangField19Val = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[19]/following::label[1]").text) }
          ignore_exception { varLangField20 = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[20]").attribute_value('value')) }
          ignore_exception { varLangField20Val = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[20]/following::label[1]").text) }
          ignore_exception { varLangField21 = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[21]").attribute_value('value')) }
          ignore_exception { varLangField21Val = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[21]/following::label[1]").text) }
          ignore_exception { varLangField22 = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[22]").attribute_value('value')) }
          ignore_exception { varLangField22Val = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[22]/following::label[1]").text) }
          ignore_exception { varLangField23 = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[23]").attribute_value('value')) }
          ignore_exception { varLangField23Val = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[23]/following::label[1]").text) }
          ignore_exception { varLangField24 = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[24]").attribute_value('value')) }
          ignore_exception { varLangField24Val = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[24]/following::label[1]").text) }
          ignore_exception { varLangField25 = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[25]").attribute_value('value')) }
          ignore_exception { varLangField25Val = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[25]/following::label[1]").text) }
          ignore_exception { varLangField26 = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[26]").attribute_value('value')) }
          ignore_exception { varLangField26Val = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[26]/following::label[1]").text) }
          ignore_exception { varLangField27 = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[27]").attribute_value('value')) }
          ignore_exception { varLangField27Val = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[27]/following::label[1]").text) }
          ignore_exception { varLangField28 = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[28]").attribute_value('value')) }
          ignore_exception { varLangField28Val = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[28]/following::label[1]").text) }
          ignore_exception { varLangField29 = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[29]").attribute_value('value')) }
          ignore_exception { varLangField29Val = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[29]/following::label[1]").text) }
          ignore_exception { varLangField30 = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[30]").attribute_value('value')) }
          ignore_exception { varLangField30Val = con.quote(node.element(:xpath,"(//input[contains(@id,'filterLang')])[30]/following::label[1]").text) }
          ignore_exception { placeName2 = con.quote(node.element(:xpath,"//ul[@class='breadcrumbs']/li[last()]").text) }
          ignore_exception { fullAddress2 = con.quote(node.element(:xpath,"//*[contains(@class,'ContactCard__contactRow') and contains(./span/@class,'map-pin')]").text) }
          ignore_exception { globalScore2 = con.quote(node.element(:xpath,"//*[contains(@class,'CompanyProfileContainer')]//*[contains(@class,'bubble_rating')]").attribute_value('class')) }
          ignore_exception { reviewCount2 = con.quote(node.element(:xpath,"//span[@class='reviews_header_count']").text) }
          ignore_exception { breadcrums = con.quote(node.element(:xpath,"//ul[@class='breadcrums']").text) }
          ignore_exception { h11 = con.quote(node.element(:xpath,"(//h1)[1]").text) }
          ignore_exception { h12 = con.quote(node.element(:xpath,"(//h1)[2]").text) }





    
            sqlInsert = "INSERT INTO `Navigator`.`tblDataTAFicha_ATR` (`captura`, `urlOrig`, `idLaunch`, `idCaptura`, `numPag`, `urlCaptura`, `fechaHora`, `numEntrada`, "  +
                        "`placeName`, `award_text`, `award_class`, `certificadoExcelencia`, `fullAddress`, `postalCode`, `locality`, `phone`, `placeRating`, `globalScore`, `reviewCount`, `infoRanking`, `placeType`, `geoLat`, `geoLng`, `linkPrimeraReview`, `currentPage`, `placeType2`, `langList`, `langSelected`, `segmSelected`, `filterSegment`, `filterCount`, `langFromRadioButtons`, `recommendedPercent2`, `sorting`, `value5_Count`, `value4_Count`, `value3_Count`, `value2_Count`, `value1_Count`, `timeOfYear1_Count`, `timeOfYear2_Count`, `timeOfYear3_Count`, `timeOfYear4_Count`, `varDimField1`, `varDimField1Val`, `varDimField2`, `varDimField2Val`, `varDimField3`, `varDimField3Val`, `varDimField4`, `varDimField4Val`, `varDimField5`, `varDimField5Val`, `varDimField6`, `varDimField6Val`, `varDimField7`, `varDimField7Val`, `varDimField8`, `varDimField8Val`, `varDimField9`, `varDimField9Val`, `varDimField10`, `varDimField10Val`, `varDimField11`, `varDimField11Val`, `varDimField12`, `varDimField12Val`, `varSegmField1`, `varSegmField1Val`, `varSegmField2`, `varSegmField2Val`, `varSegmField3`, `varSegmField3Val`, `varSegmField4`, `varSegmField4Val`, `varSegmField5`, `varSegmField5Val`, `varSegmField6`, `varSegmField6Val`, `codeMap`, `peineNotas5`, `peineNotas4`, `peineNotas3`, `peineNotas2`, `peineNotas1`, `varLangField01`, `varLangField01Val`, `varLangField02`, `varLangField02Val`, `varLangField03`, `varLangField03Val`, `varLangField04`, `varLangField04Val`, `varLangField05`, `varLangField05Val`, `varLangField06`, `varLangField06Val`, `varLangField07`, `varLangField07Val`, `varLangField08`, `varLangField08Val`, `varLangField09`, `varLangField09Val`, `varLangField10`, `varLangField10Val`, `varLangField11`, `varLangField11Val`, `varLangField12`, `varLangField12Val`, `varLangField13`, `varLangField13Val`, `varLangField14`, `varLangField14Val`, `varLangField15`, `varLangField15Val`, `varLangField16`, `varLangField16Val`, `varLangField17`, `varLangField17Val`, `varLangField18`, `varLangField18Val`, `varLangField19`, `varLangField19Val`, `varLangField20`, `varLangField20Val`, `varLangField21`, `varLangField21Val`, `varLangField22`, `varLangField22Val`, `varLangField23`, `varLangField23Val`, `varLangField24`, `varLangField24Val`, `varLangField25`, `varLangField25Val`, `varLangField26`, `varLangField26Val`, `varLangField27`, `varLangField27Val`, `varLangField28`, `varLangField28Val`, `varLangField29`, `varLangField29Val`, `varLangField30`, `varLangField30Val`, `placeName2`, `fullAddress2`, `globalScore2`, `reviewCount2`, `breadcrums`, `h1-1`, `h1-2`"  +
                        ") VALUES ('#{captura}', '#{urlOrig}', '#{idLaunch}', '#{idCaptura}', '#{numPag}', '#{urlCaptura}', '#{fechaHora}', '#{numEntrada}', "  +
                        "'#{placeName}', '#{award_text}', '#{award_class}', '#{certificadoExcelencia}', '#{fullAddress}', '#{postalCode}', '#{locality}', '#{phone}', '#{placeRating}', '#{globalScore}', '#{reviewCount}', '#{infoRanking}', '#{placeType}', '#{geoLat}', '#{geoLng}', '#{linkPrimeraReview}', '#{currentPage}', '#{placeType2}', '#{langList}', '#{langSelected}', '#{segmSelected}', '#{filterSegment}', '#{filterCount}', '#{langFromRadioButtons}', '#{recommendedPercent2}', '#{sorting}', '#{value5_Count}', '#{value4_Count}', '#{value3_Count}', '#{value2_Count}', '#{value1_Count}', '#{timeOfYear1_Count}', '#{timeOfYear2_Count}', '#{timeOfYear3_Count}', '#{timeOfYear4_Count}', '#{varDimField1}', '#{varDimField1Val}', '#{varDimField2}', '#{varDimField2Val}', '#{varDimField3}', '#{varDimField3Val}', '#{varDimField4}', '#{varDimField4Val}', '#{varDimField5}', '#{varDimField5Val}', '#{varDimField6}', '#{varDimField6Val}', '#{varDimField7}', '#{varDimField7Val}', '#{varDimField8}', '#{varDimField8Val}', '#{varDimField9}', '#{varDimField9Val}', '#{varDimField10}', '#{varDimField10Val}', '#{varDimField11}', '#{varDimField11Val}', '#{varDimField12}', '#{varDimField12Val}', '#{varSegmField1}', '#{varSegmField1Val}', '#{varSegmField2}', '#{varSegmField2Val}', '#{varSegmField3}', '#{varSegmField3Val}', '#{varSegmField4}', '#{varSegmField4Val}', '#{varSegmField5}', '#{varSegmField5Val}', '#{varSegmField6}', '#{varSegmField6Val}', '#{codeMap}', '#{peineNotas5}', '#{peineNotas4}', '#{peineNotas3}', '#{peineNotas2}', '#{peineNotas1}', '#{varLangField01}', '#{varLangField01Val}', '#{varLangField02}', '#{varLangField02Val}', '#{varLangField03}', '#{varLangField03Val}', '#{varLangField04}', '#{varLangField04Val}', '#{varLangField05}', '#{varLangField05Val}', '#{varLangField06}', '#{varLangField06Val}', '#{varLangField07}', '#{varLangField07Val}', '#{varLangField08}', '#{varLangField08Val}', '#{varLangField09}', '#{varLangField09Val}', '#{varLangField10}', '#{varLangField10Val}', '#{varLangField11}', '#{varLangField11Val}', '#{varLangField12}', '#{varLangField12Val}', '#{varLangField13}', '#{varLangField13Val}', '#{varLangField14}', '#{varLangField14Val}', '#{varLangField15}', '#{varLangField15Val}', '#{varLangField16}', '#{varLangField16Val}', '#{varLangField17}', '#{varLangField17Val}', '#{varLangField18}', '#{varLangField18Val}', '#{varLangField19}', '#{varLangField19Val}', '#{varLangField20}', '#{varLangField20Val}', '#{varLangField21}', '#{varLangField21Val}', '#{varLangField22}', '#{varLangField22Val}', '#{varLangField23}', '#{varLangField23Val}', '#{varLangField24}', '#{varLangField24Val}', '#{varLangField25}', '#{varLangField25Val}', '#{varLangField26}', '#{varLangField26Val}', '#{varLangField27}', '#{varLangField27Val}', '#{varLangField28}', '#{varLangField28Val}', '#{varLangField29}', '#{varLangField29Val}', '#{varLangField30}', '#{varLangField30Val}', '#{placeName2}', '#{fullAddress2}', '#{globalScore2}', '#{reviewCount2}', '#{breadcrums}', '#{h11}', '#{h12}'"  +
                        ")"
            puts(sqlInsert)
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    
            con.query(sqlInsert)
          end

        elsif descripcion.include? 'BOOKING_HotelFicha.'

          posNode = 0
#INTRODUCIR PATH COLECCIÓN ITEMS
          nodes = @browser.divs(:xpath, "/*")
        
          puts("Node count: #{nodes.size}")
          nodes.each do |node|
            posNode += 1
                     
            captura = ""
            numPag = 0
            urlCaptura = ""
            fechaHora = ""
            numEntrada = 0



      placeName = ""
      location = ""
      propertyType = ""
      reviewCount = ""
      globalScore = ""
      reviewCount_FilterAll = ""
      score_FilterAll = ""
      cleanScore_FilterAll = ""
      comfortScore_FilterAll = ""
      locationScore_FilterAll = ""
      facilitiesScore_FilterAll = ""
      staffScore_FilterAll = ""
      valueForMoneyScore_FilterAll = ""
      reviewCount_FilterFamily = ""
      score_FilterFamily = ""
      cleanScore_FilterFamily = ""
      comfortScore_FilterFamily = ""
      locationScore_FilterFamily = ""
      facilitiesScore_FilterFamily = ""
      staffScore_FilterFamily = ""
      valueForMoneyScore_FilterFamily = ""
      reviewCount_FilterCouple = ""
      score_FilterCouple = ""
      cleanScore_FilterCouple = ""
      comfortScore_FilterCouple = ""
      locationScore_FilterCouple = ""
      facilitiesScore_FilterCouple = ""
      staffScore_FilterCouple = ""
      valueForMoneyScore_FilterCouple = ""
      reviewCount_FilterGroupFriends = ""
      score_FilterGroupFriends = ""
      cleanScore_FilterGroupFriends = ""
      comfortScore_FilterGroupFriends = ""
      locationScore_FilterGroupFriends = ""
      facilitiesScore_FilterGroupFriends = ""
      staffScore_FilterGroupFriends = ""
      valueForMoneyScore_FilterGroupFriends = ""
      reviewCount_FilterSoloTravellers = ""
      score_FilterSoloTravellers = ""
      cleanScore_FilterSoloTravellers = ""
      comfortScore_FilterSoloTravellers = ""
      locationScore_FilterSoloTravellers = ""
      facilitiesScore_FilterSoloTravellers = ""
      staffScore_FilterSoloTravellers = ""
      valueForMoneyScore_FilterSoloTravellers = ""
      reviewCount_FilterBusinessTravellers = ""
      score_FilterBusinessTravellers = ""
      cleanScore_FilterBusinessTravellers = ""
      comfortScore_FilterBusinessTravellers = ""
      locationScore_FilterBusinessTravellers = ""
      facilitiesScore_FilterBusinessTravellers = ""
      staffScore_FilterBusinessTravellers = ""
      valueForMoneyScore_FilterBusinessTravellers = ""
      placeRating = ""
      geoLoc = ""
      bookButtonTitle = ""
      mainScore = ""
      value10_Text = ""
      value08_Text = ""
      value06_Text = ""
      value04_Text = ""
      value02_Text = ""
      value10_Value = ""
      value08_Value = ""
      value06_Value = ""
      value04_Value = ""
      value02_Value = ""
      varLangField01 = ""
      varLangField02 = ""
      varLangField03 = ""
      varLangField04 = ""
      varLangField05 = ""
      varLangField06 = ""
      varLangField07 = ""
      varLangField08 = ""
      varLangField09 = ""
      varLangField10 = ""
      varLangField11 = ""
      varLangField12 = ""
      varLangField13 = ""
      varLangField14 = ""
      varLangField15 = ""
      varLangField16 = ""
      varLangField17 = ""
      varLangField18 = ""
      varLangField19 = ""
      varLangField20 = ""
      varLangField21 = ""
      varLangField22 = ""
      varLangField23 = ""
      varLangField24 = ""
      varLangField25 = ""
      varLangField26 = ""
      varLangField27 = ""
      varLangField28 = ""
      varLangField29 = ""
      varLangField30 = ""
      varLangField31 = ""
      varLangField32 = ""
      varLangField33 = ""
      varLangField34 = ""
      varLangField35 = ""
      varLangField36 = ""
      varLangField37 = ""
      varLangField38 = ""
      varLangField39 = ""
      varLangField40 = ""
      varLangField01Val = ""
      varLangField02Val = ""
      varLangField03Val = ""
      varLangField04Val = ""
      varLangField05Val = ""
      varLangField06Val = ""
      varLangField07Val = ""
      varLangField08Val = ""
      varLangField09Val = ""
      varLangField10Val = ""
      varLangField11Val = ""
      varLangField12Val = ""
      varLangField13Val = ""
      varLangField14Val = ""
      varLangField15Val = ""
      varLangField16Val = ""
      varLangField17Val = ""
      varLangField18Val = ""
      varLangField19Val = ""
      varLangField20Val = ""
      varLangField21Val = ""
      varLangField22Val = ""
      varLangField23Val = ""
      varLangField24Val = ""
      varLangField25Val = ""
      varLangField26Val = ""
      varLangField27Val = ""
      varLangField28Val = ""
      varLangField29Val = ""
      varLangField30Val = ""
      varLangField31Val = ""
      varLangField32Val = ""
      varLangField33Val = ""
      varLangField34Val = ""
      varLangField35Val = ""
      varLangField36Val = ""
      varLangField37Val = ""
      varLangField38Val = ""
      varLangField39Val = ""
      varLangField40Val = ""
      breadcrumb01 = ""
      breadcrumb02 = ""
      breadcrumb03 = ""
      breadcrumb04 = ""
      breadcrumb05 = ""
      breadcrumb06 = ""
      breadcrumb07 = ""
      breadcrumb01Val = ""
      breadcrumb02Val = ""
      breadcrumb03Val = ""
      breadcrumb04Val = ""
      breadcrumb05Val = ""
      breadcrumb06Val = ""
      breadcrumb07Val = ""
      geoData = ""
      score = ""
      varDimField01 = ""
      varDimField01Val = ""
      varDimField02 = ""
      varDimField02Val = ""
      varDimField03 = ""
      varDimField03Val = ""
      varDimField04 = ""
      varDimField04Val = ""
      varDimField05 = ""
      varDimField05Val = ""
      varDimField06 = ""
      varDimField06Val = ""
      varDimField07 = ""
      varDimField07Val = ""
      varDimField08 = ""
      varDimField08Val = ""
      importantInfo = ""
            
  


  
            ignore_exception { captura = "#{descripcion}" }
            ignore_exception { urlOrig = "#{urlOrig}" }
            ignore_exception { idLaunch = "#{idLaunch}" }
            ignore_exception { idCaptura = "#{idCaptura}" }
            ignore_exception { numPag = "#{page}" }
            ignore_exception { urlCaptura = @browser.url }
            ignore_exception { fechaHora = "#{strDT}" }
            ignore_exception { numEntrada = "#{posNode}" }
      
          ignore_exception { placeName = con.quote(node.element(:xpath,"//h2[contains(@id,'hp_hotel_name')]").text) }
          ignore_exception { location = con.quote(node.element(:xpath,"//*[contains(@class,'hp_address_subtitle')]").text) }
          ignore_exception { propertyType = con.quote(node.element(:xpath,"//h2[contains(@id,'hp_hotel_name')]/span").text) }
          ignore_exception { reviewCount = con.quote(node.element(:xpath,"//a[@id='show_reviews_tab']//span").text) }
          ignore_exception { globalScore = con.quote(node.element(:xpath,"//*[@data-review-score]").attribute_value('data-review-score')) }
          ignore_exception { reviewCount_FilterAll = con.quote(node.element(:xpath,"//*[@data-customer-type='total']").attribute_value('data-quantity')) }
          ignore_exception { score_FilterAll = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_main_score']").attribute_value('data-total')) }
          ignore_exception { cleanScore_FilterAll = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-total_hotel_clean')) }
          ignore_exception { comfortScore_FilterAll = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-total_hotel_comfort')) }
          ignore_exception { locationScore_FilterAll = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-total_hotel_location')) }
          ignore_exception { facilitiesScore_FilterAll = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-total_hotel_services')) }
          ignore_exception { staffScore_FilterAll = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-total_hotel_staff')) }
          ignore_exception { valueForMoneyScore_FilterAll = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-total_hotel_value')) }
          ignore_exception { reviewCount_FilterFamily = con.quote(node.element(:xpath,"//*[@data-customer-type='family_with_children']").attribute_value('data-quantity')) }
          ignore_exception { score_FilterFamily = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_main_score']").attribute_value('data-family_with_children')) }
          ignore_exception { cleanScore_FilterFamily = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-family_with_children_hotel_clean')) }
          ignore_exception { comfortScore_FilterFamily = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-family_with_children_hotel_comfort')) }
          ignore_exception { locationScore_FilterFamily = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-family_with_children_hotel_location')) }
          ignore_exception { facilitiesScore_FilterFamily = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-family_with_children_hotel_services')) }
          ignore_exception { staffScore_FilterFamily = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-family_with_children_hotel_staff')) }
          ignore_exception { valueForMoneyScore_FilterFamily = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-family_with_children_hotel_value')) }
          ignore_exception { reviewCount_FilterCouple = con.quote(node.element(:xpath,"//*[@data-customer-type='couple']").attribute_value('data-quantity')) }
          ignore_exception { score_FilterCouple = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_main_score']").attribute_value('data-couple')) }
          ignore_exception { cleanScore_FilterCouple = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-couple_hotel_clean')) }
          ignore_exception { comfortScore_FilterCouple = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-couple_hotel_comfort')) }
          ignore_exception { locationScore_FilterCouple = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-couple_hotel_location')) }
          ignore_exception { facilitiesScore_FilterCouple = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-couple_hotel_services')) }
          ignore_exception { staffScore_FilterCouple = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-couple_hotel_staff')) }
          ignore_exception { valueForMoneyScore_FilterCouple = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-couple_hotel_value')) }
          ignore_exception { reviewCount_FilterGroupFriends = con.quote(node.element(:xpath,"//*[@data-customer-type='review_category_group_of_friends']").attribute_value('data-quantity')) }
          ignore_exception { score_FilterGroupFriends = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_main_score']").attribute_value('data-review_category_group_of_friends')) }
          ignore_exception { cleanScore_FilterGroupFriends = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-review_category_group_of_friends_hotel_clean')) }
          ignore_exception { comfortScore_FilterGroupFriends = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-review_category_group_of_friends_hotel_comfort')) }
          ignore_exception { locationScore_FilterGroupFriends = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-review_category_group_of_friends_hotel_location')) }
          ignore_exception { facilitiesScore_FilterGroupFriends = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-review_category_group_of_friends_hotel_services')) }
          ignore_exception { staffScore_FilterGroupFriends = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-review_category_group_of_friends_hotel_staff')) }
          ignore_exception { valueForMoneyScore_FilterGroupFriends = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-review_category_group_of_friends_hotel_value')) }
          ignore_exception { reviewCount_FilterSoloTravellers = con.quote(node.element(:xpath,"//*[@data-customer-type='solo_traveller']").attribute_value('data-quantity')) }
          ignore_exception { score_FilterSoloTravellers = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_main_score']").attribute_value('data-solo_traveller')) }
          ignore_exception { cleanScore_FilterSoloTravellers = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-solo_traveller_hotel_clean')) }
          ignore_exception { comfortScore_FilterSoloTravellers = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-solo_traveller_hotel_comfort')) }
          ignore_exception { locationScore_FilterSoloTravellers = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-solo_traveller_hotel_location')) }
          ignore_exception { facilitiesScore_FilterSoloTravellers = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-solo_traveller_hotel_services')) }
          ignore_exception { staffScore_FilterSoloTravellers = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-solo_traveller_hotel_staff')) }
          ignore_exception { valueForMoneyScore_FilterSoloTravellers = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-solo_traveller_hotel_value')) }
          ignore_exception { reviewCount_FilterBusinessTravellers = con.quote(node.element(:xpath,"//*[@data-customer-type='business_traveller']").attribute_value('data-quantity')) }
          ignore_exception { score_FilterBusinessTravellers = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_main_score']").attribute_value('data-business_traveller')) }
          ignore_exception { cleanScore_FilterBusinessTravellers = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-business_traveller_hotel_clean')) }
          ignore_exception { comfortScore_FilterBusinessTravellers = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-business_traveller_hotel_comfort')) }
          ignore_exception { locationScore_FilterBusinessTravellers = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-business_traveller_hotel_location')) }
          ignore_exception { facilitiesScore_FilterBusinessTravellers = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-business_traveller_hotel_services')) }
          ignore_exception { staffScore_FilterBusinessTravellers = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-business_traveller_hotel_staff')) }
          ignore_exception { valueForMoneyScore_FilterBusinessTravellers = con.quote(node.element(:xpath,"//*[not(contains(@style,'hidden'))]/*[@id='review_list_score_breakdown']").attribute_value('data-business_traveller_hotel_value')) }
          ignore_exception { placeRating = con.quote(node.element(:xpath,"//*[@id='hp_hotel_name']//..//i").attribute_value('title')) }
          ignore_exception { geoLoc = con.quote(node.element(:xpath,"//img[@class='static_map_one']").attribute_value('src')) }
          ignore_exception { bookButtonTitle = con.quote(node.element(:xpath,"//*[@id='hcta']").attribute_value('title')) }
          ignore_exception { mainScore = con.quote(node.element(:xpath,"//*[@id='reviewFloater']//*[@data-review-score]//*[@class='review-score-badge']").text) }
          ignore_exception { value10_Text = con.quote(@browser.element(:xpath,"//ul[contains(@id,'score_distribution')]/li[1]/p[1]/text()[1]").text) }
          ignore_exception { value08_Text = con.quote(@browser.element(:xpath,"//ul[contains(@id,'score_distribution')]/li[2]/p[1]/text()[1]").text) }
          ignore_exception { value06_Text = con.quote(@browser.element(:xpath,"//ul[contains(@id,'score_distribution')]/li[3]/p[1]/text()[1]").text) }
          ignore_exception { value04_Text = con.quote(@browser.element(:xpath,"//ul[contains(@id,'score_distribution')]/li[4]/p[1]/text()[1]").text) }
          ignore_exception { value02_Text = con.quote(@browser.element(:xpath,"//ul[contains(@id,'score_distribution')]/li[5]/p[1]/text()[1]").text) }
          ignore_exception { value10_Value = con.quote(@browser.element(:xpath,"//select[@id='review_score_filter']/option[@data-dist='1']").text) }
          ignore_exception { value08_Value = con.quote(@browser.element(:xpath,"//select[@id='review_score_filter']/option[@data-dist='2']").text) }
          ignore_exception { value06_Value = con.quote(@browser.element(:xpath,"//select[@id='review_score_filter']/option[@data-dist='3']").text) }
          ignore_exception { value04_Value = con.quote(@browser.element(:xpath,"//select[@id='review_score_filter']/option[@data-dist='4']").text) }
          ignore_exception { value02_Value = con.quote(@browser.element(:xpath,"//select[@id='review_score_filter']/option[@data-dist='5']").text) }
          ignore_exception { varLangField01 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[01]").text) }
          ignore_exception { varLangField02 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[02]").text) }
          ignore_exception { varLangField03 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[03]").text) }
          ignore_exception { varLangField04 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[04]").text) }
          ignore_exception { varLangField05 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[05]").text) }
          ignore_exception { varLangField06 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[06]").text) }
          ignore_exception { varLangField07 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[07]").text) }
          ignore_exception { varLangField08 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[08]").text) }
          ignore_exception { varLangField09 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[09]").text) }
          ignore_exception { varLangField10 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[10]").text) }
          ignore_exception { varLangField11 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[11]").text) }
          ignore_exception { varLangField12 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[12]").text) }
          ignore_exception { varLangField13 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[13]").text) }
          ignore_exception { varLangField14 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[14]").text) }
          ignore_exception { varLangField15 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[15]").text) }
          ignore_exception { varLangField16 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[16]").text) }
          ignore_exception { varLangField17 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[17]").text) }
          ignore_exception { varLangField18 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[18]").text) }
          ignore_exception { varLangField19 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[19]").text) }
          ignore_exception { varLangField20 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[20]").text) }
          ignore_exception { varLangField21 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[21]").text) }
          ignore_exception { varLangField22 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[22]").text) }
          ignore_exception { varLangField23 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[23]").text) }
          ignore_exception { varLangField24 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[24]").text) }
          ignore_exception { varLangField25 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[25]").text) }
          ignore_exception { varLangField26 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[26]").text) }
          ignore_exception { varLangField27 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[27]").text) }
          ignore_exception { varLangField28 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[28]").text) }
          ignore_exception { varLangField29 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[29]").text) }
          ignore_exception { varLangField30 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[30]").text) }
          ignore_exception { varLangField31 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[31]").text) }
          ignore_exception { varLangField32 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[32]").text) }
          ignore_exception { varLangField33 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[33]").text) }
          ignore_exception { varLangField34 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[34]").text) }
          ignore_exception { varLangField35 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[35]").text) }
          ignore_exception { varLangField36 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[36]").text) }
          ignore_exception { varLangField37 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[37]").text) }
          ignore_exception { varLangField38 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[38]").text) }
          ignore_exception { varLangField39 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[39]").text) }
          ignore_exception { varLangField40 = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[40]").text) }
          ignore_exception { varLangField01Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[01]/following-sibling::*[1]").text) }
          ignore_exception { varLangField02Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[02]/following-sibling::*[1]").text) }
          ignore_exception { varLangField03Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[03]/following-sibling::*[1]").text) }
          ignore_exception { varLangField04Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[04]/following-sibling::*[1]").text) }
          ignore_exception { varLangField05Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[05]/following-sibling::*[1]").text) }
          ignore_exception { varLangField06Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[06]/following-sibling::*[1]").text) }
          ignore_exception { varLangField07Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[07]/following-sibling::*[1]").text) }
          ignore_exception { varLangField08Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[08]/following-sibling::*[1]").text) }
          ignore_exception { varLangField09Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[09]/following-sibling::*[1]").text) }
          ignore_exception { varLangField10Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[10]/following-sibling::*[1]").text) }
          ignore_exception { varLangField11Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[11]/following-sibling::*[1]").text) }
          ignore_exception { varLangField12Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[12]/following-sibling::*[1]").text) }
          ignore_exception { varLangField13Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[13]/following-sibling::*[1]").text) }
          ignore_exception { varLangField14Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[14]/following-sibling::*[1]").text) }
          ignore_exception { varLangField15Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[15]/following-sibling::*[1]").text) }
          ignore_exception { varLangField16Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[16]/following-sibling::*[1]").text) }
          ignore_exception { varLangField17Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[17]/following-sibling::*[1]").text) }
          ignore_exception { varLangField18Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[18]/following-sibling::*[1]").text) }
          ignore_exception { varLangField19Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[19]/following-sibling::*[1]").text) }
          ignore_exception { varLangField20Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[20]/following-sibling::*[1]").text) }
          ignore_exception { varLangField21Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[21]/following-sibling::*[1]").text) }
          ignore_exception { varLangField22Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[22]/following-sibling::*[1]").text) }
          ignore_exception { varLangField23Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[23]/following-sibling::*[1]").text) }
          ignore_exception { varLangField24Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[24]/following-sibling::*[1]").text) }
          ignore_exception { varLangField25Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[25]/following-sibling::*[1]").text) }
          ignore_exception { varLangField26Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[26]/following-sibling::*[1]").text) }
          ignore_exception { varLangField27Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[27]/following-sibling::*[1]").text) }
          ignore_exception { varLangField28Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[28]/following-sibling::*[1]").text) }
          ignore_exception { varLangField29Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[29]/following-sibling::*[1]").text) }
          ignore_exception { varLangField30Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[30]/following-sibling::*[1]").text) }
          ignore_exception { varLangField31Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[31]/following-sibling::*[1]").text) }
          ignore_exception { varLangField32Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[32]/following-sibling::*[1]").text) }
          ignore_exception { varLangField33Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[33]/following-sibling::*[1]").text) }
          ignore_exception { varLangField34Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[34]/following-sibling::*[1]").text) }
          ignore_exception { varLangField35Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[35]/following-sibling::*[1]").text) }
          ignore_exception { varLangField36Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[36]/following-sibling::*[1]").text) }
          ignore_exception { varLangField37Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[37]/following-sibling::*[1]").text) }
          ignore_exception { varLangField38Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[38]/following-sibling::*[1]").text) }
          ignore_exception { varLangField39Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[39]/following-sibling::*[1]").text) }
          ignore_exception { varLangField40Val = con.quote(node.element(:xpath,"((//*[@class='language_filter_values'])[last()]//*[@class='language_name'])[40]/following-sibling::*[1]").text) }
          ignore_exception { breadcrumb01 = con.quote(node.element(:xpath,"//*[@id='breadcrumb']/ol/li[1]").attribute_value('data-google-track')) }
          ignore_exception { breadcrumb02 = con.quote(node.element(:xpath,"//*[@id='breadcrumb']/ol/li[2]").attribute_value('data-google-track')) }
          ignore_exception { breadcrumb03 = con.quote(node.element(:xpath,"//*[@id='breadcrumb']/ol/li[3]").attribute_value('data-google-track')) }
          ignore_exception { breadcrumb04 = con.quote(node.element(:xpath,"//*[@id='breadcrumb']/ol/li[4]").attribute_value('data-google-track')) }
          ignore_exception { breadcrumb05 = con.quote(node.element(:xpath,"//*[@id='breadcrumb']/ol/li[5]").attribute_value('data-google-track')) }
          ignore_exception { breadcrumb06 = con.quote(node.element(:xpath,"//*[@id='breadcrumb']/ol/li[6]").attribute_value('data-google-track')) }
          ignore_exception { breadcrumb07 = con.quote(node.element(:xpath,"//*[@id='breadcrumb']/ol/li[7]").attribute_value('data-google-track')) }
          ignore_exception { breadcrumb01Val = con.quote(node.element(:xpath,"//*[@id='breadcrumb']/ol/li[1]/div/a").text) }
          ignore_exception { breadcrumb02Val = con.quote(node.element(:xpath,"//*[@id='breadcrumb']/ol/li[2]/div/a").text) }
          ignore_exception { breadcrumb03Val = con.quote(node.element(:xpath,"//*[@id='breadcrumb']/ol/li[3]/div/a").text) }
          ignore_exception { breadcrumb04Val = con.quote(node.element(:xpath,"//*[@id='breadcrumb']/ol/li[4]/div/a").text) }
          ignore_exception { breadcrumb05Val = con.quote(node.element(:xpath,"//*[@id='breadcrumb']/ol/li[5]/div/a").text) }
          ignore_exception { breadcrumb06Val = con.quote(node.element(:xpath,"//*[@id='breadcrumb']/ol/li[6]/div/a").text) }
          ignore_exception { breadcrumb07Val = con.quote(node.element(:xpath,"//*[@id='breadcrumb']/ol/li[7]/div/a").text) }
          ignore_exception { geoData = con.quote(node.element(:xpath,"//a[@id='hotel_sidebar_static_map']").attribute_value('data-atlas-latlng')) }
          ignore_exception { score = con.quote(node.element(:xpath,"//*[contains(@id,'hp-gallery-scorecard')]//*[@class='bui-review-score__badge']").text) }
          ignore_exception { varDimField01 = con.quote(node.element(:xpath,"(//*[contains(@class,'review_list_score_container')]//ul/li/div/span[contains(@class,'title')])[1]").text) }
          ignore_exception { varDimField02 = con.quote(node.element(:xpath,"(//*[contains(@class,'review_list_score_container')]//ul/li/div/span[contains(@class,'title')])[2]").text) }
          ignore_exception { varDimField03 = con.quote(node.element(:xpath,"(//*[contains(@class,'review_list_score_container')]//ul/li/div/span[contains(@class,'title')])[3]").text) }
          ignore_exception { varDimField04 = con.quote(node.element(:xpath,"(//*[contains(@class,'review_list_score_container')]//ul/li/div/span[contains(@class,'title')])[4]").text) }
          ignore_exception { varDimField05 = con.quote(node.element(:xpath,"(//*[contains(@class,'review_list_score_container')]//ul/li/div/span[contains(@class,'title')])[5]").text) }
          ignore_exception { varDimField06 = con.quote(node.element(:xpath,"(//*[contains(@class,'review_list_score_container')]//ul/li/div/span[contains(@class,'title')])[6]").text) }
          ignore_exception { varDimField07 = con.quote(node.element(:xpath,"(//*[contains(@class,'review_list_score_container')]//ul/li/div/span[contains(@class,'title')])[7]").text) }
          ignore_exception { varDimField08 = con.quote(node.element(:xpath,"(//*[contains(@class,'review_list_score_container')]//ul/li/div/span[contains(@class,'title')])[8]").text) }
          ignore_exception { varDimField01Val = con.quote(node.element(:xpath,"(//*[contains(@class,'review_list_score_container')]//ul/li/div/span[not(contains(@class,'title'))])[1]").text) }
          ignore_exception { varDimField02Val = con.quote(node.element(:xpath,"(//*[contains(@class,'review_list_score_container')]//ul/li/div/span[not(contains(@class,'title'))])[2]").text) }
          ignore_exception { varDimField03Val = con.quote(node.element(:xpath,"(//*[contains(@class,'review_list_score_container')]//ul/li/div/span[not(contains(@class,'title'))])[3]").text) }
          ignore_exception { varDimField04Val = con.quote(node.element(:xpath,"(//*[contains(@class,'review_list_score_container')]//ul/li/div/span[not(contains(@class,'title'))])[4]").text) }
          ignore_exception { varDimField05Val = con.quote(node.element(:xpath,"(//*[contains(@class,'review_list_score_container')]//ul/li/div/span[not(contains(@class,'title'))])[5]").text) }
          ignore_exception { varDimField06Val = con.quote(node.element(:xpath,"(//*[contains(@class,'review_list_score_container')]//ul/li/div/span[not(contains(@class,'title'))])[6]").text) }
          ignore_exception { varDimField07Val = con.quote(node.element(:xpath,"(//*[contains(@class,'review_list_score_container')]//ul/li/div/span[not(contains(@class,'title'))])[7]").text) }
          ignore_exception { varDimField08Val = con.quote(node.element(:xpath,"(//*[contains(@class,'review_list_score_container')]//ul/li/div/span[not(contains(@class,'title'))])[8]").text) }
          ignore_exception { importantInfo = con.quote(node.element(:xpath,"//div[contains(@class,'imporant_info_highlight')]").text) }



    
            sqlInsert = "INSERT INTO `Navigator`.`tblDataBKFicha` (`captura`, `urlOrig`, `idLaunch`, `idCaptura`, `numPag`, `urlCaptura`, `fechaHora`, `numEntrada`, "  +
                        "`placeName`, `location`, `propertyType`, `reviewCount`, `globalScore`, `reviewCount_FilterAll`, `score_FilterAll`, `cleanScore_FilterAll`, `comfortScore_FilterAll`, `locationScore_FilterAll`, `facilitiesScore_FilterAll`, `staffScore_FilterAll`, `valueForMoneyScore_FilterAll`, `reviewCount_FilterFamily`, `score_FilterFamily`, `cleanScore_FilterFamily`, `comfortScore_FilterFamily`, `locationScore_FilterFamily`, `facilitiesScore_FilterFamily`, `staffScore_FilterFamily`, `valueForMoneyScore_FilterFamily`, `reviewCount_FilterCouple`, `score_FilterCouple`, `cleanScore_FilterCouple`, `comfortScore_FilterCouple`, `locationScore_FilterCouple`, `facilitiesScore_FilterCouple`, `staffScore_FilterCouple`, `valueForMoneyScore_FilterCouple`, `reviewCount_FilterGroupFriends`, `score_FilterGroupFriends`, `cleanScore_FilterGroupFriends`, `comfortScore_FilterGroupFriends`, `locationScore_FilterGroupFriends`, `facilitiesScore_FilterGroupFriends`, `staffScore_FilterGroupFriends`, `valueForMoneyScore_FilterGroupFriends`, `reviewCount_FilterSoloTravellers`, `score_FilterSoloTravellers`, `cleanScore_FilterSoloTravellers`, `comfortScore_FilterSoloTravellers`, `locationScore_FilterSoloTravellers`, `facilitiesScore_FilterSoloTravellers`, `staffScore_FilterSoloTravellers`, `valueForMoneyScore_FilterSoloTravellers`, `reviewCount_FilterBusinessTravellers`, `score_FilterBusinessTravellers`, `cleanScore_FilterBusinessTravellers`, `comfortScore_FilterBusinessTravellers`, `locationScore_FilterBusinessTravellers`, `facilitiesScore_FilterBusinessTravellers`, `staffScore_FilterBusinessTravellers`, `valueForMoneyScore_FilterBusinessTravellers`, `placeRating`, `geoLoc`, `bookButtonTitle`, `mainScore`, `value10_Text`, `value08_Text`, `value06_Text`, `value04_Text`, `value02_Text`, `value10_Value`, `value08_Value`, `value06_Value`, `value04_Value`, `value02_Value`, `varLangField01`, `varLangField02`, `varLangField03`, `varLangField04`, `varLangField05`, `varLangField06`, `varLangField07`, `varLangField08`, `varLangField09`, `varLangField10`, `varLangField11`, `varLangField12`, `varLangField13`, `varLangField14`, `varLangField15`, `varLangField16`, `varLangField17`, `varLangField18`, `varLangField19`, `varLangField20`, `varLangField21`, `varLangField22`, `varLangField23`, `varLangField24`, `varLangField25`, `varLangField26`, `varLangField27`, `varLangField28`, `varLangField29`, `varLangField30`, `varLangField31`, `varLangField32`, `varLangField33`, `varLangField34`, `varLangField35`, `varLangField36`, `varLangField37`, `varLangField38`, `varLangField39`, `varLangField40`, `varLangField01Val`, `varLangField02Val`, `varLangField03Val`, `varLangField04Val`, `varLangField05Val`, `varLangField06Val`, `varLangField07Val`, `varLangField08Val`, `varLangField09Val`, `varLangField10Val`, `varLangField11Val`, `varLangField12Val`, `varLangField13Val`, `varLangField14Val`, `varLangField15Val`, `varLangField16Val`, `varLangField17Val`, `varLangField18Val`, `varLangField19Val`, `varLangField20Val`, `varLangField21Val`, `varLangField22Val`, `varLangField23Val`, `varLangField24Val`, `varLangField25Val`, `varLangField26Val`, `varLangField27Val`, `varLangField28Val`, `varLangField29Val`, `varLangField30Val`, `varLangField31Val`, `varLangField32Val`, `varLangField33Val`, `varLangField34Val`, `varLangField35Val`, `varLangField36Val`, `varLangField37Val`, `varLangField38Val`, `varLangField39Val`, `varLangField40Val`, `breadcrumb01`, `breadcrumb02`, `breadcrumb03`, `breadcrumb04`, `breadcrumb05`, `breadcrumb06`, `breadcrumb07`, `breadcrumb01Val`, `breadcrumb02Val`, `breadcrumb03Val`, `breadcrumb04Val`, `breadcrumb05Val`, `breadcrumb06Val`, `breadcrumb07Val`, `geoData`, `score`, `varDimField01`, `varDimField01Val`, `varDimField02`, `varDimField02Val`, `varDimField03`, `varDimField03Val`, `varDimField04`, `varDimField04Val`, `varDimField05`, `varDimField05Val`, `varDimField06`, `varDimField06Val`, `varDimField07`, `varDimField07Val`, `varDimField08`, `varDimField08Val`, `importantInfo`"  +
                        ") VALUES ('#{captura}', '#{urlOrig}', '#{idLaunch}', '#{idCaptura}', '#{numPag}', '#{urlCaptura}', '#{fechaHora}', '#{numEntrada}', "  +
                        "'#{placeName}', '#{location}', '#{propertyType}', '#{reviewCount}', '#{globalScore}', '#{reviewCount_FilterAll}', '#{score_FilterAll}', '#{cleanScore_FilterAll}', '#{comfortScore_FilterAll}', '#{locationScore_FilterAll}', '#{facilitiesScore_FilterAll}', '#{staffScore_FilterAll}', '#{valueForMoneyScore_FilterAll}', '#{reviewCount_FilterFamily}', '#{score_FilterFamily}', '#{cleanScore_FilterFamily}', '#{comfortScore_FilterFamily}', '#{locationScore_FilterFamily}', '#{facilitiesScore_FilterFamily}', '#{staffScore_FilterFamily}', '#{valueForMoneyScore_FilterFamily}', '#{reviewCount_FilterCouple}', '#{score_FilterCouple}', '#{cleanScore_FilterCouple}', '#{comfortScore_FilterCouple}', '#{locationScore_FilterCouple}', '#{facilitiesScore_FilterCouple}', '#{staffScore_FilterCouple}', '#{valueForMoneyScore_FilterCouple}', '#{reviewCount_FilterGroupFriends}', '#{score_FilterGroupFriends}', '#{cleanScore_FilterGroupFriends}', '#{comfortScore_FilterGroupFriends}', '#{locationScore_FilterGroupFriends}', '#{facilitiesScore_FilterGroupFriends}', '#{staffScore_FilterGroupFriends}', '#{valueForMoneyScore_FilterGroupFriends}', '#{reviewCount_FilterSoloTravellers}', '#{score_FilterSoloTravellers}', '#{cleanScore_FilterSoloTravellers}', '#{comfortScore_FilterSoloTravellers}', '#{locationScore_FilterSoloTravellers}', '#{facilitiesScore_FilterSoloTravellers}', '#{staffScore_FilterSoloTravellers}', '#{valueForMoneyScore_FilterSoloTravellers}', '#{reviewCount_FilterBusinessTravellers}', '#{score_FilterBusinessTravellers}', '#{cleanScore_FilterBusinessTravellers}', '#{comfortScore_FilterBusinessTravellers}', '#{locationScore_FilterBusinessTravellers}', '#{facilitiesScore_FilterBusinessTravellers}', '#{staffScore_FilterBusinessTravellers}', '#{valueForMoneyScore_FilterBusinessTravellers}', '#{placeRating}', '#{geoLoc}', '#{bookButtonTitle}', '#{mainScore}', '#{value10_Text}', '#{value08_Text}', '#{value06_Text}', '#{value04_Text}', '#{value02_Text}', '#{value10_Value}', '#{value08_Value}', '#{value06_Value}', '#{value04_Value}', '#{value02_Value}', '#{varLangField01}', '#{varLangField02}', '#{varLangField03}', '#{varLangField04}', '#{varLangField05}', '#{varLangField06}', '#{varLangField07}', '#{varLangField08}', '#{varLangField09}', '#{varLangField10}', '#{varLangField11}', '#{varLangField12}', '#{varLangField13}', '#{varLangField14}', '#{varLangField15}', '#{varLangField16}', '#{varLangField17}', '#{varLangField18}', '#{varLangField19}', '#{varLangField20}', '#{varLangField21}', '#{varLangField22}', '#{varLangField23}', '#{varLangField24}', '#{varLangField25}', '#{varLangField26}', '#{varLangField27}', '#{varLangField28}', '#{varLangField29}', '#{varLangField30}', '#{varLangField31}', '#{varLangField32}', '#{varLangField33}', '#{varLangField34}', '#{varLangField35}', '#{varLangField36}', '#{varLangField37}', '#{varLangField38}', '#{varLangField39}', '#{varLangField40}', '#{varLangField01Val}', '#{varLangField02Val}', '#{varLangField03Val}', '#{varLangField04Val}', '#{varLangField05Val}', '#{varLangField06Val}', '#{varLangField07Val}', '#{varLangField08Val}', '#{varLangField09Val}', '#{varLangField10Val}', '#{varLangField11Val}', '#{varLangField12Val}', '#{varLangField13Val}', '#{varLangField14Val}', '#{varLangField15Val}', '#{varLangField16Val}', '#{varLangField17Val}', '#{varLangField18Val}', '#{varLangField19Val}', '#{varLangField20Val}', '#{varLangField21Val}', '#{varLangField22Val}', '#{varLangField23Val}', '#{varLangField24Val}', '#{varLangField25Val}', '#{varLangField26Val}', '#{varLangField27Val}', '#{varLangField28Val}', '#{varLangField29Val}', '#{varLangField30Val}', '#{varLangField31Val}', '#{varLangField32Val}', '#{varLangField33Val}', '#{varLangField34Val}', '#{varLangField35Val}', '#{varLangField36Val}', '#{varLangField37Val}', '#{varLangField38Val}', '#{varLangField39Val}', '#{varLangField40Val}', '#{breadcrumb01}', '#{breadcrumb02}', '#{breadcrumb03}', '#{breadcrumb04}', '#{breadcrumb05}', '#{breadcrumb06}', '#{breadcrumb07}', '#{breadcrumb01Val}', '#{breadcrumb02Val}', '#{breadcrumb03Val}', '#{breadcrumb04Val}', '#{breadcrumb05Val}', '#{breadcrumb06Val}', '#{breadcrumb07Val}', '#{geoData}', '#{score}', '#{varDimField01}', '#{varDimField01Val}', '#{varDimField02}', '#{varDimField02Val}', '#{varDimField03}', '#{varDimField03Val}', '#{varDimField04}', '#{varDimField04Val}', '#{varDimField05}', '#{varDimField05Val}', '#{varDimField06}', '#{varDimField06Val}', '#{varDimField07}', '#{varDimField07Val}', '#{varDimField08}', '#{varDimField08Val}', '#{importantInfo}'"  +
                        ")"
            puts(sqlInsert)
  ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    
            con.query(sqlInsert)
          end

        elsif descripcion.include? 'GMapsPlace.'

          posNode = 0
#INTRODUCIR PATH COLECCIÓN ITEMS
          nodes = @browser.divs(:xpath, "/*")
        
          puts("Node count: #{nodes.size}")
          nodes.each do |node|
            posNode += 1
                     
            captura = ""
            numPag = 0
            urlCaptura = ""
            fechaHora = ""
            numEntrada = 0

            nombre = ""
            valoracion = ""
            numOpiniones = ""
            tipo = ""
            tipo2 = ""
            valoracion2 = ""
            numOpiniones2 = ""
            numOpiniones_Val5 = ""
            numOpiniones_Val4 = ""
            numOpiniones_Val3 = ""
            numOpiniones_Val2 = ""
            numOpiniones_Val1 = ""
            address = ""
            horario = ""

            
            ignore_exception { captura = "#{descripcion}" }
            ignore_exception { urlOrig = con.quote("#{urlOrig}") }
            ignore_exception { idLaunch = "#{idLaunch}" }
            ignore_exception { idCaptura = "#{idCaptura}" }
            ignore_exception { numPag = "#{page}" }
            ignore_exception { urlCaptura = con.quote(@browser.url) }
            ignore_exception { fechaHora = "#{strDT}" }
            ignore_exception { numEntrada = "#{posNode}" }


            ignore_exception { nombre = con.quote(node.element(:xpath,"//div[contains(@class,'header')]//h1").text) }
            ignore_exception { valoracion = con.quote(node.element(:xpath,"//*[contains(@class,'section-rating')]//*[@class='section-star-display']").text) }
            ignore_exception { numOpiniones = con.quote(node.element(:xpath,"//span[@class='section-rating-term']//button[contains(@jsaction,'Reviews')]").text) }
            ignore_exception { tipo = con.quote(node.element(:xpath,"//span[@class='section-rating-term']//button[contains(@jsaction,'category')]").text) }
            ignore_exception { tipo2 = con.quote(node.element(:xpath,"(//li[@class='section-rating-term'])[2]//button/following-sibling::*[1]").text) }
            ignore_exception { valoracion2 = con.quote(node.element(:xpath,"//*[contains(@class,'section-reviewchart')]//*[@class='section-star-display']").text) }
            ignore_exception { numOpiniones2 = con.quote(node.element(:xpath,".//button[@class='section-reviewchart-numreviews']").text) }
            ignore_exception { numOpiniones_Val5 = con.quote(node.element(:xpath,"(//tr[contains(@class,'histogram')])[1]//div[@aria-label]").attribute_value('aria-label')) }
            ignore_exception { numOpiniones_Val4 = con.quote(node.element(:xpath,"(//tr[contains(@class,'histogram')])[2]//div[@aria-label]").attribute_value('aria-label')) }
            ignore_exception { numOpiniones_Val3 = con.quote(node.element(:xpath,"(//tr[contains(@class,'histogram')])[3]//div[@aria-label]").attribute_value('aria-label')) }
            ignore_exception { numOpiniones_Val2 = con.quote(node.element(:xpath,"(//tr[contains(@class,'histogram')])[4]//div[@aria-label]").attribute_value('aria-label')) }
            ignore_exception { numOpiniones_Val1 = con.quote(node.element(:xpath,"(//tr[contains(@class,'histogram')])[5]//div[@aria-label]").attribute_value('aria-label')) }
            ignore_exception { address = con.quote(node.element(:xpath,"(//span[@class='section-info-text'])[1]/span[last()]").text) }
            ignore_exception { horario = con.quote(node.element(:xpath,"//*[@class='section-info-hour-text']").text) }
      


    
            sqlInsert = "INSERT INTO `Navigator`.`tblDataGMFicha` (`captura`, `urlOrig`, `idLaunch`, `idCaptura`, `numPag`, `urlCaptura`, `fechaHora`, `numEntrada`, "  +
                        "`nombre`, `valoracion`, `numOpiniones`, `tipo`, `tipo2`, `valoracion2`, `numOpiniones2`, `numOpiniones_Val5`, `numOpiniones_Val4`, `numOpiniones_Val3`, `numOpiniones_Val2`, `numOpiniones_Val1`, `address`, `horario`"  +
                        ") VALUES ('#{captura}', '#{urlOrig}', '#{idLaunch}', '#{idCaptura}', '#{numPag}', '#{urlCaptura}', '#{fechaHora}', '#{numEntrada}', "  +
                        "'#{nombre}', '#{valoracion}', '#{numOpiniones}', '#{tipo}', '#{tipo2}', '#{valoracion2}', '#{numOpiniones2}', '#{numOpiniones_Val5}', '#{numOpiniones_Val4}', '#{numOpiniones_Val3}', '#{numOpiniones_Val2}', '#{numOpiniones_Val1}', '#{address}', '#{horario}'"  +
                        ")"
            puts(sqlInsert)
  ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    
            con.query(sqlInsert)
          end          



        elsif descripcion.include? 'GMapsPlaceFull.'

          posNode = 0
#INTRODUCIR PATH COLECCIÓN ITEMS
          nodes = @browser.divs(:xpath, "//div[contains(@class,'ripple-container') and @data-review-id]")
        
          puts("Node count: #{nodes.size}")
          nodes.each do |node|
            posNode += 1
                     
            captura = ""
            numPag = 0
            urlCaptura = ""
            fechaHora = ""
            numEntrada = 0

            dataReviewId = ""
            userLink = ""
            userIcon = ""
            nombre = ""
            userReviewCount = ""


            ignore_exception { captura = "#{descripcion}" }
            ignore_exception { urlOrig = "#{urlOrig.gsub("'", "%27")}" }
            ignore_exception { idLaunch = "#{idLaunch}" }
            ignore_exception { idCaptura = "#{idCaptura}" }
            ignore_exception { numPag = "#{page}" }
            ignore_exception { urlCaptura = @browser.url.gsub("'", "%27") }
            ignore_exception { fechaHora = "#{strDT}" }
            ignore_exception { numEntrada = "#{posNode}" }


            ignore_exception { dataReviewId = con.quote(node.element(:xpath,".").attribute_value('data-review-id')) }
            ignore_exception { userLink = con.quote(node.element(:xpath,".//div[@class='section-review-icon']/a").attribute_value('href')) }
            ignore_exception { userIcon = con.quote(node.element(:xpath,".//div[@class='section-review-icon']/a").attribute_value('style')) }
            ignore_exception { nombre = con.quote(node.element(:xpath,".//div[@class='section-review-title']/span").text) }
            ignore_exception { userReviewCount = con.quote(node.element(:xpath,".//div[@class='section-review-subtitle']").text) }
            
      


    
            sqlInsert = "INSERT INTO `Navigator`.`tblDataGMFullIndiv` (`captura`, `urlOrig`, `idLaunch`, `idCaptura`, `numPag`, `urlCaptura`, `fechaHora`, `numEntrada`, "  +
                        "`dataReviewId`, `userLink`, `userIcon`, `nombre`, `userReviewCount`"  +
                        ") VALUES ('#{captura}', '#{urlOrig}', '#{idLaunch}', '#{idCaptura}', '#{numPag}', '#{urlCaptura}', '#{fechaHora}', '#{numEntrada}', "  +
                        "'#{dataReviewId}', '#{userLink}', '#{userIcon}', '#{nombre}', '#{userReviewCount}'"  +
                        ")"
            puts(sqlInsert)
  ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    
            con.query(sqlInsert)
          end          




        elsif descripcion.include? 'TAGeo.'

          posNode = 0
#INTRODUCIR PATH COLECCIÓN ITEMS
          nodes = @browser.divs(:xpath, "/*")
        
          puts("Node count: #{nodes.size}")
          nodes.each do |node|
            posNode += 1
                     
            captura = ""
            numPag = 0
            urlCaptura = ""
            fechaHora = ""
            numEntrada = 0

            placeName = ""
            geoRef = ""


            ignore_exception { captura = "#{descripcion}" }
            ignore_exception { urlOrig = "#{urlOrig.gsub("'", "%27")}" }
            ignore_exception { idLaunch = "#{idLaunch}" }
            ignore_exception { idCaptura = "#{idCaptura}" }
            ignore_exception { numPag = "#{page}" }
            ignore_exception { urlCaptura = @browser.url.gsub("'", "%27") }
            ignore_exception { fechaHora = "#{strDT}" }
            ignore_exception { numEntrada = "#{posNode}" }


            ignore_exception { placeName = con.quote(node.element(:xpath,"//*[@id='global-nav-tourism']").text) }
            ignore_exception { geoRef = con.quote(node.element(:xpath,".//*[@data-map-position]").attribute_value('data-map-position')) }


    
            sqlInsert = "INSERT INTO `Navigator`.`tblDataTAGeos` (`captura`, `urlOrig`, `idLaunch`, `idCaptura`, `numPag`, `urlCaptura`, `fechaHora`, `numEntrada`, "  +
                        "`placeName`, `geoRef`"  +
                        ") VALUES ('#{captura}', '#{urlOrig}', '#{idLaunch}', '#{idCaptura}', '#{numPag}', '#{urlCaptura}', '#{fechaHora}', '#{numEntrada}', "  +
                        "'#{placeName}', '#{geoRef}'"  +
                        ")"
            puts(sqlInsert)
  ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    
            con.query(sqlInsert)
          end          





        elsif descripcion.include? 'TADataJSONAttractionAbout.'

          posNode = 0
#INTRODUCIR PATH COLECCIÓN ITEMS
          nodes = @browser.divs(:xpath, "/*")
        
          puts("Node count: #{nodes.size}")
          nodes.each do |node|
            posNode += 1
                     
            captura = ""
            numPag = 0
            urlCaptura = ""
            fechaHora = ""
            numEntrada = 0

            tid = ""
            taxonomyInfo1 = ""
            taxonomyInfo2 = ""
            taxonomyInfo3 = ""
            taxonomyInfo4 = ""
            taxonomyInfo5 = ""
            taxonomyInfo6 = ""
            taxonomyInfo7 = ""
            taxonomyInfo8 = ""
            taxonomyInfo9 = ""


            ignore_exception { captura = "#{descripcion}" }
            ignore_exception { urlOrig = "#{urlOrig.gsub("'", "%27")}" }
            ignore_exception { idLaunch = "#{idLaunch}" }
            ignore_exception { idCaptura = "#{idCaptura}" }
            ignore_exception { numPag = "#{page}" }
            ignore_exception { urlCaptura = @browser.url.gsub("'", "%27") }
            ignore_exception { fechaHora = "#{strDT}" }
            ignore_exception { numEntrada = "#{posNode}" }


ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

            tjson = ""
            ignore_exception { tjson = node.element(:xpath,"//pre").text }

puts(tjson);
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
            
            ojson = JSON.parse(tjson)
            
            ignore_exception { tid = con.quote(ojson['id'].to_s) }
            ignore_exception { taxonomyInfo1 = con.quote(ojson['taxonomyInfos'][0]['type'] + ":" + ojson['taxonomyInfos'][0]['name']) }
            ignore_exception { taxonomyInfo2 = con.quote(ojson['taxonomyInfos'][1]['type'] + ":" + ojson['taxonomyInfos'][1]['name']) }
            ignore_exception { taxonomyInfo3 = con.quote(ojson['taxonomyInfos'][2]['type'] + ":" + ojson['taxonomyInfos'][2]['name']) }
            ignore_exception { taxonomyInfo4 = con.quote(ojson['taxonomyInfos'][3]['type'] + ":" + ojson['taxonomyInfos'][3]['name']) }
            ignore_exception { taxonomyInfo5 = con.quote(ojson['taxonomyInfos'][4]['type'] + ":" + ojson['taxonomyInfos'][4]['name']) }
            ignore_exception { taxonomyInfo6 = con.quote(ojson['taxonomyInfos'][5]['type'] + ":" + ojson['taxonomyInfos'][5]['name']) }
            ignore_exception { taxonomyInfo7 = con.quote(ojson['taxonomyInfos'][6]['type'] + ":" + ojson['taxonomyInfos'][6]['name']) }
            ignore_exception { taxonomyInfo8 = con.quote(ojson['taxonomyInfos'][7]['type'] + ":" + ojson['taxonomyInfos'][7]['name']) }
            ignore_exception { taxonomyInfo9 = con.quote(ojson['taxonomyInfos'][8]['type'] + ":" + ojson['taxonomyInfos'][8]['name']) }


    
            sqlInsert = "INSERT INTO `Navigator`.`tblDataJSONAttractionAbout` (`captura`, `urlOrig`, `idLaunch`, `idCaptura`, `numPag`, `urlCaptura`, `fechaHora`, `numEntrada`, "  +
                        "`tid`, `taxonomyInfo1`, `taxonomyInfo2`, `taxonomyInfo3`, `taxonomyInfo4`, `taxonomyInfo5`, `taxonomyInfo6`, `taxonomyInfo7`, `taxonomyInfo8`, `taxonomyInfo9`"  +
                        ") VALUES ('#{captura}', '#{urlOrig}', '#{idLaunch}', '#{idCaptura}', '#{numPag}', '#{urlCaptura}', '#{fechaHora}', '#{numEntrada}', "  +
                        "'#{tid}', '#{taxonomyInfo1}', '#{taxonomyInfo2}', '#{taxonomyInfo3}', '#{taxonomyInfo4}', '#{taxonomyInfo5}', '#{taxonomyInfo6}', '#{taxonomyInfo7}', '#{taxonomyInfo8}', '#{taxonomyInfo9}'"  +
                        ")"
            puts(sqlInsert)
  ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    
            con.query(sqlInsert)
          end          





        elsif descripcion.include? 'TADataJSONLocation.'

          posNode = 0
#INTRODUCIR PATH COLECCIÓN ITEMS
          nodes = @browser.divs(:xpath, "/*")
        
          puts("Node count: #{nodes.size}")
          nodes.each do |node|
            posNode += 1
                     
            captura = ""
            numPag = 0
            urlCaptura = ""
            fechaHora = ""
            numEntrada = 0

            location_id = ""
            name = ""
            latitude = ""
            longitude = ""
            num_reviews = ""
            timezone = ""
            location_string = ""
            awards = ""
            doubleclick_zone = ""
            preferred_map_engine = ""
            raw_ranking = ""
            ranking_geo = ""
            ranking_geo_id = ""
            ranking_position = ""
            ranking_denominator = ""
            ranking_category = ""
            ranking = ""
            distance = ""
            distance_string = ""
            bearing = ""
            rating = ""
            is_closed = ""
            open_now_text = ""
            is_long_closed = ""
            price_level = ""
            price = ""
            neighborhood_info = ""
            description = ""
            web_url = ""
            write_review = ""
            ancestors = ""
            category = ""
            subcategory = ""
            parent_display_name = ""
            is_jfy_enabled = ""
            nearest_metro_station = ""
            phone = ""
            website = ""
            email = ""
            address_obj = ""
            address = ""
            hours = ""
            is_candidate_for_contact_info_suppression = ""
            cuisine = ""
            dietary_restrictions = ""
            photo = ""
            tags = ""
            display_hours = ""
            subcategory_type = ""
            subcategory_type_label = ""
            hotel_class = ""
            hotel_class_attribution = ""
            business_listings = ""
            special_offers = ""
            amenities = ""
            location_subtype = ""
            subcategory_ranking = ""
            fee = ""


            ignore_exception { captura = "#{descripcion}" }
            ignore_exception { urlOrig = "#{urlOrig.gsub("'", "%27")}" }
            ignore_exception { idLaunch = "#{idLaunch}" }
            ignore_exception { idCaptura = "#{idCaptura}" }
            ignore_exception { numPag = "#{page}" }
            ignore_exception { urlCaptura = @browser.url.gsub("'", "%27") }
            ignore_exception { fechaHora = "#{strDT}" }
            ignore_exception { numEntrada = "#{posNode}" }


ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

            tjson = ""
            ignore_exception { tjson = node.element(:xpath,"//pre").text }
 puts(tjson);
 begin
  puts ""
  puts "puts(puts(tjson));"
  puts(puts(tjson));
  puts ""
 rescue
   #fail
 end
 

ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

#           tjson.delete! '\\'

#puts(tjson);
#ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
            
            
            ojson = JSON.parse(tjson)
            
            ignore_exception { location_id = con.quote(ojson['location_id']) }
            ignore_exception { name = con.quote(ojson['name']) }
            ignore_exception { latitude = con.quote(ojson['latitude']) }
            ignore_exception { longitude = con.quote(ojson['longitude']) }
            ignore_exception { num_reviews = con.quote(ojson['num_reviews']) }
            ignore_exception { timezone = con.quote(ojson['timezone']) }
            ignore_exception { location_string = con.quote(ojson['location_string']) }
            ignore_exception { awards = con.quote(ojson['awards']) }
            ignore_exception { doubleclick_zone = con.quote(ojson['doubleclick_zone']) }
            ignore_exception { preferred_map_engine = con.quote(ojson['preferred_map_engine']) }
            ignore_exception { raw_ranking = con.quote(ojson['raw_ranking']) }
            ignore_exception { ranking_geo = con.quote(ojson['ranking_geo']) }
            ignore_exception { ranking_geo_id = con.quote(ojson['ranking_geo_id']) }
            ignore_exception { ranking_position = con.quote(ojson['ranking_position']) }
            ignore_exception { ranking_denominator = con.quote(ojson['ranking_denominator']) }
            ignore_exception { ranking_category = con.quote(ojson['ranking_category']) }
            ignore_exception { ranking = con.quote(ojson['ranking']) }
            ignore_exception { distance = con.quote(ojson['distance']) }
            ignore_exception { distance_string = con.quote(ojson['distance_string']) }
            ignore_exception { bearing = con.quote(ojson['bearing']) }
            ignore_exception { rating = con.quote(ojson['rating']) }
            ignore_exception { is_closed = con.quote(ojson['is_closed']) }
            ignore_exception { open_now_text = con.quote(ojson['open_now_text']) }
            ignore_exception { is_long_closed = con.quote(ojson['is_long_closed']) }
            ignore_exception { price_level = con.quote(ojson['price_level']) }
            ignore_exception { price = con.quote(ojson['price']) }
            ignore_exception { neighborhood_info = con.quote(ojson['neighborhood_info']) }
            ignore_exception { description = con.quote(ojson['description']) }
            ignore_exception { web_url = con.quote(ojson['web_url']) }
            ignore_exception { write_review = con.quote(ojson['write_review']) }
            ignore_exception { ancestors = con.quote(ojson['ancestors']) }
            ignore_exception { category = con.quote(ojson['category']) }
            ignore_exception { subcategory = con.quote(ojson['subcategory']) }
            ignore_exception { parent_display_name = con.quote(ojson['parent_display_name']) }
            ignore_exception { is_jfy_enabled = con.quote(ojson['is_jfy_enabled']) }
            ignore_exception { nearest_metro_station = con.quote(ojson['nearest_metro_station']) }
            ignore_exception { phone = con.quote(ojson['phone']) }
            ignore_exception { website = con.quote(ojson['website']) }
            ignore_exception { email = con.quote(ojson['email']) }
            ignore_exception { address_obj = con.quote(ojson['address_obj']) }
            ignore_exception { address = con.quote(ojson['address']) }
            ignore_exception { hours = con.quote(ojson['hours']) }
            ignore_exception { is_candidate_for_contact_info_suppression = con.quote(ojson['is_candidate_for_contact_info_suppression']) }
            ignore_exception { cuisine = con.quote(ojson['cuisine']) }
            ignore_exception { dietary_restrictions = con.quote(ojson['dietary_restrictions']) }
            ignore_exception { photo = con.quote(ojson['photo']) }
            ignore_exception { tags = con.quote(ojson['tags']) }
            ignore_exception { display_hours = con.quote(ojson['display_hours']) }
            ignore_exception { subcategory_type = con.quote(ojson['subcategory_type']) }
            ignore_exception { subcategory_type_label = con.quote(ojson['subcategory_type_label']) }
            ignore_exception { hotel_class = con.quote(ojson['hotel_class']) }
            ignore_exception { hotel_class_attribution = con.quote(ojson['hotel_class_attribution']) }
            ignore_exception { business_listings = con.quote(ojson['business_listings']) }
            ignore_exception { special_offers = con.quote(ojson['special_offers']) }
            ignore_exception { amenities = con.quote(ojson['amenities']) }
            ignore_exception { location_subtype = con.quote(ojson['location_subtype']) }
            ignore_exception { subcategory_ranking = con.quote(ojson['subcategory_ranking']) }
            ignore_exception { fee = con.quote(ojson['fee']) }


    
            sqlInsert = "INSERT INTO `Navigator`.`tblDataJSONLocation` (`captura`, `urlOrig`, `idLaunch`, `idCaptura`, `numPag`, `urlCaptura`, `fechaHora`, `numEntrada`, "  +
                        "`location_id`, `name`, `latitude`, `longitude`, `num_reviews`, `timezone`, `location_string`, `awards`, `doubleclick_zone`, `preferred_map_engine`, `raw_ranking`, `ranking_geo`, `ranking_geo_id`, `ranking_position`, `ranking_denominator`, `ranking_category`, `ranking`, `distance`, `distance_string`, `bearing`, `rating`, `is_closed`, `open_now_text`, `is_long_closed`, `price_level`, `price`, `neighborhood_info`, `description`, `web_url`, `write_review`, `ancestors`, `category`, `subcategory`, `parent_display_name`, `is_jfy_enabled`, `nearest_metro_station`, `phone`, `website`, `email`, `address_obj`, `address`, `hours`, `is_candidate_for_contact_info_suppression`, `cuisine`, `dietary_restrictions`, `photo`, `tags`, `display_hours`, `subcategory_type`, `subcategory_type_label`, `hotel_class`, `hotel_class_attribution`, `business_listings`, `special_offers`, `amenities`, `location_subtype`, `subcategory_ranking`, `fee`"  +
                        ") VALUES ('#{captura}', '#{urlOrig}', '#{idLaunch}', '#{idCaptura}', '#{numPag}', '#{urlCaptura}', '#{fechaHora}', '#{numEntrada}', "  +
                        "'#{location_id}', '#{name}', '#{latitude}', '#{longitude}', '#{num_reviews}', '#{timezone}', '#{location_string}', '#{awards}', '#{doubleclick_zone}', '#{preferred_map_engine}', '#{raw_ranking}', '#{ranking_geo}', '#{ranking_geo_id}', '#{ranking_position}', '#{ranking_denominator}', '#{ranking_category}', '#{ranking}', '#{distance}', '#{distance_string}', '#{bearing}', '#{rating}', '#{is_closed}', '#{open_now_text}', '#{is_long_closed}', '#{price_level}', '#{price}', '#{neighborhood_info}', '#{description}', '#{web_url}', '#{write_review}', '#{ancestors}', '#{category}', '#{subcategory}', '#{parent_display_name}', '#{is_jfy_enabled}', '#{nearest_metro_station}', '#{phone}', '#{website}', '#{email}', '#{address_obj}', '#{address}', '#{hours}', '#{is_candidate_for_contact_info_suppression}', '#{cuisine}', '#{dietary_restrictions}', '#{photo}', '#{tags}', '#{display_hours}', '#{subcategory_type}', '#{subcategory_type_label}', '#{hotel_class}', '#{hotel_class_attribution}', '#{business_listings}', '#{special_offers}', '#{amenities}', '#{location_subtype}', '#{subcategory_ranking}', '#{fee}'"  +
                        ")"
            puts(sqlInsert)
  ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    
            con.query(sqlInsert)
          end          





        elsif descripcion.include? 'GMapsPlaceSearchLocalReviews.'

          posNode = 0
#INTRODUCIR PATH COLECCIÓN ITEMS
          nodes = @browser.divs(:xpath, "//div[@class='gws-plugins-local-reviews-client-basic-reviews_leaf_page__dialog-list']/div/div")
        
          puts("Node count: #{nodes.size}")
          nodes.each do |node|
            posNode += 1
                     
            captura = ""
            numPag = 0
            urlCaptura = ""
            fechaHora = ""
            numEntrada = 0


            userLink = ""
            userName = ""
            reviewDate = ""
            reviewStars = ""
            reviewText = ""
            flagLink = ""
            reviewScore = ""
            responseTitle = ""
            responseDate = ""
            responseText = ""


            ignore_exception { captura = "#{descripcion}" }
            ignore_exception { urlOrig = "#{urlOrig.gsub("'", "%27")}" }
            ignore_exception { idLaunch = "#{idLaunch}" }
            ignore_exception { idCaptura = "#{idCaptura}" }
            ignore_exception { numPag = "#{page}" }
            ignore_exception { urlCaptura = @browser.url.gsub("'", "%27") }
            ignore_exception { fechaHora = "#{strDT}" }
            ignore_exception { numEntrada = "#{posNode}" }


            ignore_exception { userLink = con.quote(node.element(:xpath,"./img").attribute_value('src')) }
            ignore_exception { userName = con.quote(node.element(:xpath,"./div/div[1]").text) }
            ignore_exception { reviewDate = con.quote(node.element(:xpath,"./div/div[2]/span[1]").text) }
            ignore_exception { reviewScore = con.quote(node.element(:xpath,".//g-review-stars/span").attribute_value('aria-label')) }
            ignore_exception { reviewText = con.quote(node.element(:xpath,"./div/div[3]/div/span").text) }
            ignore_exception { flagLink = con.quote(node.element(:xpath,"./div/div[2]/span[2]/a").attribute_value('href')) }
            ignore_exception { reviewScore = con.quote(node.element(:xpath,".//g-review-stars/span").attribute_value('aria-label')) }
            ignore_exception { responseTitle = con.quote(node.element(:xpath,"./div[2]/div/strong").text) }
            ignore_exception { responseDate = con.quote(node.element(:xpath,"./div[2]/div/span").text) }
            ignore_exception { responseText = con.quote(node.element(:xpath,"./div[2]").text) }
            
      


    
            sqlInsert = "INSERT INTO `Navigator`.`tblGMapsPlaceSLReviews` (`captura`, `urlOrig`, `idLaunch`, `idCaptura`, `numPag`, `urlCaptura`, `fechaHora`, `numEntrada`, "  +
                        "`userLink`, `userName`, `reviewDate`, `reviewStars`, `reviewText`, `flagLink`, `reviewScore`, `responseTitle`, `responseDate`, `responseText`"  +
                        ") VALUES ('#{captura}', '#{urlOrig}', '#{idLaunch}', '#{idCaptura}', '#{numPag}', '#{urlCaptura}', '#{fechaHora}', '#{numEntrada}', "  +
                        "'#{userLink}', '#{userName}', '#{reviewDate}', '#{reviewStars}', '#{reviewText}', '#{flagLink}', '#{reviewScore}', '#{responseTitle}', '#{responseDate}', '#{responseText}'"  +
                        ")"
            puts(sqlInsert)
  ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    
            con.query(sqlInsert)
          end          






        elsif descripcion.include? 'GMapsReviewBox.'

          posNode = 0
#INTRODUCIR PATH COLECCIÓN ITEMS
          nodes = @browser.divs(:xpath, "//div[@data-next-page-token]/div")
        
          puts("Node count: #{nodes.size}")
          nodes.each do |node|
            posNode += 1
                     
            captura = ""
            numPag = 0
            urlCaptura = ""
            fechaHora = ""
            numEntrada = 0


            userLink = ""
            userName = ""
            reviewLink = ""
            reviewDate = ""
            reviewStars = ""
            reviewText = ""
            flagLink = ""
            reviewScore = ""
            responseTitle = ""
            responseDate = ""
            responseText = ""


            ignore_exception { captura = "#{descripcion}" }
            ignore_exception { urlOrig = "#{urlOrig.gsub("'", "%27")}" }
            ignore_exception { idLaunch = "#{idLaunch}" }
            ignore_exception { idCaptura = "#{idCaptura}" }
            ignore_exception { numPag = "#{page}" }
            ignore_exception { urlCaptura = @browser.url.gsub("'", "%27") }
            ignore_exception { fechaHora = "#{strDT}" }
            ignore_exception { numEntrada = "#{posNode}" }


            ignore_exception { userLink = con.quote(node.element(:xpath,".//img").attribute_value('src')) }
            ignore_exception { userName = con.quote(node.element(:xpath,"./div[1]/div[1]/a[1]").text) }
            ignore_exception { reviewLink = con.quote(node.element(:xpath,"./div[1]/div[1]/a[1]").attribute_value('href')) }
            ignore_exception { reviewDate = con.quote(node.element(:xpath,"./div[1]/div[3]/div[1]/span[1]").text) }
            ignore_exception { reviewScore = con.quote(node.element(:xpath,".//g-review-stars/div/div").attribute_value('style')) }
            ignore_exception { reviewText = con.quote(node.element(:xpath,"./div[1]/div[3]/div[2]//span[not(./span or contains(@class,'review-snippet'))]").text) }
            ignore_exception { flagLink = con.quote(node.element(:xpath,"./div[1]/div[3]/div[1]/span[3]/a[1]").attribute_value('href')) }
            ignore_exception { responseTitle = con.quote(node.element(:xpath,"./div[3]/div[1]/strong[1]").text) }
            ignore_exception { responseDate = con.quote(node.element(:xpath,"./div[3]/div[1]/span[2]").text) }
            ignore_exception { responseText = con.quote(node.element(:xpath,"./div[3]/div[2]/span[last()]").text) }
            
      
            sqlInsert = "INSERT INTO `Navigator`.`tblGMapsPlaceSLReviews` (`captura`, `urlOrig`, `idLaunch`, `idCaptura`, `numPag`, `urlCaptura`, `fechaHora`, `numEntrada`, "  +
                        "`userLink`, `userName`, `reviewLink`, `reviewDate`, `reviewStars`, `reviewText`, `flagLink`, `reviewScore`, `responseTitle`, `responseDate`, `responseText`"  +
                        ") VALUES ('#{captura}', '#{urlOrig}', '#{idLaunch}', '#{idCaptura}', '#{numPag}', '#{urlCaptura}', '#{fechaHora}', '#{numEntrada}', "  +
                        "'#{userLink}', '#{userName}', '#{reviewLink}', '#{reviewDate}', '#{reviewStars}', '#{reviewText}', '#{flagLink}', '#{reviewScore}', '#{responseTitle}', '#{responseDate}', '#{responseText}'"  +
                        ")"
            puts(sqlInsert)
  ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    
            con.query(sqlInsert)
          end          









        elsif descripcion.include? 'TripadvisorHeaderFicha.'

          posNode = 0
#INTRODUCIR PATH COLECCIÓN ITEMS
          nodes = @browser.divs(:xpath, "/*")
        
          puts("Node count: #{nodes.size}")
          nodes.each do |node|
            posNode += 1
                     
            captura = ""
            numPag = 0
            urlCaptura = ""
            fechaHora = ""
            numEntrada = 0

      placeName = ""
      award_text = ""
      award_class = ""
      certificadoExcelencia = ""
      fullAddress = ""
      postalCode = ""
      locality = ""
      phone = ""
      placeRating = ""
      globalScore = ""
      reviewCount = ""
      infoRanking = ""
      placeType = ""
      geoLat = ""
      geoLng = ""
      linkPrimeraReview = ""
      currentPage = ""
      cuisine = ""
      langList = ""
      langSelected = ""
      segmSelected = ""
      filterSegment = ""
      filterCount = ""
      langFromRadioButtons = ""
      recommendedPercent2 = ""
      sorting = ""
      value5_Count = ""
      value4_Count = ""
      value3_Count = ""
      value2_Count = ""
      value1_Count = ""
      timeOfYear1_Count = ""
      timeOfYear2_Count = ""
      timeOfYear3_Count = ""
      timeOfYear4_Count = ""
      varDimField1 = ""
      varDimField1Val = ""
      varDimField2 = ""
      varDimField2Val = ""
      varDimField3 = ""
      varDimField3Val = ""
      varDimField4 = ""
      varDimField4Val = ""
      varDimField5 = ""
      varDimField5Val = ""
      varDimField6 = ""
      varDimField6Val = ""
      varDimField7 = ""
      varDimField7Val = ""
      varDimField8 = ""
      varDimField8Val = ""
      varDimField9 = ""
      varDimField9Val = ""
      varDimField10 = ""
      varDimField10Val = ""
      varDimField11 = ""
      varDimField11Val = ""
      varDimField12 = ""
      varDimField12Val = ""
      varSegmField1 = ""
      varSegmField1Val = ""
      varSegmField2 = ""
      varSegmField2Val = ""
      varSegmField3 = ""
      varSegmField3Val = ""
      varSegmField4 = ""
      varSegmField4Val = ""
      varSegmField5 = ""
      varSegmField5Val = ""
      varSegmField6 = ""
      varSegmField6Val = ""
      codeMap = ""
      peineNotas5 = ""
      peineNotas4 = ""
      peineNotas3 = ""
      peineNotas2 = ""
      peineNotas1 = ""
      varLangField01 = ""
      varLangField01Val = ""
      varLangField02 = ""
      varLangField02Val = ""
      varLangField03 = ""
      varLangField03Val = ""
      varLangField04 = ""
      varLangField04Val = ""
      varLangField05 = ""
      varLangField05Val = ""
      varLangField06 = ""
      varLangField06Val = ""
      varLangField07 = ""
      varLangField07Val = ""
      varLangField08 = ""
      varLangField08Val = ""
      varLangField09 = ""
      varLangField09Val = ""
      varLangField10 = ""
      varLangField10Val = ""
      varLangField11 = ""
      varLangField11Val = ""
      varLangField12 = ""
      varLangField12Val = ""
      varLangField13 = ""
      varLangField13Val = ""
      varLangField14 = ""
      varLangField14Val = ""
      varLangField15 = ""
      varLangField15Val = ""
      varLangField16 = ""
      varLangField16Val = ""
      varLangField17 = ""
      varLangField17Val = ""
      varLangField18 = ""
      varLangField18Val = ""
      varLangField19 = ""
      varLangField19Val = ""
      varLangField20 = ""
      varLangField20Val = ""
      varLangField21 = ""
      varLangField21Val = ""
      varLangField22 = ""
      varLangField22Val = ""
      varLangField23 = ""
      varLangField23Val = ""
      varLangField24 = ""
      varLangField24Val = ""
      varLangField25 = ""
      varLangField25Val = ""
      varLangField26 = ""
      varLangField26Val = ""
      varLangField27 = ""
      varLangField27Val = ""
      varLangField28 = ""
      varLangField28Val = ""
      varLangField29 = ""
      varLangField29Val = ""
      varLangField30 = ""
      varLangField30Val = ""
      langSelected2 = ""


  
            ignore_exception { captura = "#{descripcion}" }
            ignore_exception { urlOrig = "#{urlOrig}" }
            ignore_exception { idLaunch = "#{idLaunch}" }
            ignore_exception { idCaptura = "#{idCaptura}" }
            ignore_exception { numPag = "#{page}" }
            ignore_exception { urlCaptura = @browser.url }
            ignore_exception { fechaHora = "#{strDT}" }
            ignore_exception { numEntrada = "#{posNode}" }


      ignore_exception { placeName = con.quote(node.element(:xpath,"//*[@id='HEADING']").text) }
      ignore_exception { award_text = con.quote(node.element(:xpath,"(//img[contains(@class,'Award')])[1]").attribute_value('alt')) }
      ignore_exception { award_class = con.quote(node.element(:xpath,"(//img[contains(@class,'Award')])[1]").attribute_value('class')) }
      ignore_exception { certificadoExcelencia = con.quote(node.element(:xpath,"//*[contains(@class,'badge')]/*[@class='badgeText']").text) }
      ignore_exception { fullAddress = con.quote(node.element(:xpath,"(.//*[starts-with(./@class,'blEntry address')] | //address)[1]").text) }
      ignore_exception { postalCode = con.quote(node.element(:xpath,"(//*[contains(@property,'postal-code') or contains(@property,'postalCode')])[1]").text) }
      ignore_exception { locality = con.quote(node.element(:xpath,"(//*[@property='addressLocality' or @property='v:locality'])[1]").text) }
      ignore_exception { phone = con.quote(node.element(:xpath,"//*[contains(@class,'ui_icon phone')]/following-sibling::*[1]").text) }
      ignore_exception { placeRating = con.quote(node.element(:xpath,"//*[starts-with(@class,'starRating')]/div[2]/text() | //span[@class='star']//img").attribute_value('alt')) }
      ignore_exception { globalScore = con.quote(node.element(:xpath,"//*[contains(@class,'rs rating')]//span").attribute_value('alt')) }
      ignore_exception { reviewCount = con.quote(node.element(:xpath,"//*[contains(@class,'rs rating')]//a").text) }
      ignore_exception { infoRanking = con.quote(node.element(:xpath,"//*[starts-with(@class,'slim_ranking') or starts-with(@class,'header_popularity')]").text) }
      ignore_exception { placeType = con.quote(node.element(:xpath,"//*[@class='placeTypeText']").text) }
      ignore_exception { geoLat = con.quote(node.element(:xpath,"//*[contains(@class,'mapContainer')]").attribute_value('data-lat')) }
      ignore_exception { geoLng = con.quote(node.element(:xpath,"//*[contains(@class,'mapContainer')]").attribute_value('data-lng')) }
      ignore_exception { linkPrimeraReview = con.quote(node.element(:xpath,"(//*[@id='REVIEWS']//div[starts-with(@id,'review_')])[1]/div[not(@style='display: none;')]//a[@id]").attribute_value('href')) }
      ignore_exception { currentPage = con.quote(node.element(:xpath,".//*[@class='pageNum current']").text) }
      ignore_exception { cuisine = con.quote(node.element(:xpath,"//*[starts-with(@class,'header_links')]").text) }
      ignore_exception { langList = con.quote(node.element(:xpath,"//*[@id='filterLang']/option").attribute_value('value')) }
      ignore_exception { langSelected = con.quote(node.element(:xpath,".//*[@id='filterControls']//*[contains(@class,'language')]/ul/li[./span/input/@checked]/label").text) }
      ignore_exception { segmSelected = con.quote(node.element(:xpath,".//*[@id='filterControls']//*[contains(@class,'segment')]/ul/li[./span/input/@checked]/label").text) }
      ignore_exception { filterSegment = con.quote(node.element(:xpath,"//span[@class='filter']").text) }
      ignore_exception { filterCount = con.quote(node.element(:xpath,"//span[@class='filter']/preceding-sibling::b[1]").text) }
      ignore_exception { langFromRadioButtons = con.quote(node.element(:xpath,".//*[contains(@class,'language')]/ul/li[./span/input/@checked]/label").text) }
      ignore_exception { recommendedPercent2 = con.quote(node.element(:xpath,"//fieldset[@class='review_filter_eatery']/div/div[1]/div").text) }
      ignore_exception { sorting = con.quote(node.element(:xpath,"//fieldset/span[contains(@class,'selected')]").text) }
      ignore_exception { value5_Count = con.quote(node.element(:xpath,"(//*[@data-name='ta_rating']/div[1] | //label[contains(@for,'filterRating_5')])/span[last()]").text) }
      ignore_exception { value4_Count = con.quote(node.element(:xpath,"(//*[@data-name='ta_rating']/div[2] | //label[contains(@for,'filterRating_4')])/span[last()]").text) }
      ignore_exception { value3_Count = con.quote(node.element(:xpath,"(//*[@data-name='ta_rating']/div[3] | //label[contains(@for,'filterRating_3')])/span[last()]").text) }
      ignore_exception { value2_Count = con.quote(node.element(:xpath,"(//*[@data-name='ta_rating']/div[4] | //label[contains(@for,'filterRating_2')])/span[last()]").text) }
      ignore_exception { value1_Count = con.quote(node.element(:xpath,"(//*[@data-name='ta_rating']/div[5] | //label[contains(@for,'filterRating_1')])/span[last()]").text) }
      ignore_exception { timeOfYear1_Count = con.quote(node.element(:xpath,"//*[starts-with(@class,'col season')]/ul/li[1]/label").text) }
      ignore_exception { timeOfYear2_Count = con.quote(node.element(:xpath,"//*[starts-with(@class,'col season')]/ul/li[2]/label").text) }
      ignore_exception { timeOfYear3_Count = con.quote(node.element(:xpath,"//*[starts-with(@class,'col season')]/ul/li[3]/label").text) }
      ignore_exception { timeOfYear4_Count = con.quote(node.element(:xpath,"//*[starts-with(@class,'col season')]/ul/li[4]/label").text) }
      ignore_exception { varDimField1 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[1]").text) }
      ignore_exception { varDimField1Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[1]").attribute_value('alt')) }
      ignore_exception { varDimField2 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[2]").text) }
      ignore_exception { varDimField2Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[2]").attribute_value('alt')) }
      ignore_exception { varDimField3 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[3]").text) }
      ignore_exception { varDimField3Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[3]").attribute_value('alt')) }
      ignore_exception { varDimField4 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[4]").text) }
      ignore_exception { varDimField4Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[4]").attribute_value('alt')) }
      ignore_exception { varDimField5 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[5]").text) }
      ignore_exception { varDimField5Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[5]").attribute_value('alt')) }
      ignore_exception { varDimField6 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[6]").text) }
      ignore_exception { varDimField6Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[6]").attribute_value('alt')) }
      ignore_exception { varDimField7 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[7]").text) }
      ignore_exception { varDimField7Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[7]").attribute_value('alt')) }
      ignore_exception { varDimField8 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[8]").text) }
      ignore_exception { varDimField8Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[8]").attribute_value('alt')) }
      ignore_exception { varDimField9 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[9]").text) }
      ignore_exception { varDimField9Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[9]").attribute_value('alt')) }
      ignore_exception { varDimField10 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[10]").text) }
      ignore_exception { varDimField10Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[10]").attribute_value('alt')) }
      ignore_exception { varDimField11 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[11]").text) }
      ignore_exception { varDimField11Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[11]").attribute_value('alt')) }
      ignore_exception { varDimField12 = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/div | //*[@class='ratingSummary wrap']//li//span[@class='text'])[12]").text) }
      ignore_exception { varDimField12Val = con.quote(node.element(:xpath,"(//*[@id='SUMMARYBOX']/ul/li/span/span | //*[@class='ratingSummary wrap']//li//span)[12]").attribute_value('alt')) }
      ignore_exception { varSegmField1 = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[1]/div/div[1]").text) }
      ignore_exception { varSegmField1Val = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[1]/div/div[2]").text) }
      ignore_exception { varSegmField2 = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[2]/div/div[1]").text) }
      ignore_exception { varSegmField2Val = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[2]/div/div[2]").text) }
      ignore_exception { varSegmField3 = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[3]/div/div[1]").text) }
      ignore_exception { varSegmField3Val = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[3]/div/div[2]").text) }
      ignore_exception { varSegmField4 = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[4]/div/div[1]").text) }
      ignore_exception { varSegmField4Val = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[4]/div/div[2]").text) }
      ignore_exception { varSegmField5 = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[5]/div/div[1]").text) }
      ignore_exception { varSegmField5Val = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[5]/div/div[2]").text) }
      ignore_exception { varSegmField6 = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[6]/div/div[1]").text) }
      ignore_exception { varSegmField6Val = con.quote(node.element(:xpath,"(//*[@class='trip_type']/div[starts-with(@class,'segment')])[6]/div/div[2]").text) }
      ignore_exception { codeMap = con.quote(node.element(:xpath,"//*[contains(@src,'center=')]").attribute_value('src')) }
      ignore_exception { peineNotas5 = con.quote(node.element(:xpath,"(//*[contains(text(),'ler rating')]/..//input[1])[1]").attribute_value('checked')) }
      ignore_exception { peineNotas4 = con.quote(node.element(:xpath,"(//*[contains(text(),'ler rating')]/..//input[1])[2]").attribute_value('checked')) }
      ignore_exception { peineNotas3 = con.quote(node.element(:xpath,"(//*[contains(text(),'ler rating')]/..//input[1])[3]").attribute_value('checked')) }
      ignore_exception { peineNotas2 = con.quote(node.element(:xpath,"(//*[contains(text(),'ler rating')]/..//input[1])[4]").attribute_value('checked')) }
      ignore_exception { peineNotas1 = con.quote(node.element(:xpath,"(//*[contains(text(),'ler rating')]/..//input[1])[5]").attribute_value('checked')) }
      ignore_exception { varLangField01 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[01]").attribute_value('value')) }
      ignore_exception { varLangField01Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[01]/..//following-sibling::label[1]").text) }
      ignore_exception { varLangField02 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[02]").attribute_value('value')) }
      ignore_exception { varLangField02Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[02]/..//following-sibling::label[1]").text) }
      ignore_exception { varLangField03 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[03]").attribute_value('value')) }
      ignore_exception { varLangField03Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[03]/..//following-sibling::label[1]").text) }
      ignore_exception { varLangField04 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[04]").attribute_value('value')) }
      ignore_exception { varLangField04Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[04]/..//following-sibling::label[1]").text) }
      ignore_exception { varLangField05 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[05]").attribute_value('value')) }
      ignore_exception { varLangField05Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[05]/..//following-sibling::label[1]").text) }
      ignore_exception { varLangField06 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[06]").attribute_value('value')) }
      ignore_exception { varLangField06Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[06]/..//following-sibling::label[1]").text) }
      ignore_exception { varLangField07 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[07]").attribute_value('value')) }
      ignore_exception { varLangField07Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[07]/..//following-sibling::label[1]").text) }
      ignore_exception { varLangField08 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[08]").attribute_value('value')) }
      ignore_exception { varLangField08Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[08]/..//following-sibling::label[1]").text) }
      ignore_exception { varLangField09 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[09]").attribute_value('value')) }
      ignore_exception { varLangField09Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[09]/..//following-sibling::label[1]").text) }
      ignore_exception { varLangField10 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[10]").attribute_value('value')) }
      ignore_exception { varLangField10Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[10]/..//following-sibling::label[1]").text) }
      ignore_exception { varLangField11 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[11]").attribute_value('value')) }
      ignore_exception { varLangField11Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[11]/..//following-sibling::label[1]").text) }
      ignore_exception { varLangField12 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[12]").attribute_value('value')) }
      ignore_exception { varLangField12Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[12]/..//following-sibling::label[1]").text) }
      ignore_exception { varLangField13 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[13]").attribute_value('value')) }
      ignore_exception { varLangField13Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[13]/..//following-sibling::label[1]").text) }
      ignore_exception { varLangField14 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[14]").attribute_value('value')) }
      ignore_exception { varLangField14Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[14]/..//following-sibling::label[1]").text) }
      ignore_exception { varLangField15 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[15]").attribute_value('value')) }
      ignore_exception { varLangField15Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[15]/..//following-sibling::label[1]").text) }
      ignore_exception { varLangField16 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[16]").attribute_value('value')) }
      ignore_exception { varLangField16Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[16]/..//following-sibling::label[1]").text) }
      ignore_exception { varLangField17 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[17]").attribute_value('value')) }
      ignore_exception { varLangField17Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[17]/..//following-sibling::label[1]").text) }
      ignore_exception { varLangField18 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[18]").attribute_value('value')) }
      ignore_exception { varLangField18Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[18]/..//following-sibling::label[1]").text) }
      ignore_exception { varLangField19 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[19]").attribute_value('value')) }
      ignore_exception { varLangField19Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[19]/..//following-sibling::label[1]").text) }
      ignore_exception { varLangField20 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[20]").attribute_value('value')) }
      ignore_exception { varLangField20Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[20]/..//following-sibling::label[1]").text) }
      ignore_exception { varLangField21 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[21]").attribute_value('value')) }
      ignore_exception { varLangField21Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[21]/..//following-sibling::label[1]").text) }
      ignore_exception { varLangField22 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[22]").attribute_value('value')) }
      ignore_exception { varLangField22Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[22]/..//following-sibling::label[1]").text) }
      ignore_exception { varLangField23 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[23]").attribute_value('value')) }
      ignore_exception { varLangField23Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[23]/..//following-sibling::label[1]").text) }
      ignore_exception { varLangField24 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[24]").attribute_value('value')) }
      ignore_exception { varLangField24Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[24]/..//following-sibling::label[1]").text) }
      ignore_exception { varLangField25 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[25]").attribute_value('value')) }
      ignore_exception { varLangField25Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[25]/..//following-sibling::label[1]").text) }
      ignore_exception { varLangField26 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[26]").attribute_value('value')) }
      ignore_exception { varLangField26Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[26]/..//following-sibling::label[1]").text) }
      ignore_exception { varLangField27 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[27]").attribute_value('value')) }
      ignore_exception { varLangField27Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[27]/..//following-sibling::label[1]").text) }
      ignore_exception { varLangField28 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[28]").attribute_value('value')) }
      ignore_exception { varLangField28Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[28]/..//following-sibling::label[1]").text) }
      ignore_exception { varLangField29 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[29]").attribute_value('value')) }
      ignore_exception { varLangField29Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[29]/..//following-sibling::label[1]").text) }
      ignore_exception { varLangField30 = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[30]").attribute_value('value')) }
      ignore_exception { varLangField30Val = con.quote(node.element(:xpath,"(//input[contains(@name,'filterLang') and ..//following-sibling::label])[30]/..//following-sibling::label[1]").text) }
      ignore_exception { langSelected2 = con.quote(node.element(:xpath,"//*[@data-name='language']/div[./input/@checked]/label").text) }
      


    
            sqlInsert = "INSERT INTO `Navigator`.`tblDataTAPeineFicha` (`captura`, `urlOrig`, `idLaunch`, `idCaptura`, `numPag`, `urlCaptura`, `fechaHora`, `numEntrada`, "  +
                        "`placeName`, `award_text`, `award_class`, `certificadoExcelencia`, `fullAddress`, `postalCode`, `locality`, `phone`, `placeRating`, `globalScore`, `reviewCount`, `infoRanking`, `placeType`, `geoLat`, `geoLng`, `linkPrimeraReview`, `currentPage`, `cuisine`, `langList`, `langSelected`, `segmSelected`, `filterSegment`, `filterCount`, `langFromRadioButtons`, `recommendedPercent2`, `sorting`, `value5_Count`, `value4_Count`, `value3_Count`, `value2_Count`, `value1_Count`, `timeOfYear1_Count`, `timeOfYear2_Count`, `timeOfYear3_Count`, `timeOfYear4_Count`, `varDimField1`, `varDimField1Val`, `varDimField2`, `varDimField2Val`, `varDimField3`, `varDimField3Val`, `varDimField4`, `varDimField4Val`, `varDimField5`, `varDimField5Val`, `varDimField6`, `varDimField6Val`, `varDimField7`, `varDimField7Val`, `varDimField8`, `varDimField8Val`, `varDimField9`, `varDimField9Val`, `varDimField10`, `varDimField10Val`, `varDimField11`, `varDimField11Val`, `varDimField12`, `varDimField12Val`, `varSegmField1`, `varSegmField1Val`, `varSegmField2`, `varSegmField2Val`, `varSegmField3`, `varSegmField3Val`, `varSegmField4`, `varSegmField4Val`, `varSegmField5`, `varSegmField5Val`, `varSegmField6`, `varSegmField6Val`, `codeMap`, `peineNotas5`, `peineNotas4`, `peineNotas3`, `peineNotas2`, `peineNotas1`, `varLangField01`, `varLangField01Val`, `varLangField02`, `varLangField02Val`, `varLangField03`, `varLangField03Val`, `varLangField04`, `varLangField04Val`, `varLangField05`, `varLangField05Val`, `varLangField06`, `varLangField06Val`, `varLangField07`, `varLangField07Val`, `varLangField08`, `varLangField08Val`, `varLangField09`, `varLangField09Val`, `varLangField10`, `varLangField10Val`, `varLangField11`, `varLangField11Val`, `varLangField12`, `varLangField12Val`, `varLangField13`, `varLangField13Val`, `varLangField14`, `varLangField14Val`, `varLangField15`, `varLangField15Val`, `varLangField16`, `varLangField16Val`, `varLangField17`, `varLangField17Val`, `varLangField18`, `varLangField18Val`, `varLangField19`, `varLangField19Val`, `varLangField20`, `varLangField20Val`, `varLangField21`, `varLangField21Val`, `varLangField22`, `varLangField22Val`, `varLangField23`, `varLangField23Val`, `varLangField24`, `varLangField24Val`, `varLangField25`, `varLangField25Val`, `varLangField26`, `varLangField26Val`, `varLangField27`, `varLangField27Val`, `varLangField28`, `varLangField28Val`, `varLangField29`, `varLangField29Val`, `varLangField30`, `varLangField30Val`, `langSelected2`"  +
                        ") VALUES ('#{captura}', '#{urlOrig}', '#{idLaunch}', '#{idCaptura}', '#{numPag}', '#{urlCaptura}', '#{fechaHora}', '#{numEntrada}', "  +
                        "'#{placeName}', '#{award_text}', '#{award_class}', '#{certificadoExcelencia}', '#{fullAddress}', '#{postalCode}', '#{locality}', '#{phone}', '#{placeRating}', '#{globalScore}', '#{reviewCount}', '#{infoRanking}', '#{placeType}', '#{geoLat}', '#{geoLng}', '#{linkPrimeraReview}', '#{currentPage}', '#{cuisine}', '#{langList}', '#{langSelected}', '#{segmSelected}', '#{filterSegment}', '#{filterCount}', '#{langFromRadioButtons}', '#{recommendedPercent2}', '#{sorting}', '#{value5_Count}', '#{value4_Count}', '#{value3_Count}', '#{value2_Count}', '#{value1_Count}', '#{timeOfYear1_Count}', '#{timeOfYear2_Count}', '#{timeOfYear3_Count}', '#{timeOfYear4_Count}', '#{varDimField1}', '#{varDimField1Val}', '#{varDimField2}', '#{varDimField2Val}', '#{varDimField3}', '#{varDimField3Val}', '#{varDimField4}', '#{varDimField4Val}', '#{varDimField5}', '#{varDimField5Val}', '#{varDimField6}', '#{varDimField6Val}', '#{varDimField7}', '#{varDimField7Val}', '#{varDimField8}', '#{varDimField8Val}', '#{varDimField9}', '#{varDimField9Val}', '#{varDimField10}', '#{varDimField10Val}', '#{varDimField11}', '#{varDimField11Val}', '#{varDimField12}', '#{varDimField12Val}', '#{varSegmField1}', '#{varSegmField1Val}', '#{varSegmField2}', '#{varSegmField2Val}', '#{varSegmField3}', '#{varSegmField3Val}', '#{varSegmField4}', '#{varSegmField4Val}', '#{varSegmField5}', '#{varSegmField5Val}', '#{varSegmField6}', '#{varSegmField6Val}', '#{codeMap}', '#{peineNotas5}', '#{peineNotas4}', '#{peineNotas3}', '#{peineNotas2}', '#{peineNotas1}', '#{varLangField01}', '#{varLangField01Val}', '#{varLangField02}', '#{varLangField02Val}', '#{varLangField03}', '#{varLangField03Val}', '#{varLangField04}', '#{varLangField04Val}', '#{varLangField05}', '#{varLangField05Val}', '#{varLangField06}', '#{varLangField06Val}', '#{varLangField07}', '#{varLangField07Val}', '#{varLangField08}', '#{varLangField08Val}', '#{varLangField09}', '#{varLangField09Val}', '#{varLangField10}', '#{varLangField10Val}', '#{varLangField11}', '#{varLangField11Val}', '#{varLangField12}', '#{varLangField12Val}', '#{varLangField13}', '#{varLangField13Val}', '#{varLangField14}', '#{varLangField14Val}', '#{varLangField15}', '#{varLangField15Val}', '#{varLangField16}', '#{varLangField16Val}', '#{varLangField17}', '#{varLangField17Val}', '#{varLangField18}', '#{varLangField18Val}', '#{varLangField19}', '#{varLangField19Val}', '#{varLangField20}', '#{varLangField20Val}', '#{varLangField21}', '#{varLangField21Val}', '#{varLangField22}', '#{varLangField22Val}', '#{varLangField23}', '#{varLangField23Val}', '#{varLangField24}', '#{varLangField24Val}', '#{varLangField25}', '#{varLangField25Val}', '#{varLangField26}', '#{varLangField26Val}', '#{varLangField27}', '#{varLangField27Val}', '#{varLangField28}', '#{varLangField28Val}', '#{varLangField29}', '#{varLangField29Val}', '#{varLangField30}', '#{varLangField30Val}', '#{langSelected2}'"  +
                        ")"
            puts(sqlInsert)
  ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    
            con.query(sqlInsert)
          end
  
          
          
        elsif descripcion.include? 'Repescando.'

          posNode = 0
#INTRODUCIR PATH COLECCIÓN ITEMS
          nodes = @browser.divs(:xpath, "/*")
        
          puts("Node count: #{nodes.size}")
          nodes.each do |node|
            posNode += 1
                     
            captura = ""
            numPag = 0
            urlCaptura = ""
            fechaHora = ""
            numEntrada = 0



      placeName = ""
      value5_Count = ""
      value4_Count = ""
      value3_Count = ""
      value2_Count = ""
      value1_Count = ""

      status= ""
      name = ""
      tipo = ""
      geolat = ""
      geolng = ""
      formattedaddress = ""
      rating = ""
      user_ratings_total = ""
      placeid = ""
      gid = ""
      reference = ""
      cert1 = ""
      cert2 = ""
      cert3 = ""
      securityReviews = ""

      isYourBusiness = ""
      claimed = ""
      propertyDescription = ""
        
            ignore_exception { captura = "#{descripcion}" }
            ignore_exception { urlOrig = "#{urlOrig}" }
            ignore_exception { idLaunch = "#{idLaunch}" }
            ignore_exception { idCaptura = "#{idCaptura}" }
            ignore_exception { numPag = "#{page}" }
            ignore_exception { urlCaptura = @browser.url }
            ignore_exception { fechaHora = "#{strDT}" }
            ignore_exception { numEntrada = "#{posNode}" }
      
      ignore_exception { placeName = con.quote(node.element(:xpath,"//*[@id='HEADING']").text) }
      ignore_exception { value5_Count = con.quote(node.element(:xpath,"(//*[(@id='ratingFilter' or @data-name='ta_rating') and not(ancestor-or-self::*[contains(./@class,'hidden')])]//input)[1]/following::span[contains(@class,'row_bar')][1]/following::span[1]").text) }
      ignore_exception { value4_Count = con.quote(node.element(:xpath,"(//*[(@id='ratingFilter' or @data-name='ta_rating') and not(ancestor-or-self::*[contains(./@class,'hidden')])]//input)[2]/following::span[contains(@class,'row_bar')][1]/following::span[1]").text) }
      ignore_exception { value3_Count = con.quote(node.element(:xpath,"(//*[(@id='ratingFilter' or @data-name='ta_rating') and not(ancestor-or-self::*[contains(./@class,'hidden')])]//input)[3]/following::span[contains(@class,'row_bar')][1]/following::span[1]").text) }
      ignore_exception { value2_Count = con.quote(node.element(:xpath,"(//*[(@id='ratingFilter' or @data-name='ta_rating') and not(ancestor-or-self::*[contains(./@class,'hidden')])]//input)[4]/following::span[contains(@class,'row_bar')][1]/following::span[1]").text) }
      ignore_exception { value1_Count = con.quote(node.element(:xpath,"(//*[(@id='ratingFilter' or @data-name='ta_rating') and not(ancestor-or-self::*[contains(./@class,'hidden')])]//input)[5]/following::span[contains(@class,'row_bar')][1]/following::span[1]").text) }

      ignore_exception { status = con.quote(node.element(:xpath,"/PlaceSearchResponse/status").text) }
      ignore_exception { name = con.quote(node.element(:xpath,"/PlaceSearchResponse/result/name").text) }
      ignore_exception { tipo = con.quote(node.element(:xpath,"/PlaceSearchResponse/result/type").text) }
      ignore_exception { geolat = con.quote(node.element(:xpath,"/PlaceSearchResponse/geometry/location/lat").text) }
      ignore_exception { geolng = con.quote(node.element(:xpath,"/PlaceSearchResponse/geometry/location/lng").text) }
      ignore_exception { formattedaddress = con.quote(node.element(:xpath,"/PlaceSearchResponse/result/formatted_address").text) }
      ignore_exception { rating = con.quote(node.element(:xpath,"/PlaceSearchResponse/result/rating").text) }
      ignore_exception { user_ratings_total = con.quote(node.element(:xpath,"/PlaceSearchResponse/result/user_ratings_total").text) }
      ignore_exception { placeid = con.quote(node.element(:xpath,"/PlaceSearchResponse/result/place_id").text) }
      ignore_exception { gid = con.quote(node.element(:xpath,"/PlaceSearchResponse/result/id").text) }
      ignore_exception { reference = con.quote(node.element(:xpath,"/PlaceSearchResponse/result/reference").text) }

      ignore_exception { cert1 = con.quote(node.element(:xpath,"//*[contains(@class,'badge')]/*[@class='badgeText']").text) }
      ignore_exception { cert2 = con.quote(node.element(:xpath,"(//*[contains(@class,'certificate')])[1]").text) }
      ignore_exception { cert3 = con.quote(node.element(:xpath,"(//*[contains(@class,'excellence')])[1]").text) }

      ignore_exception { securityReviews = con.quote(node.element(:xpath,"//*[contains(@for,'Safety')]").text) }

      ignore_exception { isYourBusiness = con.quote(node.element(:xpath,"//*[contains(@href,'ManagementCenter')]").text) }
      ignore_exception { claimed = con.quote(node.element(:xpath,"//*[contains(@class,'ClaimedBadge')]").text) }
       
      #ignore_exception { propertyDescription = con.quote(node.element(:xpath,"(//div[contains(@class,'propertyDescription')]  | //div[contains(@class,'propertyDescription')]/span)[last()]").text) }
      ignore_exception { propertyDescription = con.quote(execute_script("return arguments[0].textContent", node.element(:xpath,"(//div[contains(@class,'propertyDescription')]  | //div[contains(@class,'propertyDescription')]/span)[last()]"))) }


    
            sqlInsert = "INSERT INTO `Navigator`.`tblDataRepesca` (`captura`, `urlOrig`, `idLaunch`, `idCaptura`, `numPag`, `urlCaptura`, `fechaHora`, `numEntrada`, "  +
                        "`placeName`, `value5_Count`, `value4_Count`, `value3_Count`, `value2_Count`, `value1_Count`, "  +
                        "`status`, `name`, `tipo`, `geolat`, `geolng`, `formattedaddress`, `rating`, `user_ratings_total`, `placeid`, `gid`, `reference`, `cert1`, `cert2`, `cert3`, `securityReviews`, `isYourBusiness`, `claimed`, `propertyDescription`" +       
                        ") VALUES ('#{captura}', '#{urlOrig}', '#{idLaunch}', '#{idCaptura}', '#{numPag}', '#{urlCaptura}', '#{fechaHora}', '#{numEntrada}', "  +
                        "'#{placeName}', '#{value5_Count}', '#{value4_Count}', '#{value3_Count}', '#{value2_Count}', '#{value1_Count}', " +
                        "'#{status}', '#{name}', '#{tipo}', '#{geolat}', '#{geolng}', '#{formattedaddress}', '#{rating}', '#{user_ratings_total}', '#{placeid}', '#{gid}', '#{reference}', '#{cert1}', '#{cert2}', '#{cert3}', '#{securityReviews}', '#{isYourBusiness}', '#{claimed}', '#{propertyDescription}' " +
                        ")"
            puts(sqlInsert)
ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
    
            con.query(sqlInsert)
          end
        end

      end 
 
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
      puts("Archivando Traza (#{stDT})")
      storePageDebugHtml stDT
      storePagePng stDT
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
  
  def launchGoogleHotelPrices con, idTarget, idConexion, idLaunch, descripcion, url
      @lasttime = Time.now.to_f

      ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush

      checkPageCompleted = '//*[@id="prices"]//*[@data-show-prices]'


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

      ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
      
      idCaptura = prepararCaptura idLaunch, descripcion, url, '', '' #cambiar el anterior por otro proceso que verifique el ultimo indice utilizado registrado en un xml

      sleep 2
      @browser.element(:xpath,checkPageCompleted).wait_until_present
  
      clickOpenDates = '//*[@id="prices"]//div[contains(@aria-label,"Select check-in")]'
      @browser.element(:xpath,clickOpenDates).click

      sleep 5
      nodes = @browser.divs(:xpath, "//div[@data-iso]")
      nodes.each do |node|
        fecha = node.attribute_value("data-iso")
        precio = node.element(:xpath,".//div[@jsname]").text
        puts("Fecha: #{fecha} , precio: #{precio}")
      end

      ahora = Time.now;  tiempopasado = ahora.to_f - @lasttime; @lasttime = ahora.to_f; puts("CODETRACE (#{ahora}, +#{(tiempopasado * 1000).to_i}ms)>> #{__FILE__}:#{__LINE__}"); $stdout.flush
     
#      storePage idLaunch, idCaptura
      
      

  end
  



  def storeDirectPage con, idTarget, idConexion, idLaunch, idCaptura, page, html
    t = Time.now  
    strDT = t.strftime("%y%m%d_%H%M%S_%9N")
    updateDate = Time.now.strftime("%Y-%m-%d %H:%M:%S")  #vigilar que no haya que meterlo en utc Time.now.utc.to_s(:db)
    con.query("UPDATE `Navigator`.`tblConexiones` SET `UltimaConexion` = '#{updateDate}' WHERE `idConexion`=#{idConexion};")
    con.query("INSERT INTO `Navigator`.`tblInserts` (idConexion, idTarget, idLaunch, idCaptura, Pagina, FechaHora, Estado) VALUES ('#{idConexion}', '#{idTarget}', '#{idLaunch}', '#{idCaptura}', 1, '#{strDT}', 99);")
    int_idInsert = con.query("select last_insert_id()").fetch_row.first.to_i
    idInsert = "%08d" % int_idInsert
    idInsert = 0
    storeDirectPageHtml idLaunch, idCaptura, strDT, page, html
    updateDate = Time.now.strftime("%Y-%m-%d %H:%M:%S")  #vigilar que no haya que meterlo en utc Time.now.utc.to_s(:db)
    con.query("UPDATE `Navigator`.`tblConexiones` SET `UltimaConexion` = '#{updateDate}' WHERE `idConexion`=#{idConexion};")
    con.query("UPDATE `Navigator`.`tblInserts` SET `Estado` = 1 WHERE `idInsert`=#{idInsert};")
  end
  
  
  
  
  def storeDirectPageHtml idLaunch, idCaptura, strDT, page, html
    
    folderCaptura = "/volHTML/" + idLaunch + "/" + idCaptura + "/" 
    subdoc = Document.new("<Pagina />")
    subdoc.root.attributes["id"] = "#{page}"
    eFechaHora = subdoc.root.add_element "FechaHora"
    eFechaHora.text = strDT
    eURL = subdoc.root.add_element "URL"
    eURL.text = "www.tripadvisor.com"
    
    capturaXml = folderCaptura + "captura.xml"
    file = File.new(capturaXml)
    doc = Document.new(file)
    doc.root.elements.add(subdoc.root)
    
    File.open(capturaXml,"w") do |data|
      data<<doc
    end
    htmFile = folderCaptura + strDT + ".htm"
    
    aFile = File.new(htmFile, "w")
    aFile.write(html)
    aFile.close
    
    $htmlStoreCountDown += -1
  end


end


