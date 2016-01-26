require 'nokogiri'
require 'pry'
require 'json'


def position_finder(player_name)
  # Opens JSON position file to determine players position
      File.open('../json/player_by_position.json', 'r') do |file|
          file.each do |line|
          position_information = JSON.parse(line)

      if position_information[player_name]
        return position = position_information[player_name]["position"]
      else
        return position = "BC"
      end
    end
  end
end

def create_sportvu_hash
  # Creates the hash which is used to seed the database
  html = File.read('../fixtures/sportvu_stats.html')
  stats_html = Nokogiri::HTML(html)

  sportvu_extract = {}
  counter = 1

  stats_html.css(".table tbody .each-player").each do |player|

    name = player.css(".ng-binding")[0].text
    
    position = position_finder(name)

    sportvu_extract[counter] = {
      :name => player.css(".ng-binding")[0].text,
      :team => player.css(".ng-binding")[1].text,
      :games_played => player.css(".ng-binding")[2].text,
      :wins => player.css(".ng-binding")[3].text.to_f,
      :losses => player.css(".ng-binding")[4].text.to_f,
      :minutes => player.css(".ng-binding")[5].text.to_f,
      :points => player.css(".ng-binding")[6].text.to_f,

      # The number of times a player touches and possesses the ball during the game
      :touches => player.css(".ng-binding")[7].text.to_f,
      :front_court_touches => player.css(".ng-binding")[8].text.to_f,

      # The number of minutes that a player possess the ball
      :time_of_possession => player.css(".ng-binding")[9].text.to_f,

      #The average seconds per touch
      :seconds_per_touch => player.css(".ng-binding")[10].text.to_f,

      #The average dribbles per touch
      :dribbles_per_touch => player.css(".ng-binding")[11].text.to_f,

      # The points scored by a player or team per touch
      :points_per_touch => player.css(".ng-binding")[12].text.to_f,

      :elbow_touches => player.css(".ng-binding")[13].text.to_f,
      :post_touches => player.css(".ng-binding")[14].text.to_f,
      :paint_touches => player.css(".ng-binding")[15].text.to_f,

      :points_per_elbow_touch => player.css(".ng-binding")[16].text.to_f,
      :points_per_post_touch => player.css(".ng-binding")[17].text.to_f,
      :points_per_paint_touch => player.css(".ng-binding")[18].text.to_f,
      :points_per_front_court_touch => 0,


      :position => position.to_s

    }
    counter += 1
  end

  File.open("../json/sportvu_stats.json","w") do |f|
    # Can use JSON.parse(object) to extract anything
    f.write(sportvu_extract.to_json)
  end

  sportvu_extract

end


create_sportvu_hash
