require 'nokogiri'
require 'pry'
require 'csv'

def create_stats_hash
  html = File.read('fixtures/nba_stats.html')
  stats_html = Nokogiri::HTML(html)

  stats_extract = {}
  counter = 1

  stats_html.css(".table tbody .each-player").each do |player|

    stats_extract[counter] = {
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

  # To Write Contents to a csv file
  # # CSV.open("stats.csv", "a") do |csv|
  # #   csv << stats_extract.values
  # # end

  stats_extract

end

create_stats_hash
