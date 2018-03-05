class Athlete < ApplicationRecord

  has_many :regional_scores, dependent: :destroy

  def self.get_from_json(json)
    model = Athlete.find_by_userid(json['userid'])
    return model if model

    return Athlete.create({name:json['name'], userid:json['userid'], division:json['division'], regionid:json['regionid']})
  end

  def store_json_scores(json)
    json.each_with_index do |score,i|
      if score
        rs = regional_scores.where(year:2018, workout:i+1).first

        scoredisplay = score['scoredisplay']

        minutes = 10000
        seconds = 10000
        fraction_seconds = 10000
        cap_count = 0
        is_wd = false

        if scoredisplay && scoredisplay.include?(':')
          score_split = scoredisplay.split(':')
          minutes = score_split[0].to_i
          score_split_again = score_split[1].split('.')
          seconds = score_split_again[0].to_i
          fraction_seconds = score_split_again[1].to_i
        elsif scoredisplay && scoredisplay.include?('CAP')
          score_split = scoredisplay.split('+')
          cap_count = score_split[1].to_i
        elsif scoredisplay.nil? || scoredisplay.include?('WD')
          is_wd = true
        end

        hash = {scoredisplay:scoredisplay, year:2018, workout:i+1, score: scoredisplay, minutes:minutes, seconds:seconds, fraction_seconds: fraction_seconds, cap_count:cap_count, is_wd:is_wd }

        if rs
          rs.update_attributes(hash)
        else
          regional_scores.create(hash)
        end
      end
    end
  end
end
