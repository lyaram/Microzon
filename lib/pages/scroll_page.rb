class ScrollPage

  include WatirPageHelper
 
  #si al final hay que instalar gem, considerar Hpricot
  require 'rexml/document'
  include REXML 
    
  def launch descripcion, url, checkLoading
    @browser.goto url 
    
    prepararStore descripcion, url, '', checkLoading #cambiar el anterior por otro proceso que verifique el ultimo indice utilizado registrado en un xml

    @numPag = 1
    
 #   reintentos = 5
 #   begin
 #     reintentos += -1
 #     puts descripcion + '.chkLOAD.Pag:' + @numPag.to_s + '.Retries:' + reintentos.to_s 
 #     Watir::Wait.until(30) { @browser.element_by_xpath(checkPageCompleted).present? }
 #   rescue
 #     break if reintentos<=0
 #     retry
 #   end
  
    100.times do |i|
      puts "i: #{i}"
      begin
        Watir::Wait.until(30) { @browser.element_by_xpath(checkLoading).present? }
      rescue
      end
      100.times do |j|
        puts "  j: #{j}" 
        @browser.send_keys :space 
      end
      if !@browser.element_by_xpath(checkLoading).exists?
        break 
      end
    end
    
    storePage
  
    #para empaquetar previo ftp, usar este comando en consola
    # zip -r 00001.zip 00001/
    #
    #para empaquetar todos los xml de captura:
    #zip FullCapt.zip -r */captura.xml
    #
    #para empaquetar varias carpetas de html:
    #zip FullHTML.zip -r 00000009/ 00000010/(ETC.ETC.ETC.ETC.ETC.ETC.ETC.)
  end
  
  def prepararStore descripcion, url, nextlink, checkPageCompleted
    #para reiniciar la carpeta BotStoring usar el comando en consola 
    # rm -rf BotStoring
    # mkdir BotStoring
    # mkdir BotStoring/html
    # mkdir BotStoring/png

    @folderbase = Dir.home() + "/" + "BotStoring"

    capturasXml = @folderbase + "/capturas.xml"

    @indexStore = ""
    if not File.file?(capturasXml)
      File.open(capturasXml, "w") do |f|
        f.puts '<Capturas/>'
      end
      @indexStore = "%08d" % 1
    end
    
    file = File.new(capturasXml)
    doc = Document.new(file)
    
    if @indexStore == ""
      ultimaCaptura = XPath.match(doc.root, "//Capturas/Captura[last()]").first
      @indexStore = "%08d" % ((ultimaCaptura.attributes["id"]).to_i+1)
    end
    
#    p = <<EOF
#  <Captura>
#    <FechaHora />
#    <Description />
#    <Link />
#    <NextLink />
#  </Captura>
#EOF
#    subdoc = Document.new(p)

    subdoc = Document.new("<Captura />")
    subdoc.root.attributes["id"] = @indexStore
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

    File.open(capturasXml,"w") do |data|
      data<<doc
    end
 
    ruta = @folderbase + "/html/" + @indexStore
    Dir::mkdir(ruta)

    ruta <<  "/captura.xml"
    File.open(ruta, "w") do |f|
      f.puts '<Captura/>'
    end
   
  end

  def storePage
    t = Time.now  
    strDT = t.strftime("%y%m%d_%H%M%S_%9N")
    storePagePng strDT
    storePageHtml strDT
  end
  
  def storePagePng strDT
    folderpng = @folderbase + "/png/" + strDT.gsub("_","")[0..8] + "X"
    Dir::mkdir(folderpng) if not File.directory?(folderpng)
    screenshot = folderpng + "/" + strDT + ".png"
    @browser.driver.save_screenshot(screenshot)
    embed screenshot, 'image/png'
  end
  
  def storePageHtml strDT
    
   
# INI actualizar xml##############################################################

    subdoc = Document.new("<Pagina />")
    subdoc.root.attributes["id"] = @numPag
    eFechaHora = subdoc.root.add_element "FechaHora"
    eFechaHora.text = strDT
    eURL = subdoc.root.add_element "URL"
    eURL.text = @browser.url
    
    capturaXml = @folderbase + "/html/" + @indexStore + "/captura.xml"
    file = File.new(capturaXml)
    doc = Document.new(file)
    doc.root.elements.add(subdoc.root)
    
    File.open(capturaXml,"w") do |data|
      data<<doc
    end

# FIN actualizar xml################################################################

    htmFile = @folderbase + "/html/" + @indexStore + "/" + strDT + ".htm"
    
    aFile = File.new(htmFile, "w")
    aFile.write(@browser.html)
    aFile.close

  end
  
  def initialize browser, page_metrics, visit = false
    @browser = browser
    goto if visit
    
    expected_element if respond_to? :expected_element
    has_expected_title? if respond_to? :has_expected_title?
 
    #@browser.with_performance {|performance| page_metrics.add_page self.class, performance } unless visit
  end
  
  def method_missing sym, *args, &block
    @browser.send sym, *args, &block
  end


end
