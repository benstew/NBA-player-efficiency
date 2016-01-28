class ChangeFctouchColumnToFloat < ActiveRecord::Migration
  def change
    change_column :players, :points_per_fc_touch, :float
  end
end
