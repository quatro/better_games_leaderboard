class AthleteScore < ApplicationRecord

  belongs_to :athlete
  belongs_to :wod

  scope :seventeen_point_one, -> { where('wod_id = 1').order('score ASC') }
  scope :seventeen_point_two, -> { where('wod_id = 2').order('score ASC') }
  scope :seventeen_point_three, -> { where('wod_id = 3').order('score ASC') }
  scope :seventeen_point_four, -> { where('wod_id = 4').order('score ASC') }
  scope :seventeen_point_five, -> { where('wod_id = 5').order('score ASC') }

  def athlete_name
    athlete.name if athlete
  end

  def score_formatted
    if wod_id == 1
      hours = score/3600
      minutes = ((score%3600)/60).to_s.rjust(2, '0')
      seconds = (score%60).to_s.rjust(2, '0')
      [hours,minutes,seconds].compact.join(':')
    end
  end
end