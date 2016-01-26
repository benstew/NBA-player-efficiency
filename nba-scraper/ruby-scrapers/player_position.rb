require 'nokogiri'
require 'pry'
require 'json'

def create_player_position_hash
  html = File.read('../fixtures/player_position.html')
  positions_html = Nokogiri::HTML(html)

  player_position_extract = {}

  positions_html.css("tr").each do |player|
    name = player.css("a")[0].text

    player_position_extract[name] = {
      :position => player.css("td")[1].text
    }

  end

  File.open("../json/player_by_position.json","w") do |f|
    # Can use JSON.parse(object) to extract anything
    f.write(player_position_extract.to_json)
  end

  player_position_extract

end

create_player_position_hash
