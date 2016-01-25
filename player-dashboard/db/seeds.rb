
require 'pry'

File.open('../../nba-api/nba-scraper/stats.json', 'r') do |file|
  file.each do |line|
  all_players = JSON.parse(line)

    all_players.each do |index, player|

      Player.create(name: player["name"],
                    team: player["team"],
                    games_played: player["games_played"],
                    wins: player["wins"],
                    losses: player["losses"],
                    minutes: player["minutes"],
                    points: player["points"],
                    touches: player["touches"],
                    time_of_possession: player["time_of_possession"],
                    seconds_per_touch: player["seconds_per_touch"],
                    dribbles_per_touch: player["dribbles_per_touch"],
                    points_per_touch: player["points_per_touch"])

    end
  end
end
