
require 'pry'


    File.open('../../nba-api/nba-scraper/stats.json', 'r') do |file|
     file.each do |line|
      players = JSON.parse(line)

      binding.pry

       Player.create(name: "Ben")
     end
   end
