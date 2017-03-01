class LeaderboardController < ApplicationController
  RESULTS_PER_PAGE = 50

  def index; end

  def filter
    filter_params
    page = params[:page] ? params[:page] : 1
    competition = 1
    year = 2017
    scaled = 0
    fittest = 1
    division = filter_params[:division]
    fittest1 = filter_params[:fittest1].to_i
    occupation = 0
    sort = filter_params[:sort]

    #results = AthleteScore.joins('INNER JOIN athletes on athletes.id = athlete_scores.athlete_id').order('athlete_scores.score ASC').where('athlete_scores.score > 500')
    #results = results.where('athletes.division = ?', division)
    #results = results.where('athletes.regionid = ?', fittest1) if fittest1 > 0
    #results = results[(page-1)*RESULTS_PER_PAGE,RESULTS_PER_PAGE]

    results = scraper.filter(competition, year, division, scaled, fittest, fittest1, occupation, sort, 1)

    render partial:'results', locals:{page:page, results_per_page:RESULTS_PER_PAGE, results:results}
  end


  def filter_params
    params.require(:filter).permit!
  end

  private
  def scraper
    @scraper ||= Scraper.new
  end
end