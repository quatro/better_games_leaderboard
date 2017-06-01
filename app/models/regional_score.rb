class RegionalScore < ApplicationRecord

  belongs_to :athlete
  has_one :regional_athlete_score

  scope :rank, -> { order(minutes: :asc).order(seconds: :asc).order(fraction_seconds: :asc).order(cap_count: :asc).order(:is_wd) }

  scope :get, -> (division,workout) { joins(:athlete).where('athletes.division = ?', division).where(workout: workout) }

end