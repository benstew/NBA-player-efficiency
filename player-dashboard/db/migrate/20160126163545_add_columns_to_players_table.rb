class AddColumnsToPlayersTable < ActiveRecord::Migration
  def change
    add_column :players, :front_court_touches, :float
    add_column :players, :elbow_touches, :float
    add_column :players, :post_touches, :float
    add_column :players, :paint_touches, :float
    add_column :players, :points_per_elbow_touch, :float
    add_column :players, :points_per_post_touch, :float
    add_column :players, :points_per_paint_touch, :float
    add_column :players, :points_per_front_court_touch, :float
  end
end
