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

class Player < ActiveRecord::Base

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      # scoped
      all
    end
  end

  def self.average_post_touches
    average(:post_touches)
  end

  def self.average_points
    (average(:points)).round(2)
  end

  def self.average_minutes
    (average(:minutes)).round(2)
  end

  def self.average_time_of_possession
    (average(:time_of_possession)).round(2)
  end

  def self.average_seconds_per_touch
    (average(:seconds_per_touch)).round(2)
  end

  def self.average_dribbles_per_touch
    (average(:dribbles_per_touch)).round(2)
  end

  def self.average_points_per_touch
    (average(:points_per_touch)).round(3)
  end

  def self.average_elbow_touches
    (average(:elbow_touches)).round(2)
  end

  def self.average_post_touches
    (average(:post_touches)).round(2)
  end

  def self.average_paint_touches
    (average(:paint_touches)).round(2)
  end

  def self.average_points_per_elbow_touch
    (average(:points_per_elbow_touch)).round(3)
  end

  def self.average_points_per_post_touch
    (average(:points_per_post_touch)).round(3)
  end

  def self.average_points_per_paint_touch
    (average(:points_per_paint_touch)).round(3)
  end

end
