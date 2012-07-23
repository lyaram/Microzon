class NextLinkPage

  include WatirPageHelper
 
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
        f.puts '<Launches/>'
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
    @browser.goto url 
    
    prepararStore idLaunch, descripcion, url, nextlink, checkPageCompleted #cambiar el anterior por otro proceso que verifique el ultimo indice utilizado registrado en un xml

    @numPag = 0
    loop do
      @numPag += 1
      break if @numPag>50 #SOLO PARA TESTS, COMPROBANDO QUE NO EMPIEZA A PAGINAR HASTA EL INFINITO
      
      sigueprobando=true
      reintentos = 5
      begin
        while sigueprobando
          reintentos += -1
          puts descripcion + '.chkLOAD.Pag:' + @numPag.to_s + '.Retries:' + reintentos.to_s 
          @browser.element_by_xpath(checkPageCompleted).wait_until_present
          
          break if checkPageLoading==''

          sleep 5
          if !@browser.element_by_xpath(checkPageLoading).exists?
            break
          end

          if reintentos<=0  
            sigueprobando = false
          end
        end
      rescue Exception => e
        puts e.message
        break if reintentos<=0
        retry
      end
      storePage idLaunch
      
      puts url
      puts checkPageCompleted
      ttt = @browser.element_by_xpath(checkPageCompleted).text
      puts ttt
      $stdout.flush #
      
      reintentos = 5
      begin
        reintentos += -1
        puts descripcion + '.chkNEXT.Pag:' + @numPag.to_s + '.Retries:' + reintentos.to_s 
      rescue
        break if reintentos<=0
        retry
      end
      break if nextlink==''
      break if !@browser.element_by_xpath(nextlink).exists?
      @browser.element_by_xpath(nextlink).click
    end 
    #para empaquetar previo ftp, usar este comando en consola
    # zip -r 00001.zip 00001/
    #
    #para empaquetar todos los xml de captura:
    #zip FullCapt.zip -r */captura.xml
    #
    #para empaquetar varias carpetas de html:
    #zip FullHTML.zip -r 00000009/ 00000010/(ETC.ETC.ETC.ETC.ETC.ETC.ETC.)
  end
  
  def prepararStore idLaunch, descripcion, url, nextlink, checkPageCompleted

    @folderbase = Dir.home() + "/" + "BotStoring"

    launchesLogXml = @folderbase + "/launcheslog.xml"

    file = File.new(launchesLogXml)
    doc = Document.new(file)
    
    @indexCaptura = ""
    if XPath.match(doc.root, "//Launches/Launch[@id='" + idLaunch + "']/Captura").count==0
      @indexCaptura = "%08d" % 1      
    else
      lastLaunch = XPath.match(doc.root, "//Launches/Launch[@id='" + idLaunch + "']/Captura[last()]").first
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
    
    doc.root.elements.add(subdoc.root)

    File.open(launchesLogXml,"w") do |data|
      data<<doc
    end
 
    ruta = @folderbase + "/launches/" + idLaunch + "/" + @indexCaptura
    Dir::mkdir(ruta)

    ruta <<  "/captura.xml"
    File.open(ruta, "w") do |f|
      f.puts '<Captura/>'
    end
   
  end

  def storePage idLaunch
    t = Time.now  
    strDT = t.strftime("%y%m%d_%H%M%S_%9N")
    storePagePng strDT
    storePageHtml idLaunch, strDT
  end
  
  def storePagePng strDT
    folderpng = @folderbase + "/png/" + strDT.gsub("_","")[0..8] + "X"
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


end
