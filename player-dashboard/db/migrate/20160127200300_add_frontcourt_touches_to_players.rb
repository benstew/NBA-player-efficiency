class AddFrontcourtTouchesToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :frontcourt_touches, :decimal
    add_column :players, :elbow_touches, :decimal
    add_column :players, :post_touches, :decimal
    add_column :players, :paint_touches, :decimal
    add_column :players, :points_per_elbow_touch, :decimal
    add_column :players, :points_per_post_touch, :decimal
    add_column :players, :points_per_paint_touch, :decimal
    add_column :players, :points_per_fc_touch, :decimal

  end
end
