require 'nokogiri'
require 'pry'
require 'json'

def create_player_position_hash
  html = File.read('fixtures/player_position.html')
  positions_html = Nokogiri::HTML(html)

  positions_extract = {}

  positions_html.css("tr").each do |player|
    name = player.css("a")[0].text

    positions_extract[name] = {
      :position => player.css("td")[1].text
    }

  end

  File.open("positions.json","w") do |f|
    # Can use JSON.parse(object) to extract anything
    f.write(positions_extract.to_json)
  end

  positions_extract

end

create_player_position_hash
