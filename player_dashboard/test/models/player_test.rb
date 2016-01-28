# == Schema Information
#
# Table name: players
#
#  id                           :integer          not null, primary key
#  name                         :string
#  team                         :string
#  games_played                 :integer
#  wins                         :integer
#  losses                       :integer
#  minutes                      :decimal(, )
#  points                       :decimal(, )
#  touches                      :decimal(, )
#  time_of_possession           :decimal(, )
#  seconds_per_touch            :decimal(, )
#  dribbles_per_touch           :decimal(, )
#  points_per_touch             :decimal(, )
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  position                     :string
#  front_court_touches          :float
#  elbow_touches                :float
#  post_touches                 :float
#  paint_touches                :float
#  points_per_elbow_touch       :float
#  points_per_post_touch        :float
#  points_per_paint_touch       :float
#  points_per_front_court_touch :float
#

require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
