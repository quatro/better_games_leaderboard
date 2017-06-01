class RegionalAthlete < ApplicationRecord

  belongs_to :athlete
  has_many :regional_athlete_scores, dependent: :destroy

  scope :get, -> (division) { joins(:athlete).where('athletes.division = ?', division) }

  def self.get_from_year_athlete(year,athlete)
    model = RegionalAthlete.where(year:year, athlete:athlete).first
    return model if model

    return RegionalAthlete.create({year:year, athlete:athlete})
  end

  def assign_regional_score_for_workout(rs, hash)
    ras = regional_athlete_scores.where(regional_score:rs).first

    if ras
      ras.update_attributes(hash)
    else
      ras = regional_athlete_scores.create(hash)
    end

    ras
  end

end
