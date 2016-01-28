# == Schema Information
#
# Table name: players
#
#  id                     :integer          not null, primary key
#  name                   :string
#  team                   :string
#  games_played           :integer
#  wins                   :integer
#  losses                 :integer
#  minutes                :decimal(, )
#  points                 :decimal(, )
#  touches                :decimal(, )
#  time_of_possession     :decimal(, )
#  seconds_per_touch      :decimal(, )
#  dribbles_per_touch     :decimal(, )
#  points_per_touch       :decimal(, )
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  position               :string
#  frontcourt_touches     :decimal(, )
#  elbow_touches          :decimal(, )
#  post_touches           :decimal(, )
#  paint_touches          :decimal(, )
#  points_per_elbow_touch :decimal(, )
#  points_per_post_touch  :decimal(, )
#  points_per_paint_touch :decimal(, )
#  points_per_fc_touch    :float
#

require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
