require 'pry'

File.open('../../nba-api/nba-scraper/json/sportvu_stats.json', 'r') do |file|
  file.each do |line|
  all_players = JSON.parse(line)

    all_players.each do |index, player|

      Player.create(name: player["name"],
                    # position:
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
                    points_per_touch: player["points_per_touch"],
                    position: player["position"],
                    front_court_touches: player["front_court_touches"],
                    elbow_touches: player["elbow_touches"],
                    post_touches: player["post_touches"],
                    paint_touches: player["paint_touches"],
                    points_per_elbow_touch: player["points_per_elbow_touch"],
                    points_per_post_touch: player["points_per_post_touch"],
                    points_per_paint_touch: player["points_per_paint_touch"],
                    points_per_front_court_touch: player["points"] / player["front_court_touches"]
                    )

    end
  end
end
