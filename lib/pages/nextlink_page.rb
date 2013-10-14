class NextLinkPage

  #include WatirPageHelper
 
  #si al final hay que instalar gem, considerar Hpricot
  require 'rexml/document'
  include REXML 
    
  def getLaunch
    #para reiniciar la carpeta BotStoring usar el comando en consola 
    # rm -rf BotStoring
    # mkdir BotStoring
    # mkdir BotStoring/png
    # mkdir BotStoring/launches

    @folderbase = Dir.home() + "/" + "BotStoring"

    launchesLogXml = @folderbase + "/launcheslog.xml"

    indexLaunch = ""
    if not File.file?(launchesLogXml)
      File.open(launchesLogXml, "w") do |f|
        f.puts '<Launches/>'; $stdout.flush
      end
      indexLaunch = "%08d" % 1
    end
    
    file = File.new(launchesLogXml)
    doc = Document.new(file)
    
    if indexLaunch == ""
      lastLaunch = XPath.match(doc.root, "//Launches/Launch[last()]").first
      indexLaunch = "%08d" % ((lastLaunch.attributes["id"]).to_i+1)
    end
    
    subdoc = Document.new("<Launch />")
    subdoc.root.attributes["id"] = indexLaunch

    doc.root.elements.add(subdoc.root)

    File.open(launchesLogXml,"w") do |data|
      data<<doc
    end
 
    ruta = @folderbase + "/launches/" + indexLaunch
    Dir::mkdir(ruta)

    return indexLaunch
  end
  
  def launch idLaunch, descripcion, url, nextlink, checkPageCompleted, checkPageLoading
      reintentos = 3
      begin
        reintentos += -1
        puts '@browser.goto.Retries:' + reintentos.to_s ; $stdout.flush
        @browser.goto url 
		sleep 1
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
      rescue Exception => e
	    puts e.message; $stdout.flush
        if reintentos>0
          retry
        end
      end
    
    prepararStore idLaunch, descripcion, url, nextlink, checkPageCompleted #cambiar el anterior por otro proceso que verifique el ultimo indice utilizado registrado en un xml

    @browser.element(:xpath,checkPageCompleted).wait_until_present
    
    if @browser.element(:xpath,'//select[@id="filterLang"]/option[@value="ALL" and not(@selected)]').exists?
      @browser.element(:xpath,'//select[@id="filterLang"]/option[@value="ALL"]').select
      sleep 3      
      #begin  
      #  @browser.element(:xpath,'//select[@id="filterLang"]/option[@value="ALL"]/@selected').wait_until_present
      # rescue Exception => e
      #   puts e.message    ; $stdout.flush
      # end
      #sleep 3      
    end
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

    @numPag = 0
    loop do
      @numPag += 1
      break if @numPag>1000 #SOLO PARA TESTS, COMPROBANDO QUE NO EMPIEZA A PAGINAR HASTA EL INFINITO
      
      recargar = false
      sigueprobando=true
      reintentos = 5
      begin
        while sigueprobando
          reintentos += -1
          puts descripcion + '.chkLOAD.Pag:' + @numPag.to_s + '.Retries:' + reintentos.to_s ; $stdout.flush
          
          if recargar
            @browser.refresh
            @browser.wait 60
          end
          recargar = false
          
          @browser.element(:xpath,checkPageCompleted).wait_until_present
          
          break if checkPageLoading==''

          sleep 5
          if !@browser.element(:xpath,checkPageLoading).exists?
            break
          end

          if reintentos<=0  
            sigueprobando = false
          end
        end
      rescue Exception => e
		    strDT = Time.now.strftime("%y%m%d_%H%M%S_%9N")
        puts strDT + ": " + e.message; $stdout.flush
        
        if e.message == 'end of file reached'
          recargar=true
        else
          aFile = File.new(@folderbase + "/debug/" + strDT + ".htm", "w")
          htmlPage=@browser.html
          aFile.write(htmlPage)
          aFile.close
        end
    		
        break if reintentos<=0
        retry
      end
      
      
          #htmlPage = Nokogiri::HTML.parse(@browser.html)
    
    #$DEBUG = true

     puts 'Ejecutando htmlPage = @browser.html'; $stdout.flush
  
     sigueprobando=true
     reintentos = 5
     while sigueprobando
       begin 
          puts 'Intento #' + reintentos.to_s; $stdout.flush
          reintentos += -1
          htmlPage = @browser.html
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

      
      
      
      
      sleep 5
      @browser.element(:xpath,checkPageCompleted).wait_until_present
      
      linkMore = '//*[@id="REVIEWS"]/div[starts-with(@id,"review_")]/div[not(@style="display: none;")]//span[@class="partnerRvw"]/span[contains(@class,"moreLink")]'
      reintentos = 10
      while @browser.element(:xpath,linkMore).exists?
        reintentos += -1
        break if reintentos<0
        @browser.element(:xpath,linkMore).click
        sleep 3
      end

      buttonNoTranslation = '//*[@id="REVIEWS"]/div[starts-with(@id,"review_")]/div[not(@style="display: none;")]//form[@class="translationOptionForm"]/label/input[@value="false" and not(@checked)]'
      reintentos = 10
      while @browser.element(:xpath,buttonNoTranslation).exists?
        reintentos += -1
        break if reintentos<0
        @browser.element(:xpath,buttonNoTranslation).click
        sleep 3
      end
      
      if @browser.element(:xpath,'//div[@class="wrap more"]/a[contains(@class,"set_reviewExpand")]').exists?
        @browser.element(:xpath,'//div[@class="wrap more"]/a[contains(@class,"set_reviewExpand")]').click
        begin
          @browser.element(:xpath,'//div[@class="note"]').wait_until_present
        rescue
          #fallo
        end
      end

		estoprural = false
		begin
		  while @browser.element(:xpath,'//p[not(@style="display: none;")]/*[@id="twentymore"]').exists?
			estoprural = true
			@browser.element(:xpath,'//p[not(@style="display: none;")]/*[@id="twentymore"]').click
			sleep 3
		  end
		rescue
		  #fallo
		end
		
		if estoprural
			@browser.goto @browser.url.gsub('#page','?page=')
		    sleep 1
		    @browser.element(:xpath,checkPageCompleted).wait_until_present
		end

		begin
		  while @browser.element(:xpath,'//*[@id="moreExperiencesContainer" and not(@style="display: none;")]').exists?
			@browser.element(:xpath,'//*[@id="moreExperiencesContainer" and not(@style="display: none;")]').click
			sleep 3
		  end
		rescue
		  #fallo
		end

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
  
      
      storePage idLaunch
      #abort("Aborting to check fail")
      
      puts url; $stdout.flush
      #puts checkPageCompleted
      #ttt = @browser.element(:xpath,checkPageCompleted).text
      #puts ttt
      
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
  
  def prepararStore idLaunch, descripcion, url, nextlink, checkPageCompleted

    @folderbase = Dir.home() + "/" + "BotStoring"

    launchesLogXml = @folderbase + "/launcheslog.xml"

    file = File.new(launchesLogXml)
    doc = Document.new(file)
    eLaunch = XPath.match(doc.root, "//Launches/Launch[@id='" + idLaunch + "']").first
    
    @indexCaptura = ""
    if XPath.match(eLaunch, "./Captura").empty?
      @indexCaptura = "%08d" % 1      
    else
      lastLaunch = XPath.match(eLaunch, "./Captura[last()]").first
      @indexCaptura = "%08d" % ((lastLaunch.attributes["id"]).to_i+1)
    end

    subdoc = Document.new("<Captura />")
    subdoc.root.attributes["id"] = @indexCaptura
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

    File.open(launchesLogXml,"w") do |data|
      data<<doc
    end
 
    ruta = @folderbase + "/launches/" + idLaunch + "/" + @indexCaptura
    Dir::mkdir(ruta)

    ruta <<  "/captura.xml"
    File.open(ruta, "w") do |f|
      f.puts '<Captura/>'; $stdout.flush
    end
   
  end

  def storePage idLaunch
    t = Time.now  
    strDT = t.strftime("%y%m%d_%H%M%S_%9N")
    storePagePng strDT
    storePageHtml idLaunch, strDT
  end
  
  def storePagePng strDT
    folderpng = "/volPNG/" + strDT[0,4] + "/" + strDT.gsub("_","")[0..8] + "X"
    Dir::mkdir(folderpng) if not File.directory?(folderpng)
    screenshot = folderpng + "/" + strDT + ".png"
    @browser.driver.save_screenshot(screenshot)
    embed screenshot, 'image/png'
  end
  
  def storePageHtml idLaunch, strDT
    
   
# INI actualizar xml##############################################################

    subdoc = Document.new("<Pagina />")
    subdoc.root.attributes["id"] = @numPag
    eFechaHora = subdoc.root.add_element "FechaHora"
    eFechaHora.text = strDT
    eURL = subdoc.root.add_element "URL"
    eURL.text = @browser.url
    
    capturaXml = @folderbase + "/launches/" + idLaunch + "/" + @indexCaptura + "/captura.xml"
    file = File.new(capturaXml)
    doc = Document.new(file)
    doc.root.elements.add(subdoc.root)
    
    File.open(capturaXml,"w") do |data|
      data<<doc
    end

# FIN actualizar xml################################################################

    htmFile = @folderbase + "/launches/" + idLaunch + "/" + @indexCaptura + "/" + strDT + ".htm"
    
    aFile = File.new(htmFile, "w")
    aFile.write(@browser.html)
    aFile.close

  end
  
  def initialize browser, page_metrics, visit = false
    @browser = browser
    goto if visit
    
    expected_element if respond_to? :expected_element
    has_expected_title? if respond_to? :has_expected_title?
 
    @browser.with_performance {|performance| page_metrics.add_page self.class, performance } unless visit
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

    
    prepararStore idLaunch, descripcion, url, nextlink, checkPageCompleted #cambiar el anterior por otro proceso que verifique el ultimo indice utilizado registrado en un xml

    @numPag = 0
    loop do
      @numPag += 1
      break if @numPag>5 #SOLO PARA TESTS, COMPROBANDO QUE NO EMPIEZA A PAGINAR HASTA EL INFINITO
      
      sleep 5
      @browser.element(:xpath,checkPageCompleted).wait_until_present
      if @browser.element(:xpath,'//span[@class="partnerRvw"]/span[contains(@class,"moreLink")]').exists?
        @browser.element(:xpath,'//span[@class="partnerRvw"]/span[contains(@class,"moreLink")]').click
        @browser.element(:xpath,'//div[starts-with(@class,"review dyn_full_review")]').wait_until_present
      end
  
      storePage idLaunch
      
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