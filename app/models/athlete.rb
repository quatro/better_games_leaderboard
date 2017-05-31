class Athlete < ApplicationRecord

  has_many :regional_scores, dependent: :destroy

  def self.get_from_json(json)
    model = Athlete.find_by_userid(json['userid'])
    return model if model

    return Athlete.create({name:json['name'], userid:json['userid'], division:json['division'], regionid:json['regionid']})
  end

  def store_json_scores(json)
    json.each_with_index do |score,i|
      if !regional_scores.where(year:2017, workout:i).any?
        scoredisplay = score['scoredisplay']
        score_split = scoredisplay.split(':')
        minutes = score_split[0]
        score_split_again = score_split[1].split('.')
        seconds = score_split_again[0]
        fraction_seconds = score_split_again[1]

        regional_scores.create({year:2017, workout:i, score: scoredisplay, minutes:minutes, seconds:seconds, fraction_seconds: fraction_seconds })
      end
    end
  end
end
