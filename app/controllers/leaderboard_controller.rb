class LeaderboardController < ApplicationController
  RESULTS_PER_PAGE = 50

  def open; end
  def regionals; end
  def online_qualifier; end
  def games; end
  def cross_regional; end

  def filter
    filter_params
    page = !filter_params[:page].blank? ? filter_params[:page] : 1
    competition = filter_params.has_key?(:competition) ? filter_params[:competition] : 1
    year = filter_params.has_key?(:year) ? filter_params[:year] : 2019
    scaled = 0
    fittest = 1
    division = filter_params[:division]
    regional = filter_params[:regional]
    games = filter_params[:games]
    fittest1 = filter_params[:fittest1].to_i
    occupation = 0
    sort = filter_params[:sort]
    athlete = params[:athlete_id] 

    is_online_qualifier = competition == '4'

    if is_online_qualifier
      results = scraper.filter_online_qualifier(division, year, sort, page)
      return render partial:'online_qualifier_results', locals:{page:page, results_per_page:RESULTS_PER_PAGE, results:results, current_page: page, last_page:results['totalpages'].to_i, athlete:athlete}
    elsif regional
      results = scraper.filter_regional(division, year, regional, sort, page)
      hash = JSON.parse(results.body)
      return render partial:'regional_results', locals:{page:page, results_per_page:RESULTS_PER_PAGE, results:results, current_page: page, last_page:hash['pagination']['totalPages'].to_i, athlete:athlete}
    elsif games
      results = scraper.filter_games(division, year, sort, page)
      return render partial:'games_results', locals:{page:page, results_per_page:RESULTS_PER_PAGE, results:results, current_page: page, last_page:results['totalpages'].to_i, athlete:athlete}
    else
      results = scraper.filter(competition, year, division, scaled, fittest, fittest1, occupation, sort, athlete, page)
      return render partial:'results', locals:{page:page, results_per_page:RESULTS_PER_PAGE, results:results, current_page: page, last_page:results['pagination']['totalpages'].to_i, athlete:athlete}
    end
  end

  def filter_regional
    division = filter_params[:division]
    sort = filter_params[:sort]

    athletes = RegionalAthlete.get(division)

    render partial:'results_cross_regional', locals:{results:order_athletes(athletes, sort)}
  end

  def search
    print "in search"
    render json: scraper.search(params[:q], params[:division]).map{|i| {label: i['name'] + ' - ' + i['affiliate'], id: i['id']}}
  end


  def filter_params
    params.require(:filter).permit!
  end

  private
  def scraper
    @scraper ||= Scraper.new
  end

  def order_athletes(athletes,workout)
    workout = workout.to_i

    if workout == 0
      athletes.order(points_overall: :desc)
    elsif workout == 1
      athletes.order(:score_1_rank)
    elsif workout == 2
      athletes.order(:score_2_rank)
    elsif workout == 3
      athletes.order(:score_3_rank)
    elsif workout == 4
      athletes.order(:score_4_rank)
    elsif workout == 5
      athletes.order(:score_5_rank)
    elsif workout == 6
      athletes.order(:score_6_rank)
    else
      raise 'bad workout'
    end
  end
end
