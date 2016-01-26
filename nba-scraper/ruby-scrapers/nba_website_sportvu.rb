require 'nokogiri'
require 'pry'
require 'json'

def create_sportvu_hash
  html = File.read('../fixtures/sportvu_stats.html')
  stats_html = Nokogiri::HTML(html)

  sportvu_extract = {}
  counter = 1

  stats_html.css(".table tbody .each-player").each do |player|

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

      # The number of minutes that a player possess the ball
      :time_of_possession => player.css(".ng-binding")[9].text.to_f,

      #The average seconds per touch
      :seconds_per_touch => player.css(".ng-binding")[10].text.to_f,

      #The average dribbles per touch
      :dribbles_per_touch => player.css(".ng-binding")[11].text.to_f,

      # The points scored by a player or team per touch
      :points_per_touch => player.css(".ng-binding")[12].text.to_f
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
