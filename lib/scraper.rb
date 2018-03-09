class Scraper
  include HTTParty
  base_uri 'https://games.crossfit.com'


  def start_men
    start(1)
  end

  def start_women
    start(2)
  end

  def start_team
    start(11)
  end

  def start(division)

    # identify batch as when we start pulling it
    batch = DateTime.now.to_i / 60

    #divisions = Filter.division_options.map{|k,v| v}
    competitions = Filter.competition_options.map{|k,v| v}
    years = Filter.year_options.map{|k,v| v}
    scaleds = Filter.scaled_options.map{|k,v| v}
    fittests = Filter.fittest_options.map{|k,v| v}
    occupations = Filter.occupation_options.map{|k,v| v}
    #sorts = Filter.sort_options.map{|k,v| v}
    sorts = [0] # Just want overall
    #fittest1s = Filter.fittest1_options
    fittest1s = [0] # Just want worldwide

    competitions.each do |competition|
      years.each do |year|
        scaleds.each do |scaled|
          fittests.each do |fittest|
            fittest1s.each do |fittest1|
              occupations.each do |occupation|
                sorts.each do |sort|
                  scrape_for_filter(competition, year, division, scaled, fittest, fittest1, occupation, sort, batch)
                end
              end
            end
          end
        end
      end
    end
  end

  def men(page)
    page_sex(1,page)
  end

  def women(page)
    page_sex(2,page)
  end

  def total_pages_men
    total_pages_sex(1)
  end

  def total_pages_women
    total_pages_sex(2)
  end

  def scrape_for_filter(competition, year, division, scaled, fittest, fittest1, occupation, sort, batch)
    # for this combination first get pages
    totalpages = page_count_for_filter(competition, year, division, scaled, fittest, fittest1, occupation, sort)

    #puts "competition: #{competition}"
    #puts "year: #{year}"
    #puts "division: #{division}"
    #puts "scaled: #{scaled}"
    #puts "fittest: #{fittest}"
    #puts "fittest1: #{fittest1}"
    #puts "occupation: #{occupation}"
    #puts "sort: #{sort}"
    #puts "batch: #{batch}"
    #puts "totalpages: #{totalpages}"

    if totalpages
      totalpages.times do |i|
        store_for_filter(competition, year, division, scaled, fittest, fittest1, occupation, sort, i+1, batch)
      end
    end

  end

  def filter(competition, year, division, scaled, fittest, fittest1, occupation, sort, athlete, page)
    if athlete.blank?
      self.class.get("/competitions/api/v1/competitions/open/2018/leaderboards", { query: {compeition:competition, year:year, division:division, scaled:scaled, sort:sort, fittest:fittest, region:fittest1, occupation: occupation, page:page}})
    else
      self.class.get("/competitions/api/v1/competitions/open/2018/leaderboards", { query: {compeition:competition, year:year, division:division, scaled:scaled, sort:sort, fittest:fittest, region1:fittest1, occupation: occupation, page:page, athlete:athlete}})
    end
  end

  def filter_regional(division, regional, sort, page)
    self.class.get("/competitions/api/v1/competitions/regionals/2018/leaderboards", { query: {division:division, sort:sort, page:page, regional:regional}})
  end

  def filter_games(division, sort, page)
    self.class.get("/competitions/api/v1/competitions/games/2018/leaderboards", { query: {division:division, sort:sort, page:page}})
  end

  def search(term, division)
    self.class.get("/competitions/api/v1/competitions/open/2018/athletes", { query: {term:term, division: division}})
  end

  private

  def page_count_for_filter(competition, year, division, scaled, fittest, fittest1, occupation, sort)
    results = self.class.get("/competitions/api/v1/competitions/open/2018/leaderboards", { query: {compeition:competition, year:year, division:division, scaled:scaled, sort:sort, fittest:fittest, fittest1:fittest1, occupation: occupation, page:1}})
    results['totalpages']
  end

  def store_for_filter(competition, year, division, scaled, fittest, fittest1, occupation, sort, page, batch)
    results = self.class.get("/competitions/api/v1/competitions/open/2018/leaderboards", { query: {compeition:competition, year:year, division:division, scaled:scaled, sort:sort, fittest:fittest, fittest1:fittest1, occupation: occupation, page:page}})

    wod = Wod.find_by_name('17.1')

    results['athletes'].each do |athlete|
      userid = athlete['userid']
      model = Athlete.find_by_userid(userid)

      if !model
        model = Athlete.create({
                               name: athlete['name'],
                               userid: userid,
                               regionid: athlete['regionid'],
                               region: athlete['region'],
                               division: athlete['division'],
                               height: athlete['height'],
                               weight: athlete['weight'],
                               profilepic: athlete['profilepic'],
                               age: athlete['age'],
                               affiliateid: athlete['affiliateid'],
                               affiliate: athlete['affiliate']})
      end


      # Set scores properly for 17.1
      score = athlete['scores'][0]
      athlete_score = model.athlete_scores.where(wod: wod).first

      if !athlete_score
        athlete_score = wod.athlete_scores.create({athlete:model})
      end

      scoredetails = score['scoredetails']
      scoredisplay = score['scoredisplay']
      if scoredetails && scoredetails['time']
        time = scoredisplay.include?('- s') ? 1200 : scoredetails['time']
        athlete_score.update_attributes({score: time})
      elsif scoredetails && !scoredisplay.include?('reps')
        athlete_score.update_attributes({score: convert_string_to_time(score['scoredisplay']), breakdown: scoredetails['breakdown']}) # team
      else
        athlete_score.update_attributes({score: 99999})
      end
    end
  end

  def sanitize(str)
    ActiveRecord::Base::sanitize(str)
  end

  def convert_string_to_time(str)
    split = str.split(':')
    return split[0].to_i*3600 + split[1].to_i*60 + split[2].to_i
  end

end




