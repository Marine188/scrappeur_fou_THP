require 'rubygems'
require 'nokogiri'
require 'open-uri'

array_crypto_a = [] # tableau final
array_crypto_b = [] # nom de cryptomonnaie (hash)
array_crypto_c = [] # valeur cryptomonnaie (Hash)

doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")) #lien de récuperation des donnée sur internet

# methode nom de la crypto
def symbole_crypto
  nom = doc.xpath('//td[@class = "text-left col-symbol"]') #utilisation de Xpath, on appelle la classe pour la recuperation des symboles
  array_crypto_b = [] # dans un hash
    nom.each do |name|
      array_crypto_b << name.text #string
    end
end

 array_crypto_b

#methode valeur de la crypto
def valeur_crypto
  valeur = doc.xpath('//td[5]/a/text()') # récuperation des valeurs avec xpath sur mozilla
  array_crypto_c = []
   valeur.each do |currency|
   array_crypto_c << currency.text
 end
end

return array_crypto_c

#Assembler les hashs pour tableau fini... a continuer
#def tableau_final(array_crypto_b, array_crypto_c)
#  array_crypto_a = array_crypto_b.zip(array_crypto_c)
#  return array_crypto_a.to_f

#end
#print array_crypto_a




#html body div.container.main-section.padding-top-1x div.cmc-main-content div.cmc-main-content__main div.row.bottom-margin-1x div.col-xs-12 div.table-responsive.compact-name-column div#currencies-all_wrapper.dataTables_wrapper.no-footer table#currencies-all.table.floating-header.summary-table.js-summary-table.dataTable.no-footer tbody tr#id-bitcoin.odd td.no-wrap.text-right a.price
#id-bitcoin > td:nth-child(5) > a:nth-child(1)
#/html/body/div[2]/div[2]/div[1]/div[1]/div[3]/div[2]/div/table/tbody/tr[1]/td[5]/a
