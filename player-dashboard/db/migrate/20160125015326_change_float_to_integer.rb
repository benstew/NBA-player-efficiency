class ChangeFloatToInteger < ActiveRecord::Migration
  def change
    change_column :players, :games_played, :integer
    change_column :players, :wins, :integer
    change_column :players, :losses, :integer
  end
end
