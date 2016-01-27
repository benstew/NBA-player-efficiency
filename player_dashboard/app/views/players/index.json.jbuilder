json.array!(@players) do |player|
  json.extract! player, :id, :name, :team, :games_played, :wins, :losses, :minutes, :points, :touches, :time_of_possession, :seconds_per_touch, :dribbles_per_touch, :points_per_touch
  json.url player_url(player, format: :json)
end
