class ChangeNumberFormatToFloat < ActiveRecord::Migration
  def change
    change_column :players, :games_played, :decimal
    change_column :players, :wins, :decimal
    change_column :players, :losses, :decimal
    change_column :players, :minutes, :decimal
    change_column :players, :points, :decimal
    change_column :players, :touches, :decimal
    change_column :players, :time_of_possession, :decimal
    change_column :players, :seconds_per_touch, :decimal
    change_column :players, :dribbles_per_touch, :decimal
    change_column :players, :points_per_touch, :decimal
  end
end
