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

    results = scraper.filter(competition, year, division, scaled, fittest, fittest1, occupation, sort, page)

    render partial:'results', locals:{page:page, results_per_page:RESULTS_PER_PAGE, results:results, current_page: page, last_page:results['totalpages'].to_i}
  end

  def search
    render json: scraper.search(params[:q], params[:division]).map{|i| {label: i['name'], id: i['id']}}
  end


  def filter_params
    params.require(:filter).permit!
  end

  private
  def scraper
    @scraper ||= Scraper.new
  end
end