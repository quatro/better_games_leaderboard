class RegionalCacher

  def score_table
    @score_table ||= begin
      table = {
          1 => 100,
          2 => 95,
          3 => 90,
          4 => 85,
          5 => 80,
          6 => 75
      }

      rank = 7
      score = 73

      900.times do |i|
        table[i+rank] = score - (i*2)
      end

      table
    end
  end

  def rank(year)

    [1,2,11].each do |division|
    #[1].each do |division|
      (1..6).each do |workout|
        RegionalScore.joins(:athlete).where(year:2017, workout:workout).where('athletes.division = ?', division).rank.each_with_index do |rs,i|
          ra = RegionalAthlete.get_from_year_athlete(year, rs.athlete)
          ra.assign_regional_score_for_workout(rs, {workout: rs.workout, regional_athlete:ra, regional_score:rs, rank: i+1, points:score_table[i+1], scoredisplay:rs.scoredisplay})
        end
      end
    end

    # Now set overall scores
    RegionalAthlete.where(year:year).each do |ra|
      workout1 = ra.regional_athlete_scores.where(workout:1).first
      workout2 = ra.regional_athlete_scores.where(workout:2).first
      workout3 = ra.regional_athlete_scores.where(workout:3).first
      workout4 = ra.regional_athlete_scores.where(workout:4).first
      workout5 = ra.regional_athlete_scores.where(workout:5).first
      workout6 = ra.regional_athlete_scores.where(workout:6).first

      overall_score = [workout1,workout2,workout3,workout4,workout5,workout6].compact.inject(0){|sum,ras| sum + ras.points }

      score_1_rank = workout1 ? workout1.rank : 10000
      score_1_display = workout1 ? format_display(workout1.scoredisplay, score_1_rank) : ''
      score_2_rank = workout2 ? workout2.rank : 10000
      score_2_display = workout2 ? format_display(workout2.scoredisplay, score_2_rank) : ''
      score_3_rank = workout3 ? workout3.rank : 10000
      score_3_display = workout3 ? format_display(workout3.scoredisplay, score_3_rank) : ''
      score_4_rank = workout4 ? workout4.rank : 10000
      score_4_display = workout4 ? format_display(workout4.scoredisplay, score_4_rank) : ''
      score_5_rank = workout5 ? workout5.rank : 10000
      score_5_display = workout5 ? format_display(workout5.scoredisplay, score_5_rank) : ''
      score_6_rank = workout6 ? workout6.rank : 10000
      score_6_display = workout6 ? format_display(workout6.scoredisplay, score_6_rank) : ''

      ra.update_attributes({
                               athlete_name: ra.athlete.name,
                               score_1_display: score_1_display,
                               score_1_rank: score_1_rank,
                               score_2_display: score_2_display,
                               score_2_rank: score_2_rank,
                               score_3_display: score_3_display,
                               score_3_rank: score_3_rank,
                               score_4_display: score_4_display,
                               score_4_rank: score_4_rank,
                               score_5_display: score_5_display,
                               score_5_rank: score_5_rank,
                               score_6_display: score_6_display,
                               score_6_rank: score_6_rank,
                               points_overall: overall_score,
                               rank_overall:'?'
                           })
    end

    # Set overall rank
    [1,2,11].each do |division|
      RegionalAthlete.get(division).order(points_overall: :desc).each_with_index do |ra,i|
        ra.update_attributes({rank_overall:i+1})
      end
    end


  end

  private
  def format_display(display, rank)
    if rank != 10000
      return "#{rank} (#{display})"
    else
      return "(#{display})"
    end
  end
end
