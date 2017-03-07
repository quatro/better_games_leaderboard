class LeaderboardController < ApplicationController
  RESULTS_PER_PAGE = 50

  def index; end

  def filter
    filter_params
    page = !filter_params[:page].blank? ? filter_params[:page] : 1
    competition = 1
    year = 2017
    scaled = 0
    fittest = 1
    division = filter_params[:division]
    fittest1 = filter_params[:fittest1].to_i
    occupation = 0
    sort = filter_params[:sort]
    athlete = params[:athlete_id] 

    results = scraper.filter(competition, year, division, scaled, fittest, fittest1, occupation, sort, athlete, page)
    render partial:'results', locals:{page:page, results_per_page:RESULTS_PER_PAGE, results:results, current_page: page, last_page:results['totalpages'].to_i, athlete:athlete}
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
end
