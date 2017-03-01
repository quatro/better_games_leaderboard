class Athlete < ApplicationRecord

  has_many :athlete_scores, dependent: :destroy

end