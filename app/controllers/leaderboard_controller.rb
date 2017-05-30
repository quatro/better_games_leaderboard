class LeaderboardController < ApplicationController
  RESULTS_PER_PAGE = 50

  def open; end
  def regionals; end
  def games; end

  def filter
    filter_params
    page = !filter_params[:page].blank? ? filter_params[:page] : 1
    competition = 1
    year = 2017
    scaled = 0
    fittest = 1
    division = filter_params[:division]
    regional = filter_params[:regional]
    fittest1 = filter_params[:fittest1].to_i
    occupation = 0
    sort = filter_params[:sort]
    athlete = params[:athlete_id] 

    if regional
      results = scraper.filter_regional(division, regional, sort, page)
      return render partial:'regional_results', locals:{page:page, results_per_page:RESULTS_PER_PAGE, results:results, current_page: page, last_page:results['totalpages'].to_i, athlete:athlete}
    else
      results = scraper.filter(competition, year, division, scaled, fittest, fittest1, occupation, sort, athlete, page)
      return render partial:'results', locals:{page:page, results_per_page:RESULTS_PER_PAGE, results:results, current_page: page, last_page:results['totalpages'].to_i, athlete:athlete}
    end
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
