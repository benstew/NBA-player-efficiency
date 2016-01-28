class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :team
      t.integer :games_played
      t.integer :wins
      t.integer :losses
      t.integer :minutes
      t.integer :points
      t.integer :touches
      t.integer :time_of_possession
      t.integer :seconds_per_touch
      t.integer :dribbles_per_touch
      t.integer :points_per_touch

      t.timestamps null: false
    end
  end
end
