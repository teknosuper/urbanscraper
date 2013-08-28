require 'nokogiri'
require 'open-uri'
require 'json'

class UrbanDictionary
  def get_top_definition(term)
    # pull it into nokogiri
    doc = Nokogiri::HTML(open('http://www.urbandictionary.com/define.php?term=' + term))
    
    # run the xpath
    entries_block = doc.xpath("/html/body//table[@id='entries']")
    definition_group = entries_block.search("div[@class='definition']")
    
    definitions = Array.new
    definition_group.each { |e| definitions << e.to_str }

    definitions[0]
  end
end