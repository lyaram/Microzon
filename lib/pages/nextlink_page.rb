class NextLinkPage

  include WatirPageHelper
 
  #si al final hay que instalar gem, considerar Hpricot
  require 'rexml/document'
  include REXML 
    
  link :next_page do |browser|
    browser.element_by_xpath("(//a)[1]").link
  end
 
 
  div :checkout_complete, :id => "FOOT" #"footernote"
  def ensure_complete
    checkout_complete_div.wait_until_present
  end
    
  def launch descripcion, url, nextlink
    @browser.goto url 
    
    prepararStore descripcion, url, nextlink #cambiar el anterior por otro proceso que verifique el ultimo indice utilizado registrado en un xml

    loop do
      ensure_complete
      storePage
      break if !@browser.element_by_xpath(nextlink).exists?
      @browser.element_by_xpath(nextlink).click
    end 
    #para empaquetar previo ftp, usar este comando en consola
    # zip -r 00001.zip 00001/
  end
  
  def prepararStore descripcion, url, nextlink
    #para reiniciar la carpeta BotStoring usar el comando en consola 
    # rm -rf BotStoring
    
    @folderbase = Dir.home() + "/" + "BotStoring"

    capturasXml = @folderbase + "/capturas.xml"

    if not File.file?(capturasXml)
      File.open(capturasXml, "w") do |f|
        f.puts '<Capturas>'
          f.puts '  <Captura id="00000000" />'
        f.puts '</Capturas>'
      end
    end
    
    file = File.new(capturasXml)
    
    doc = Document.new(file)
    ultimaCaptura = XPath.match(doc.root, "//Capturas/Captura[last()]").first
    @indexStore = "%08d" % (1+Integer(ultimaCaptura.attributes["id"]))
    
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
    
    doc.root.insert_after(ultimaCaptura,subdoc.root)

    File.open(capturasXml,"w") do |data|
      data<<doc
    end
 
    Dir::mkdir(@folderStore + "/html/" + @indexStore)
    
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
 
    @browser.with_performance {|performance| page_metrics.add_page self.class, performance } unless visit
  end
  
  def method_missing sym, *args, &block
    @browser.send sym, *args, &block
  end


end
